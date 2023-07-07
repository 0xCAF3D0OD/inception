<?php

define('WP_CACHE', true);

define( 'DB_NAME', 'mariadb' );

define( 'DB_USER', 'kdi-noce' );

define( 'DB_PASSWORD', '12345' );

define( 'DB_HOST', 'mariadb' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('AUTH_KEY',         '+d -e=glbgkd68-L&T|f`1u&X5]FpZ%&LA7mPx$<v^-HZ3F3xo7eQ4fhn.ci#u_j');
define('SECURE_AUTH_KEY',  'Gr-%[MKZs7f$CvL%`ZMk)]h&y3NoZGwe Yko[(.jS (MV1UV/BtT`6OQ8r,Q.j_j');
define('LOGGED_IN_KEY',    'hU!^gR< 1_J7]wK PC`)<%OUaQ..xktn,cHKiEc3i|OH/Z=h|b9J59qn>bSU|o3E');
define('NONCE_KEY',        'h++|8c-%(PdLVw0C2hP:],j#)|-Jy[Ob>a61(QFB=Bi`vDprJw4|+[!IEe6s2#)V');
define('AUTH_SALT',        '$9(--7uzkUf)KXiv=rf9_-3)R^I,~2P[SDm@WKX|pt%!7PpaIGL=AOrKSRE:#0&b');
define('SECURE_AUTH_SALT', '[|V)`|7z#S} ^|wS+g+DT(pegQXIrp~!BiX!>AeW4q7(Q1csVu4k<Wz9?q-M|Wm0');
define('LOGGED_IN_SALT',   'm%}>54|]rKbbQ>c*FD*XY-~;n.L$dN~#BU$-L|OEt+y.5>|4U4A#k2d$:Lcd|sl0');
define('NONCE_SALT',       'es`fdT|ezwA)sR]:X-dvxB#25]%B!;WY@UsQfxPuUa#OG@DrG9b<Rp3Ea|+J:JJ:');

$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';

?>
