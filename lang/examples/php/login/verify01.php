#! /usr/bin/php

<?php
$hash = '$2y$10$MCQtQh6r4w2Yk67BGITaluAfiytuQioLkKCVDUTgexjpCAhJrZjrS';

        $correct_password = 'tiger';
        var_dump(password_verify($correct_password, $hash));

        $incorrect_password = 'abcde';
        var_dump(password_verify($incorrect_password, $hash));
?>
