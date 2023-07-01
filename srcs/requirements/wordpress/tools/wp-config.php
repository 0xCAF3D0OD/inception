<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'QjUd={xO2nB_U$?O5JfIq*FW1o.$Yc,:m:wZ{W(+}|2sNT|(8w8<zgc70SFsL:va');
define('SECURE_AUTH_KEY',  'IO$B8@LiNWrvv?D 0=+yKD|Qxnd)aMxj%IQB9@0pTo+aq3j`k<IeEJb;N[PY:NA?');
define('LOGGED_IN_KEY',    'Y<JaVcs]3t H?wfa!}ar>6tz>dX0rm1Ot-se:Ssc>+h8mX-NulbMGc;Op21:v:3]');
define('NONCE_KEY',        'AevY(6ke=B`(xS]#<(j9*P;}G0I`v5AUUF(h}X)y.Vrr5r|mDM4ztz!IL8PBw~Y(');
define('AUTH_SALT',        'e&@,rt(G@_K&cT[rvm}e21M+KlMRE[hqP`UwU}.960(}WoPQ;B)a@D-<4#Lsd6#+');
define('SECURE_AUTH_SALT', ')8Y-(|19z/sQ&MLvQ4-?V$8:| %_>5ll;+NVk1>noKZeP:BC(V&+oDpBy ~o`]/1');
define('LOGGED_IN_SALT',   'zDb&l3~6]P~[q-04|aPQ->-TMaAj,#r}t k9[<7&yHlS6:/M?/U3cm^$*o=s{8Z-');
define('NONCE_SALT',       'qEJU3zoPn2%}(!)Nqt~^&[] Ib|?Zm-^EX6.5c,ID*:qC=E>x)27Km7Q>ze~]-s.');

/*
	define( 'AUTH_KEY',         'put your unique phrase here' );
	define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
	define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
	define( 'NONCE_KEY',        'put your unique phrase here' );
	define( 'AUTH_SALT',        'put your unique phrase here' );
	define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
	define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
	define( 'NONCE_SALT',       'put your unique phrase here' );
*/
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
