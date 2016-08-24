#! /usr/bin/php

<?php
    $raw_passwd = 'tiger';

	echo $raw_passwd . PHP_EOL;
    echo 'PASSWORD_DEFAULT' . PHP_EOL;
    $hashed_passwd = password_hash($raw_passwd,
                                   PASSWORD_DEFAULT);
    echo ' hash:' . $hashed_passwd . PHP_EOL;
?>
