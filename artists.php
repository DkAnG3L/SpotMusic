<?php 
include 'config/database.php';
include 'config/settings.php';
$id = $_GET['id'];
?>

<!DOCTYPE html>
<html lang="en">

  <head>
	
	<!-- Custom styles for this template -->
    <link href="assets/css/portfolio-item.css" rel="stylesheet">
	
  </head>
	<?php 
	$sql = "SELECT artists.name, artists.biography, artists.instruments, artists.photo_url, albums.title, bands.band_name
FROM artists Inner Join (artists_bands inner join (bands inner join (bands_albums inner join albums on bands_albums.id_album = albums.id_album) on bands.id_band = bands_albums.id_band) on artists_bands.id_band = bands.id_band) on artists.id_artist = artists_bands.id_artist WHERE artists.id_artist = " . $id;
	$result = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($result);
	$result = $conn->query($sql);
	?>
	<!-- Title -->
	<title>SpotMusic - <?php echo $row['name']; ?></title>
	
    <!-- Page Content -->
    <div class="container">
	
      <!-- Portfolio Item Heading -->
      <h1 class="my-4"><?php echo $row['name']; ?></h1>

      <!-- Portfolio Item Row -->
      <div class="row">

        <div class="col-md-4">
          <img class="img-fluid" src="<?php echo $row['photo_url']; ?>" alt="">
        </div>
        <div class="col-md-8">
          <h3 class="my-1">Biography:</h3>
          <p><?php echo $row['biography']; ?></p>
          <h3 class="my-4">Artist details:</h3>
          <ul>
            <li>Instruments: <?php echo $row['instruments']; ?></li>
            <li>Band: <a href="https://webplayer.prolingua.gr/index.php?a=profile&u=<?php echo $row['band_name']; ?>" target="_blank"><?php echo $row['band_name']; ?></a></li>
            <li>Albums: <?php 
			if (mysqli_num_rows($result) > 0)  {
				while($row = mysqli_fetch_assoc($result)) { 
					echo '<a href="https://webplayer.prolingua.gr/index.php?a=explore&filter='. $row['title'].'" target="_blank">' . $row['title']. ' </a>';
				}
			}
			$conn->close(); ?></li>
          </ul>
        </div>
      </div>
      <!-- /.row -->

      <!-- Related Projects Row -->
      <h3 class="my-4">Related Projects</h3>

      <div class="row">

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="assets/img/500x300.png" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="assets/img/500x300.png" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="assets/img/500x300.png" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="assets/img/500x300.png" alt="">
          </a>
        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

<!-- The scrollable area -->
<body data-spy="scroll" data-target=".navbar" data-offset="1" id="page-top">


	
</body>

</html>