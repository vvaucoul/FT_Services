<?php

$cfg['blowfish_secret'] = '3Q0PzfZ4DMUj7]3e4rGnEH-eE1XA/AO0';

$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['Servers'][$i]['host'] = 'mysql-service';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'admin';
$cfg['Servers'][$i]['password'] = 'passwd';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
