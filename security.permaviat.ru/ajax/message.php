<?php
    session_start();
    include("../settings/connect_datebase.php");

    $ip = getClientIP();
    $current_time = time();

    $mysqli->query("CREATE TABLE IF NOT EXISTS `comment_attempts_ip` (
        `ip` VARCHAR(45) NOT NULL,
        `last_request_time` INT NOT NULL,
        `request_count` INT DEFAULT 1,
        PRIMARY KEY (`ip`)
    )");

    $mysqli->query("DELETE FROM `comment_attempts_ip` WHERE `last_request_time` < " . ($current_time - 15));

    $stmt_ip = $mysqli->prepare("SELECT `request_count`, `last_request_time` FROM `comment_attempts_ip` WHERE `ip` = ?");
    $stmt_ip->bind_param("s", $ip);
    $stmt_ip->execute();
    $res_ip = $stmt_ip->get_result()->fetch_assoc();

    if ($res_ip) {
        if ($res_ip['request_count'] >= 1) {
            http_response_code(429);
            die("Слишком частые комментарии с вашего IP. Подождите.");
        }
        $mysqli->query("UPDATE `comment_attempts_ip` SET `request_count` = `request_count` + 1 WHERE `ip` = '$ip'");
    } else {
        // Если записи нет, создаем новую
        $stmt_insert_ip = $mysqli->prepare("INSERT INTO `comment_attempts_ip` (ip, last_request_time, request_count) VALUES (?, ?, 1)");
        $stmt_insert_ip->bind_param("si", $ip, $current_time);
        $stmt_insert_ip->execute();
    }

    $IdUser = $_SESSION['user'];
    $Message = $_POST["Message"];
    $IdPost = $_POST["IdPost"];

    $stmt_msg = $mysqli->prepare("INSERT INTO `comments`(`IdUser`, `IdPost`, `Messages`) VALUES (?, ?, ?)");
    $stmt_msg->bind_param("iis", $IdUser, $IdPost, $Message);
    $stmt_msg->execute();
?>