<!-- Custom CSS Style -->
<link rel="stylesheet" href="assets/css/custom.css">
<?php  
require_once "config/database.php";
require_once "config/settings.php";

//paging-genres.php  
$record_per_page = 3;
$page = '';
if(isset($_POST["page"])) {
    $page = $_POST["page"];
}  
else {  
    $page = 1;  
}  
$start_from = ($page - 1)*$record_per_page;  
$query = "SELECT title, description, photo_url, release_year FROM genres LIMIT $start_from, $record_per_page";  
$result = mysqli_query($conn, $query);  
$mg_count = 0;
 
while($row = mysqli_fetch_array($result)) { ?> 

	<?php $mg_count++; if ($mg_count<=$mg_amount_set){?>
			
		<div class="col-sm-6 col-lg-4 item" data-aos="fade-down" data-aos-duration="950" data-aos-delay="<?php echo $mg_data_delay = $mg_data_delay + $mg_round_delay ?>" data-aos-once="true">
			<div class="hover09 column">
			<figure><a href="https://webplayer.prolingua.gr/index.php?a=explore&filter=<?php echo $row['title']; ?>" target="_blank">
			<img class="img-fluid" src="<?php echo $row['photo_url']; ?>"></a></figure></div>
			<h3 class="name text-capitalize" style="color:<?php echo $mg_title_color; ?>"><?php echo $row['title']; ?></h3>
			<p class="<?php echo $mg_bootstrap_icon; ?>" style="color:<?php echo $mg_year_color; ?>"> <?php echo $row['release_year']; ?></p>
			<p class="description"><?php echo $row['description']; ?></p>
		</div>
<?php 			
	}
 }
 
 $page_query = "SELECT title, description, photo_url, release_year FROM genres";  
 $page_result = mysqli_query($conn, $page_query);  
 $total_records = mysqli_num_rows($page_result);  
 $total_pages = ceil($total_records/$record_per_page); 

 ?>  