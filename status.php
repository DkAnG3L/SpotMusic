<?php

include 'config/settings.php';

// Initialize the session
session_start();

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
	if ($require_login) {
	header("location: login/login.php");
	exit;
	}
	include 'nav-bar_in.php';

}
else {
	include 'nav-bar_out.php';
}
?>