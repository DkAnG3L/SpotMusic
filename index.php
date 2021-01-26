<?php 
include 'config/database.php';
include 'config/settings.php';
?>
<!DOCTYPE html>
<html lang="en">

  <head>
	
	<!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<!-- Title -->
    <title>SpotMusic</title>
	
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	
	<!-- Custom fonts for this template -->
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
	
	<!-- Animate style for this template -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
	
	<!-- Custom styles for this template -->
    <link rel="stylesheet" href="assets/css/Article-List.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/full-slider.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/News-Cards.css">
    <link rel="stylesheet" href="assets/css/Projects-Clean.css">
    <link rel="stylesheet" href="assets/css/Projects-Horizontal.css">
	<link rel="stylesheet" href="assets/css/css.modal.css">
	<link rel="stylesheet" href="assets/css/Team-Boxed.css">
    <link rel="stylesheet" href="assets/css/Team-Clean.css">
    <link rel="stylesheet" href="assets/css/grayscale.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/Team-Grid.css">
	
</head>

<!-- The scrollable area -->
<body data-spy="scroll" data-target=".navbar" data-offset="1" id="page-top">

<?php include 'status.php';?>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('<?php echo $first_slide_img; ?>')">
            <div class="carousel-caption d-none d-md-block">
              <h3 style="color:<?php echo $slide_color_title; ?>"><?php echo $first_slide_title; ?></h3>
              <p style="color:<?php echo $slide_color_msg; ?>"><?php echo $first_slide_msg; ?></p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('<?php echo $second_slide_img; ?>')">
            <div class="carousel-caption d-none d-md-block">
              <h3 style="color:<?php echo $slide_color_title; ?>"><?php echo $second_slide_title; ?></h3>
              <p style="color:<?php echo $slide_color_msg; ?>"><?php echo $second_slide_msg; ?></p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('<?php echo $third_slide_img; ?>')">
            <div class="carousel-caption d-none d-md-block">
              <h3 style="color:<?php echo $slide_color_title; ?>"><?php echo $third_slide_title; ?></h3>
              <p style="color:<?php echo $slide_color_msg; ?>"><?php echo $third_slide_msg; ?></p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
	  	<div data-bs-parallax-bg="true" style="height:500px;background-image:url(&quot;assets/img/bg scroll/bg_scroll_05.jpg&quot;);background-position:center;background-size:cover;"></div>
    <div class="team-clean">
        <div class="container">
            <div class="intro" id="artists">
                <h2 class="text-center" style="color:<?php echo $gl_title_color; ?>">Artists</h2>
            </div>
            <div class="row people" id="artists_data">
				<?php include 'paging-artists.php'; ?>
            </div>
			<div align="center" style="margin-bottom:25px;">
				<?php
				// display the artists links to the pages
				for($i=1; $i<=$total_pages; $i++)  
				{ ?>
					<?php if ($total_pages > 1) { ?>
					<span class="artists_link"  style="cursor:pointer; padding:6px; border:1px solid #ccc; color:#208f8f" id="<?php echo $i; ?>"><?php echo $i; ?></span>
				<?php } ?>
			<?php } ?>
			</div>
        </div>
    </div>
		<div data-bs-parallax-bg="true" style="background-image:url(&quot;assets/img/bg scroll/bg_scroll_06.jpg&quot;);background-position:center;background-size:cover;height:500px;"></div>
    <div class="projects-clean" ></div>
	<div class="projects-horizontal"></div>
		<div class="projects-clean">
			<div class="container">
				<div class="intro" id="musicgenres">
					<h2 class="text-center" style="color:<?php echo $gl_title_color; ?>">Music Genres<br></h2>
				</div>
				<div class="row projects" id="genres_data">
				<?php include 'paging-genres.php'; ?>
				</div>
				<div align="center" style="margin-bottom:25px;">
				<?php
				// display the genres links to the pages
				for($i=1; $i<=$total_pages; $i++)  
					{ ?>
						<?php if ($total_pages > 1) { ?>
						<span class="genres_link" style="cursor:pointer; padding:6px; border:1px solid #ccc; color:#208f8f" id="<?php echo $i; ?>"><?php echo $i; ?></span>
					<?php } ?>
				<?php } ?>
				</div>
            </div>
        </div>
    </div>
	<div data-bs-parallax-bg="true" style="background-image:url(&quot;assets/img/bg scroll/bg_scroll_04.jpg&quot;);background-position:center;background-size:cover;height:500px;"></div>
    <div class="projects-horizontal"></div>
    <div class="article-list">
        <div class="container">
            <div class="intro" id="bands">
                <h2 class="text-center" style="color:<?php echo $gl_title_color; ?>">Bands</h2>
            </div>
            <div class="row articles" id="bands_data">
				<?php include 'paging-bands.php'; ?>
            </div>
			<div align="center" style="margin-bottom:25px;">
				<?php
				// display the links to the pages
				for($i=1; $i<=$total_pages; $i++)  
				{ ?>
					<?php if ($total_pages > 1) { ?>
					<span class="bands_link" style="cursor:pointer; padding:6px; border:1px solid #ccc; color:#208f8f" id="<?php echo $i; ?>"><?php echo $i; ?></span>
				<?php } ?>
			<?php } ?>
			</div>
        </div>
    </div>
	<div data-bs-parallax-bg="true" style="height:500px;background-image:url(&quot;assets/img/bg scroll/bg_scroll_07.jpg&quot;);background-position:center;background-size:cover;"></div>
	<div class="team-grid">
        <div class="container">
            <div class="intro" id="about">
                <h2 class="text-center" style="color:<?php echo $gl_title_color; ?>">About</h2>
            </div>
            <div class="row people">
                <div class="col-md-4 col-lg-3 item"></div>
                <div class="col-md-4 col-lg-3 item">
                    <div class="box" style="background-image:url(<?php echo $pp1_image; ?>)">
                        <div class="cover">
                            <h5 class="name"><?php echo $pp1_name; ?></h5>
                            <p class="title"><?php echo $pp1_title; ?></p>
                            <div class="social">
								<a href="<?php echo $pp1_social1; ?>" target="_blank"><i class="<?php echo $pp1_icon1; ?>"></i></a>
								<a href="<?php echo $pp1_social2; ?>" target="_blank"><i class="<?php echo $pp1_icon2; ?>"></i></a>
								<a href="<?php echo $pp1_social3; ?>" target="_blank"><i class="<?php echo $pp1_icon3; ?>"></i></a>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-3 item">
                    <div class="box" style="background-image:url(<?php echo $pp2_image; ?>)">
                        <div class="cover">
                            <h5 class="name"><?php echo $pp2_name; ?></h5>
                            <p class="title"><?php echo $pp2_title; ?></p>
                            <div class="social">
								<a href="<?php echo $pp2_social1; ?>" target="_blank"><i class="<?php echo $pp2_icon1; ?>"></i></a>
								<a href="<?php echo $pp2_social2; ?>" target="_blank"><i class="<?php echo $pp2_icon2; ?>"></i></a>
								<a href="<?php echo $pp2_social3; ?>" target="_blank"><i class="<?php echo $pp2_icon3; ?>"></i></a>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-3 item"></div>
            </div>
        </div>
    </div>
	<!-- Modal artists.php -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Artist Info</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="dash">
						<?php include 'artists.php';?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal add_bands.php -->
	<div class="modal fade" id="add_bands" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add your own bands.</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<?php //include 'add_bands.php'; ?>
				</div>
			</div>
		</div>
	</div>	
	<!-- Modal add_artists.php -->
	<div class="modal fade" id="add_artists" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add your own artists.</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<?php //include 'add_artists.php'; ?>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal register.php -->
	<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">SpotMusic - Registration form. </h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<?php //include 'register.php'; ?>
				</div>
			</div>
		</div>
	</div>
    <div class="footer-basic" style="background-image:url(&quot;assets/img/bg_footer.png&quot;);background-color:rgb(49,52,55);">
        <footer>
            <div class="social"><a href="#" data-bs-hover-animate="tada"><i class="icon ion-social-instagram" style="color:rgb(32,143,143);"></i></a><a href="#" data-bs-hover-animate="tada"><i class="icon ion-social-snapchat" style="color:rgb(32,143,143);"></i></a><a href="#"
                    data-bs-hover-animate="tada"><i class="icon ion-social-twitter" style="color:rgb(32,143,143);"></i></a><a href="#" data-bs-hover-animate="tada"><i class="icon ion-social-facebook" style="color:rgb(32,143,143);"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#page-top" class="js-scroll-trigger" style="color:<?php echo$gl_color ?>">Home</a></li>
                <li class="list-inline-item"><a href="#artists" class="js-scroll-trigger" style="color:<?php echo$gl_color ?>">Artists</a></li>
                <li class="list-inline-item"><a href="#musicgenres" class="js-scroll-trigger" style="color:<?php echo$gl_color ?>">Music Genres</a></li>
                <li class="list-inline-item"><a href="#bands" class="js-scroll-trigger" style="color:<?php echo$gl_color ?>">Bands</a></li>
                <li class="list-inline-item"><a href="#about" class="js-scroll-trigger" style="color:<?php echo$gl_color ?>">About</a></li>
            </ul>
            <p class="copyright" style="font-size:16px;">SpotMusic © 2019</p>
        </footer>
    </div>

	<!-- Plugin JavaScript -->
    <script src="assets/jquery/jquery.min.js"></script>
	<script src="assets/jquery/jquery.easing.min.js"></script>
	
	<!-- Bootstrap core JavaScript -->
	<!--<script src="assets/bootstrap/js/bootstrap.min.js"></script>-->
	<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
    
	<!-- Animate JavaScript -->
    <script src="assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
	
	<!-- Custom scripts for this template -->
    <script src="assets/js/grayscale.min.js"></script>
	<script src="assets/js/paging.js"></script>
	
	<script>
    $('#exampleModal').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget) // Button that triggered the modal
          var recipient = button.data('whatever') // Extract info from data-* attributes
          var modal = $(this);
          var dataString = 'id=' + recipient;

            $.ajax({
                type: "GET",
                url: "artists.php",
                data: dataString,
                cache: false,
                success: function (data) {
                    console.log(data);
                    modal.find('.dash').html(data);
                },
                error: function(err) {
                    console.log(err);
                }
            });
    })
	</script>
	
</body>

</html>