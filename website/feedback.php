<?php
session_start();
include('connect.php');
	if(isset($_SESSION['uID'])) {
		$uID = $_SESSION['uID'];
	}
	else 
	{
		header("Location:login.php");
	}
	
	if(isset($_POST["message"]))
	{ 
	$content = $_POST["message"];
	mysql_query("INSERT INTO customercomplaints (uID, message) VALUES ('$uID', '$content')");
	header("Location:myaccount.php");
	}
?>

<!DOCTYPE HTML>
<html>
<head>
<title>Feedback form</title>
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
      <h1><a href="index.php" id="logo">The Monkey Bank of America</a></h1>
      <p>by The Code Monkeys</p>
    </div>
  </div>
</header>

<?php include('nav.php'); ?>
<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Give us Feedback!</h2>
    <p>Feel free to give a complaint or compliemnt. We read every single one and do our best to improve our operations.</p>
  </header>
  <div class="box">
    <form method="post" action="feedback.php">
      <div class="row uniform half">
        <div class="12u">
          <textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
        </div>
      </div>
      <div class="row uniform">
        <div class="12u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Send Message" />
            </li>
          </ul>
        </div>
      </div>
    </form>
  </div>
</section>

<!-- Footer -->
  <ul class="copyright">
    <li>&copy; Code Monekys. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>