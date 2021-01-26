<!-- Custom CSS Style -->
<link rel="stylesheet" href="assets/css/Custom.css">

<?php  
require_once "config/database.php";
require_once "config/settings.php";

//paging-artists.php
$record_per_page = 6;
$page = '';
if(isset($_POST["page"])) {
    $page = $_POST["page"];
}  
else {  
    $page = 1;  
}  
$start_from = ($page - 1)*$record_per_page;  
$query = "SELECT id_artist, name, instruments, photo_url FROM artists ORDER BY name LIMIT $start_from, $record_per_page";  
$result = mysqli_query($conn, $query);  
$art_count = 0;
 
while($row = mysqli_fetch_array($result)) { ?> 

	<?php $art_count++; if ($art_count<=$art_amount_set){?>

					<div class="col-sm-6 col-lg-4 item" data-aos="fade-down" data-aos-duration="950" data-aos-delay="<?php echo $art_data_delay = $art_data_delay + $art_round_delay ?>" data-aos-once="true">
						<div class="hover13 column">
							<?php echo '<a href="" name="submit" data-toggle="modal" data-target="#exampleModal" data-whatever="' .$row['id_artist']. '">'; ?>
							<figure><img class="rounded-circle" src="<?php echo $row['photo_url']; ?>"></a></figure>
						</div>
						<h3 class="name text-capitalize" style="color:<?php echo $mg_title_color; ?>"><?php echo $row['name']; ?></h3>
						<p class="text-uppercase title" style="color:rgba(32,143,143,0.39)"><?php echo $row['instruments']; ?></p>
						<!-- Disabled Social
						<div class="social" style="color:<?php echo $mg_title_color; ?>">
							<a href="#"><i class="fa fa-facebook-official"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-instagram"></i></a>
						</div> -->
					</div>
<?php 			
					}
 }
 
 $page_query = "SELECT id_artist,  name, instruments, photo_url FROM artists ";  
 $page_result = mysqli_query($conn, $page_query);  
 $total_records = mysqli_num_rows($page_result);  
 $total_pages = ceil($total_records/$record_per_page); 

 ?>  