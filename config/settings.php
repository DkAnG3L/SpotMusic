<?php
// PHP: Security
if ($_SERVER['REQUEST_URI'] == "/config/settings.php") {
	header("Location: ../errorpage");
}

/** Global Settings **/

//Global title color (Default: #208f8f) 
$gl_title_color = '#208f8f';
$gl_color = '#208f8f';

//Required login to view the website (Default: False)
$require_login = false;

/** Slide Settings **/

//Slide One - Set the background image for this slide in the line below (eg: assets/img/head/head_slider_01.jpg)
//This title messanger for first slide (Default: First Slide)
//This is a description for the first slide.
$first_slide_img = 'assets/img/head/head_slider_01.jpg';
$first_slide_title = 'Bring music to life';
$first_slide_msg = 'Dance to the rhythm of your heart. ';


//Slide Two - Set the background image for this slide in the line below (eg: assets/img/head/head_slider_02.jpg)
//This title messanger for first slide (Default: Second Slide)
//This is a description for the second slide.
$second_slide_img = 'assets/img/head/head_slider_02.jpg';
$second_slide_title = 'When words fail, music speaks';
$second_slide_msg = 'The sweetest music this side of heaven. ';


//Slide Three - Set the background image for this slide in the line below (eg: assets/img/head/head_slider_03.jpg)
//This title messanger for first slide (Default: Third Slide)
//This is a description for the third slide.
$third_slide_img = 'assets/img/head/head_slider_03.jpg';
$third_slide_title = 'Let the Music Speak!';
$third_slide_msg = 'Music is the universal language of mankind. ';

//Set color to slide title (Default: #208f8f)
//set color to slide description (Default: false)
$slide_color_title = '#208f8f';
$slide_color_msg = '';

/** Artist Settings **/

//Amount of artists to appear (Default: 6)
$art_amount_set = 6;

//Increase the delay per round (Default: 250) set 0 to false
$art_round_delay = 250;


/** Music Genres **/

//Amount of genres to appear (Default: 6)
$mg_amount_set = 6;

//Increase the delay per round (Default: 250) set 0 to false
$mg_round_delay = 250;

//Genres title color (Default: #208f8f) 
$mg_title_color = '#208f8f';

//Year number and fa icon color (Default: #208f8f)
$mg_year_color = '#208f8f';

//Fa icon change (Default: fa fa-calendar)
//Bootstrap icons http://www.bootstrapicons.com
$mg_bootstrap_icon = 'fa fa-calendar';

/** Discographies - Settings **/

//Amount of discography to appear (Default: 6)
$dsk_amount_set = 6;

//Increase the delay per round (Default: 250) set 0 to false
$dks_round_delay = 250;

/** About - Setup **/

//Select your image (Default: assets/img/about/student_male.jpg) 
$pp1_image = 'assets/img/about/student_male.jpg';

//Your full name
$pp1_name = 'Αγγελος Π.';

//Hobby (Default: Student)
$pp1_title = 'Student';

// Social 1 (Default: https://www.facebook.com/)
$pp1_social1 = 'https://www.facebook.com/';

// Link: http://bootstrapicons.com/index.htm?iconset=fontawesome&version=4.0.3
// Social icons (Default: fa fa-facebook-square)
$pp1_icon1 = 'fa fa-facebook-square';

// Social 2 (Default: https://www.instagram.com/)
$pp1_social2 = 'https://www.instagram.com/';

// Social icons (Default: fa fa-instagram)
$pp1_icon2 = 'fa fa-instagram';

// Social 3 (Default: https://twitter.com/)
$pp1_social3 = 'https://twitter.com/';

// Social icons (Default: fa fa-twitter-square)
$pp1_icon3 = 'fa fa-twitter-square';

//Select your image (Default: assets/img/about/student_famele.jpg) 
$pp2_image = 'assets/img/about/student_famele.jpg';

//Your full name
$pp2_name = 'Νίκη Π.';

//Hobby (Default: Student)
$pp2_title = 'Student';

// Social  1 (Default: https://www.facebook.com/)
$pp2_social1 = 'https://www.facebook.com/';

// Link: http://bootstrapicons.com/index.htm?iconset=fontawesome&version=4.0.3
// Social icons (Default: fa fa-facebook-square)
$pp2_icon1 = 'fa fa-facebook-square';

// Social 2 (Default: https://www.instagram.com/)
$pp2_social2 = 'https://www.instagram.com/';

// Social icons (Default: fa fa-instagram)
$pp2_icon2 = 'fa fa-instagram';

// Social 3 (Default: https://twitter.com/)
$pp2_social3 = 'https://twitter.com/';

// Social icons (Default: fa fa-twitter-square)
$pp2_icon3 = 'fa fa-twitter-square';


?>