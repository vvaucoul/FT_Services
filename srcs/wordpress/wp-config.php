<?php

define('DB_NAME', 'wordpress');
define('DB_USER', 'admin');
define('DB_PASSWORD', 'passwd');
define('DB_HOST', 'mysql-service');
define('DB_CHARSET', 'utf8');
define('FS_METHOD', 'direct');
define('DB_COLLATE', '');

define('AUTH_KEY',         '4x1aS+enQj57?cz2O>:(TY!;FTGm=<75URef1<iK,S;(*0H>Ydt0|Hh{e*4`jvvm');
define('SECURE_AUTH_KEY',  '?7q%b[-JahYnf*`l`JLrN)?B,:3K+5f4*;t*B_sH50MAqC]OPy[YFj4+_aJa[_n~');
define('LOGGED_IN_KEY',    '(s--qrxZ[`Q|WRN=8c)23]/RC8dpQmQ=6&dcPxIg`rw5Fp89%>Fy?[Y,{3{mBRBB');
define('NONCE_KEY',        'v[A5o9|EWyzX3gwZwoi*>wt4XAjy/P<2I%ICntBHh+rBef#,IUz)Ykn,GM22cgp_');
define('AUTH_SALT',        '`|g+|zuMt8Gh;b}W+{#mWR1RU{)]-EH+^}h0D)6Gb0:m-b9FLEW&qU~_W8$/R<72');
define('SECURE_AUTH_SALT', '26iU,W`1:=t|*}WN>%|y54+^4/re4CsOq%Ft9#|7[T^&Lf61/[36ZY~ 5&XW3]KB');
define('LOGGED_IN_SALT',   'R{TM-tni=* N_is+X #e2NLR!>Obj6WTR% c~.b1sC/Uo/K/}%O$mMO5BL%.}j-h');
define('NONCE_SALT',       'p-,c%|pS%=po;Zm|S}gP>RS|N!)Y=!C+:-Y)}&=i>`GF0P{o$icY+kh ZvdxEh%-');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if (!defined('ABSPATH'))
	define('ABSPATH', dirname(__FILE__) . '/var/www/wordpress');

require_once(ABSPATH . 'wp-settings.php');
