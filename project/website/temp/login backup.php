<?php
	ob_start();
	session_start();
	$sucess = false;
	$username = $_POST['username'];
	$password = $_POST['password'];
	if(isset($_SESSION['uID'])) {
		header("location: user.php?uID".$_SESSION['uID']);
	}
	$uid = "";
	$error = "";
	$redirect = "";
	if($_SERVER["REQUEST_METHOD"] == "POST") {
		$uID = $_POST['username'];
		$pass = $_POST['password'];
		if(strlen($_POST['password']) > 0) {
			require_once('includes/connect.php');
			$sql = "CALL 'loginCustomer'($uID, $pass)";
			$raw_results = $mysqli->query($sql);
			if(mysqli_num_rows($raw_results) == 0) {
				$error = "Login Failed due to incorrect Username or Password...Please try again";
				$sucess = false;
			} else {
				while($row = mysqli_fetch_array($raw_results)) {
						$_SESSION['uID']=$row['uID'];
						$redirect = "<script>$(document).ready(function() {document.location = 'user.php?uID=".$row['uID']."'	});</script>";
						$sucess = true;
					 
				}
			}
		} 
	}
?>
<!DOCTYPE HTML>
<html>
<head>
<title>Login Monkey Bank of America</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
</head><body class="homepage">

<!-- Header -->
<header id="header">
  <div class="logo container">
    <div>
      <h1><a href="index.html" id="logo">The Monkey Bank of America</a></h1>
      <p>by The Monkey Coders</p>
    </div>
  </div>
</header>

<!-- Nav -->
<nav id="nav" class="skel-layers-fixed">
  <ul>
    <li class="current"><a href="index.php">Home</a></li>
    <li> <a href="">Dropdown</a>
      <ul>
        <li><a href="#">Lorem ipsum dolor</a></li>
        <li><a href="#">Magna phasellus</a></li>
        <li> <a href="">Phasellus consequat</a>
          <ul>
            <li><a href="#">Lorem ipsum dolor</a></li>
            <li><a href="#">Phasellus consequat</a></li>
            <li><a href="#">Magna phasellus</a></li>
            <li><a href="#">Etiam dolore nisl</a></li>
          </ul>
        </li>
        <li><a href="#">Veroeros feugiat</a></li>
      </ul>
    </li>
    <li><a href="left-sidebar.html">Left Sidebar</a></li>
    <li><a href="right-sidebar.html">Right Sidebar</a></li>
    <li><a href="no-sidebar.html">No Sidebar</a></li>
  </ul>
</nav>

<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Login Results</h2>
  </header>
  <?php
		if ($sucess = false)
		{
		  echo "<ul class=\"actions\"><li><a href=\"login.php\" class=\"button\">Try Again</a></li></ul>";
		}
		else 
		  echo $redirect;
	?>
</section>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Jeffrey Su. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>
