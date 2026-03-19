<?php
    session_start();
    include("../settings/connect_datebase.php");
    
    $ip = getClientIP();
    $current_time = time();

    $mysqli->query("CREATE TABLE IF NOT EXISTS `reg_attempts_ip` (
        `ip` VARCHAR(45) NOT NULL,
        `last_request_time` INT NOT NULL,
        `request_count` INT DEFAULT 1,
        PRIMARY KEY (`ip`)
    )");

    $mysqli->query("DELETE FROM `reg_attempts_ip` WHERE `last_request_time` < " . ($current_time - 10));

    $stmt_ip = $mysqli->prepare("SELECT `request_count`, `last_request_time` FROM `reg_attempts_ip` WHERE `ip` = ?");
    $stmt_ip->bind_param("s", $ip);
    $stmt_ip->execute();
    $res_ip = $stmt_ip->get_result()->fetch_assoc();

    if ($res_ip) {
        if ($res_ip['request_count'] >= 2) { 
            http_response_code(429);
            die("Слишком много попыток регистрации с вашего IP. Подождите.");
        }
        $mysqli->query("UPDATE `reg_attempts_ip` SET `request_count` = `request_count` + 1 WHERE `ip` = '$ip'");
    } else {
        $stmt_insert_ip = $mysqli->prepare("INSERT INTO `reg_attempts_ip` (ip, last_request_time, request_count) VALUES (?, ?, 1)");
        $stmt_insert_ip->bind_param("si", $ip, $current_time);
        $stmt_insert_ip->execute();
    }

    $login = $_POST['login'];
    $password = $_POST['password'];
    
    $stmt = $mysqli->prepare("SELECT id FROM `users` WHERE `login` = ?");
    $stmt->bind_param("s", $login);
    $stmt->execute();
    $query_user = $stmt->get_result();
    $id = -1;
    
    if($user_read = $query_user->fetch_assoc()) {
        echo $id;
    } else {
        $stmt_reg = $mysqli->prepare("INSERT INTO `users`(`login`, `password`, `roll`) VALUES (?, ?, 0)");
        $stmt_reg->bind_param("ss", $login, $password);
        $stmt_reg->execute();
        
        $stmt_find = $mysqli->prepare("SELECT id FROM `users` WHERE `login` = ? AND `password` = ?");
        $stmt_find->bind_param("ss", $login, $password);
        $stmt_find->execute();
        $user_new = $stmt_find->get_result()->fetch_assoc();
        
        if($user_new) {
            $id = $user_new['id'];
            $_SESSION['user'] = $id;
        }
        echo $id;
    }
?>