<!-- User login -->

<!-- Secure php file -->
<?php
if ($_SERVER['REQUEST_URI'] == "/nav-bar_out.php") {
	header("Location: errorpage");
}?>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="assets/css/custom.css">

<nav class="navbar navbar-light navbar-expand-xl fixed-top bounce animated navigation-clean-search" id="mainNav">
    <div class="container"><a class="navbar-brand js-scroll-trigger" data-bs-hover-animate="pulse" href="#page-top" style="font-size:32px;color:rgb(32,143,143);">SpotMusic</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon" style="background-image:url(&quot;assets/img/small_menu.png&quot;);"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#artists">Artists</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#musicgenres">Music Genres</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#bands">Bands</a>
            </li>           
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About</a>
            </li>
          </ul>
			<form class="form-inline mr-auto" target="_self">
            <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" onfocus="this.value=''" type="search" name="search" id="search-field"></div>
			</form>
			<ul class="nav navbar-nav navbar-right ml-auto" id="mainNav">
			<li class="dropdown">
				<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle"><?php echo $_SESSION["username"]; ?><b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="https://spotdm.prolingua.gr" target="_blank" class="dropdown-item"><i class="fa fa-play-circle"></i> Goto WebPlayer </a></li>
					<li><a href="add_bands.php" target="_blank" class="dropdown-item"><i class="fa fa-plus-square"></i> Add Bands </a></li>
					<li><a href="add_artists.php" target="_blank" class="dropdown-item"><i class="fa fa-plus-square"></i> Add Artists </a></li>
					<li><a href="add_genres.php" target="_blank" class="dropdown-item"><i class="fa fa-plus-square"></i> Add Genres </a></li>
					<li><a href="reset-password.php" target="_blank" class="dropdown-item"><i class="fa fa-sliders"></i> Change password </a></li>
					<li class="divider dropdown-divider"></li>
					<li><a href="logout.php" class="dropdown-item"><i class="material-icons">&#xE8AC;</i>Logout</a></li>
				</ul>
			</li>
		</div>
	</div>
</nav>

<!--
data-toggle="modal" data-target="#add_bands"
data-toggle="modal" data-target="#add_artists"
-->