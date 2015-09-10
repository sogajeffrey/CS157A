<?php
	session_start();
	if(isset($_SESSION['uID'])) {
		$uID = $_SESSION['uID'];
	} 
	if(isset($_POST["username"]))
	{ 
	$message = "";
	include("connect.php");
	$result = mysql_query("SELECT uID FROM userinfo WHERE uID='" . $_POST["username"] . "' and password = '". $_POST["password"]."'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) {
	$result1 = mysql_query("SELECT hasLoan from customer_account_link where uID = '$uID'");
	$row1  = mysql_fetch_array($result1);
	if(is_array($row1))
	{
		if($row1['hasLoan'] == 0)
		{
			mysql_query("DELETE from userinfo where uID = '$uID'");
			unset($_SESSION["uID"]);
			unset($_SESSION["type"]);
			header("Location:index.php");

		}
		else 
		{
			$message = "Please pay off your loan before closing your account";
		}
	}
	} 
	else
	{
		$message = "Please enter your username and password correctly in order to delete your account";
	}
	}

?>
<!DOCTYPE HTML>
<html>
<head>
<title>Delete your Account</title>
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
      <p>by The Monkey Coders</p>
    </div>
  </div>
</header>

<?php include('nav.php'); ?>

<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Delete your Monkey Bank Account</h2>
    <p>Please verify your username and password to delete your account </p>
  </header>
  <div class="box">
    <form method=post action="deleteaccount.php">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="username" placeholder="Username" />
        </div>
        <div class="6u">
          <input type="password" name="password" placeholder="Password" />
        </div>
      </div>
      <div class="message">
        <?php if($message!="") { echo $message; } ?>
      </div>
      <div class="row uniform">
        <div class="12u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Submit" />
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
