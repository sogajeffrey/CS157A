<?php
	session_start();
	if(isset($_POST["username"]))
	{ 
	$uID = $_POST['username'];
	$password = $_POST['password'];
	$message = "";
	include("connect.php");
	$result = mysql_query("SELECT uID, type FROM userinfo WHERE uID='" . $_POST["username"] . "' and password = '". $_POST["password"]."'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) {
	$_SESSION["uID"] = $row[uID];
	$_SESSION["type"] = $row[type];	
	} 
	if(!is_array($row)) 
	{
		$message = "Invalid Username or Password!";
	}
	$result = mysql_query("SELECT accountID FROM customer_account_link WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$_SESSION["aID"] = $row['accountID'];
    }
	}
	if(isset($_SESSION["uID"])) 
	{
		if ($_SESSION["type"] == "Customer")
		{
			header("Location:user.php");
		}
		else 
		{
			header("Location:manager.php");
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
      <h1><a href="index.php" id="logo">The Monkey Bank of America</a></h1>
      <p>by The Monkey Coders</p>
    </div>
  </div>
</header>

<?php include('nav.php'); ?>

<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Login to the Monkey Bank</h2>
  </header>
  <div class="box">
    <form method=post action="login.php">
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
              <input type="submit" value="Login" />
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
