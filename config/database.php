<?php 
// PHP: Security
if ($_SERVER['REQUEST_URI'] == "/config/database.php") {
	header("Location: ../errorpage");
}

/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$DB_SERVER = 'localhost'; // Host DEFAULT: localhost
$DB_USERNAME = 'root';  // Database Username DEFAULT: root
$DB_PASSWORD = ''; // Database Password
$DB_NAME = 'spotmusic_db'; // Database Name DEFAULT: spotmusic_db

/* Attempt to connect to MySQL database */
$conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME);

// Check connection
if($conn === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>