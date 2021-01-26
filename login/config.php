<?php
// PHP: Security
if ($_SERVER['REQUEST_URI'] == "/login/config.php") {
	header("Location: ../errorpage");
}

/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_SERVER', 'localhost'); // Host DEFAULT: localhost
define('DB_USERNAME', 'root'); // Database Username DEFAULT: root
define('DB_PASSWORD', ''); // Database Password
define('DB_NAME', 'spotmusic_db'); // Database Name DEFAULT: spotmusic_db
 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>