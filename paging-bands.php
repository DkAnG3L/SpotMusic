<!-- Custom CSS Style -->
<link rel="stylesheet" href="assets/css/custom.css">

<?php  
require_once "config/database.php";
require_once "config/settings.php";

//paging-bands.php
$record_per_page = 3;
$page = '';
if(isset($_POST["page"])) {
    $page = $_POST["page"];
}  
else {  
    $page = 1;  
}  
$start_from = ($page - 1)*$record_per_page;  
$query = "SELECT band_name, biography, photo_url FROM bands ORDER BY band_name DESC LIMIT $start_from, $record_per_page";  
$result = mysqli_query($conn, $query);  
$dsk_count = 0;
 
while($row = mysqli_fetch_array($result)) { ?> 

	<?php $dsk_count++; if ($dsk_count<=$dsk_amount_set){?>

                <div class="col-sm-6 col-md-4 item">
                    <div class="jumbotron" data-aos="fade-down" data-aos-duration="950" data-aos-delay="<?php echo $dsk_data_delay = $dsk_data_delay + $dks_round_delay ?>" data-aos-once="true">
						<h3 class="text-cemter text-capitalize" style="color:<?php echo $mg_title_color; ?>"><?php echo $row['band_name']; ?></h3>
						<img class="img-thumbnail img-fluid" style="margin-bottom:10px" src="<?php echo $row['photo_url']; ?>">
                        <p class="text-left"><?php echo $row['biography']; ?></p>
                        <p><a class="btn btn-primary btn-block" role="button" href="https://webplayer.prolingua.gr/index.php?a=profile&u=<?php echo $row['band_name']; ?>" target="_blank">View discography<br></a></p>
                    </div>
                </div>
<?php 			
					}
 }
 
 $page_query = "SELECT band_name, biography, photo_url FROM bands";  
 $page_result = mysqli_query($conn, $page_query);  
 $total_records = mysqli_num_rows($page_result);  
 $total_pages = ceil($total_records/$record_per_page); 

 ?>  