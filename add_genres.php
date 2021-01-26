<?php
include 'config/database.php';

// Initialize the session
session_start();

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){	
	header("location: login/login.php");
}

if($_SERVER["REQUEST_METHOD"] == "POST"){
	
	$genre = ucwords($_POST['genre_title']);
	$desc = $_POST['genre_description'];
	$release = $_POST['genre_release'];
	
	$target_dir = "assets/img/genres/";
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
				echo "File is not an image. ";
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
	
	$sql_b = "SELECT id_genre FROM genres WHERE title = '$genre'";
	$sql = "INSERT INTO genres (title, description, release_year, photo_url) VALUES ( '$genre', '$desc', $release, '$target_file')";
	$res_b = mysqli_query($conn, $sql_b);
	
	if (mysqli_num_rows($res_b) > 0) {
		echo "<div class='alert alert-danger' role='alert'> The band with the name you entered already exists. </div>";
		//echo "Sorry... username already taken";
	} else {
		$conn->query($sql);
		echo "<div class='alert alert-success' role='alert'> New record created successfully </div>";
		//echo "New record created successfully";
	}	
	$conn->close();
}
?> 

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpotMusic - Add Genres</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/custom.css">

</head>

<body>
    <div class="register-photo">
        <div class="form-container">
            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
                <h2 class="text-center"><strong>Add your own genres</strong></h2>
				<div class="form-group">
					<label>Genre title: </label>
					<input class="form-control" type="text" name="genre_title" maxlength="50" required="">
				</div>
				<div class="form-group">
					<label>Genre description: </label>
					<textarea class="form-control" wrap="hard" name="genre_description" maxlength="600" minlength="100" required=""></textarea>
				</div>
                <div class="form-group">
					<label>Genre release: </label>
					<input class="form-control" type="text" name="genre_release" maxlength="4" minlength="4" pattern="\d{4}" required="">
				</div>
				<div class="form-group">
					<label>Genre photo: </label>
					<div class="input-group input-file" name="fileToUpload" id="fileToUpload">
						<span class="input-group-btn">
							<button class="input-group-text" type="button">Choose</button>
						</span>
						<input type="text" class="form-control" placeholder='Choose a file...' required="">
						<span class="input-group-btn" required="">
							 <button class="btn btn-primary btn-reset" type="button">Reset</button>
						</span>
					</div>
				</div>
                <div class="form-group" style="margin-top:35px">
					<button class="btn btn-primary btn-block" type="submit">Add band</button>
				</div>
            </form>
        </div>
    </div>
	<script src="assets/jquery/jquery.slim.js"></script>
	<script src="assets/js/index.js"></script>
</body>

</html>