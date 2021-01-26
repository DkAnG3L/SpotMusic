<!-- User no login 
// Include login-system file -->
<?php 
include 'login/login-system.php';
require_once "config/settings.php";

// PHP: Security
if ($require_login) {
	header("Location: ../errorpage");
}
?>
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
			<ul class="nav navbar-nav navbar-right ml-auto">			
				<li class="nav-item">
					<a data-toggle="dropdown" class="nav-link dropdown-toggle" href="#" style="color:rgb(32,143,143);">Login</a>
						<ul class="dropdown-menu login-form modal-login">					
						<li>
						<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
							<div class="form-group <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
								<i class="fa fa-user"></i>
								<input type="text" class="form-control" onfocus="this.value=''" name="username" placeholder="Username" required="required">
								<span class="help-block"><?php echo $username_err; ?></span>
							</div>
							<div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
								<i class="fa fa-lock"></i>
								<input type="password" class="form-control" onfocus="this.value=''" name="password" placeholder="Password" required="required">
								<span class="help-block"><?php echo $password_err; ?></span>
								<a href="login/login.php" class="pull-left text-muted fa fa-clone fix" title="Click to fullsize" target="_blank"></a>
								<a href="#" class="pull-right text-muted fix"><small>Forgot your email or password?</small></a>
							</div>
							<input type="submit" class="btn btn-primary btn-block" value="Login">
						</form>
					</li>
				</ul>
			</li>
			</ul>
			<a class="btn btn-primary btn-lg action-button" role="button" href="login/register.php">Sign Up</a>
		</div>
	</div>
</nav>