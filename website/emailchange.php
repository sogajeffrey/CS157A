<?php 
session_start();
	if(!isset($_SESSION['uID'])) {
		header("Location:login.php");
	} 
	if(isset($_POST["emailold"]))
	{ 
	$newemail = $_POST['email1'];
	include("connect.php");
	$result = mysql_query("SELECT uID, type FROM userinfo WHERE uID='" . $_POST["username"] . "' and password = '". $_POST["password"]."'");
	$row  = mysql_fetch_array($result);
	
	if(is_array($row)) {
	$_SESSION["uID"] = $row[uID];
	$_SESSION["type"] = $row[type];	
	//$_SESSION["aID"] = $row[accountID];
	header("Location:user.php");
	} 
	if(!is_array($row)) 
	{
		$message = "Invalid Username or Password!";
	}
	}
?>
<!DOCTYPE HTML>
<html>
<head>
<title>Email Change</title>
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

<?php include('nav.php'); ?>

<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Change your Email Address</h2>
    <p>You must enter your old email and enter your new email twice.</p>
  </header>
  <div class="box">
    <form method=post action="emailchange.php">
      <div class="row uniform">
        <div class="12u">
          <ul >
            <li>
              <input type="text" name="emailold" placeholder="Old Email" >
            </li>
            <li>
              <input type="text" name="email1" placeholder="New Email" >
            </li>
            <li>
              <input type="text" name="email2" placeholder="Confirm your new email">
            </li>
          </ul>
        </div>
      </div>
      <div class="row uniform">
        <div class="12u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Change Email" />
            </li>
          </ul>
        </div>
      </div>
    </form>
  </div>
</section>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Code Monkeys. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>
