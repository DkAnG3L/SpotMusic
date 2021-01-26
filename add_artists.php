<?php
require_once 'config/database.php';

// Initialize the session
session_start();

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){	
	header("location: login/login.php");
}

	$sql = "SELECT band_name FROM bands ORDER BY band_name ASC";
	$result = mysqli_query($conn, $sql); 
	$option = '';

	while($row = mysqli_fetch_array($result)){
		$option .= '<option value = "'.$row['band_name'].'">'.$row['band_name'].'</option>';
	}

if($_SERVER["REQUEST_METHOD"] == "POST"){
	
	$name = $_POST['artist_name'];
	$band_select = $_POST['band_select'];
	$bio = $_POST['artist_biography'];
	$instruments = $_POST['artist_instruments'];
	
	if ($band_select != "Choose...") {
		$namefolder = strtolower($band_select);
	} else {
		$namefolder = strtolower($name);
	}
	
	$target_dir = "assets/img/artists/$namefolder/";
	if (!is_dir($target_dir)) {
		mkdir($target_dir);         
	}
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	$uploadOk = 1;
	$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
	// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		if($check !== false) {
			echo "<div class='alert alert-success' role='alert'> File is an image - " . $check['mime'] . ".</div>";
			//echo "File is an image - " . $check["mime"] . ".";
			$uploadOk = 1;
		} else {
				echo "<div class='alert alert-danger' role='alert'> File is not an image. </div>";
				//echo "File is not an image. ";
				$uploadOk = 0;
		}
	}
	// Check if file already exists
	
	if (file_exists($target_file)) {
		echo "<div class='alert alert-danger' role='alert'> Sorry, file already exists. </div>";
		//echo "Sorry, file already exists. ";
		$uploadOk = 0;
	}
	
	// Check file size
	if ($_FILES["fileToUpload"]["size"] > 50000000) {
		echo "<div class='alert alert-danger' role='alert'> Sorry, your file is too large. </div>";
		//echo "Sorry, your file is too large.";
		$uploadOk = 0;
	}
	
	// Allow certain file formats
	if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
		echo "<div class='alert alert-danger' role='alert'> Sorry, only JPG, JPEG, PNG & GIF files are allowed. </div>";
		//echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed. ";
		$uploadOk = 0;
	}
	// Check if $uploadOk is set to 0 by an error
	if ($uploadOk == 0) {
		echo "<div class='alert alert-danger' role='alert'> Sorry, your file was not uploaded. </div>";
		//echo "Sorry, your file was not uploaded. ";
	
	// if everything is ok, try to upload file
	} else {
		
		if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
			echo "<div class='alert alert-success' role='alert'> The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded. </div>";
			//echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
		} else {
			echo "<div class='alert alert-danger' role='alert'> Sorry, there was an error uploading your file. </div>";
			//echo "Sorry, there was an error uploading your file. ";
		}
	}
	
	$sql_b = "SELECT id_artist FROM artists WHERE name = '$name'";
	$sql = "INSERT INTO artists (name, biography, instruments, photo_url) VALUES ( '$name', '$bio', '$instruments', '$target_file')";
	$res_b = mysqli_query($conn, $sql_b);
	
if (mysqli_num_rows($res_b) > 0) {
		echo "<div class='alert alert-danger' role='alert'> The artist with the name you entered already exists. </div>";
		//echo "Sorry... username already taken";
	} else {
		$conn->query($sql);
		echo "<div class='alert alert-success' role='alert'> New record created successfully </div>";
		//echo "New record created successfully";
	}	
		
	$band_select = $_POST['band_select'];
	if ($band_select != "Choose...") {

		// Find rows on artists_bands
		$sql_num = "SELECT * FROM artists_bands";
		$res_num = mysqli_query($conn, $sql_num);
		$num_rows = mysqli_num_rows($res_num);
		$art_id = $num_rows+1;
	
		//echo "$art_id Rows\n";
		
		// Find id_band with name band
		$sql_b = "SELECT id_band FROM bands WHERE band_name = '$band_select'";
		$result = mysqli_query($conn, $sql_b);
		$row = mysqli_fetch_array($result);
		$band_id = $row['id_band'];
		
		//echo $band_id;
		
		// Update sql table artists_bands
		//$sql_chk = "SELECT id_artist FROM artists_bands WHERE id_artist = '$art_id'";
		$sql_ab = "INSERT INTO artists_bands (id_artist, id_band) VALUE ('$art_id', '$band_id')";
		$res_chk = mysqli_query($conn, $sql_ab);
	}
	$conn->close();
}
?> 

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpotMusic - Add Artists</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/custom.css">

</head>

<body>
    <div class="register-photo">
        <div class="form-container">
            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
                <h2 class="text-center"><strong>Add your own artists</strong></h2>
				<div class="form-group">
					<label>Artists name: </label>
					<div class="input-group-prepend">
						<input class="form-control" type="text" name="artist_name" max="50" required="">
					</div>
				</div>
				<div class="form-group">
					<label>Artists biography: </label>
					<textarea class="form-control " wrap="hard" name="artist_biography" maxlength="600" minlength="100" required=""></textarea>
				</div>
                <div class="form-group">
					<label>Artists instruments: </label>
					<input class="form-control" type="text" name="artist_instruments" maxlength="50" required="">
				</div>
				<div class="form-group">
					<label>Artist band: </label>
					<div class="input-group mb-3 ">
					<select class="custom-select" name="band_select">
						<option selected>Choose...</option>
						<?php echo $option; ?>
					</select>
					</div>
				</div>
				<div class="form-group">
					<label>Artist photo: </label>
					<div class="input-group input-file" name="fileToUpload" id="fileToUpload">
						<span class="input-group-btn">
							<button class="input-group-text" type="button">Choose</button>
						</span>
						<input type="text" class="form-control" placeholder='Choose a file...' required="">
						<span class="input-group-btn">
							 <button class="btn btn-primary btn-reset" type="button">Reset</button>
						</span>
					</div>
				</div>
                <div class="form-group" style="margin-top:35px">
					<button class="btn btn-primary btn-block" type="submit">Add artist</button>
				</div>
            </form>
        </div>
    </div>
	<script src="assets/jquery/jquery.slim.js"></script>
	<script src="assets/js/index.js"></script>
</body>

</html>