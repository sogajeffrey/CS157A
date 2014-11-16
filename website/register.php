<?php
	session_start();
	$username = $_POST['username'];
	$password = $_POST['password'];
	$message = "";
	include("connect.php");
	$result = mysql_query("SELECT uID FROM customerinfo WHERE uID='" . $_POST["username"] . "' and password = '". $_POST["password"]."'");
	$row  = mysql_fetch_array($result);
	
	if(is_array($row)) {
	$_SESSION["uID"] = $row[uID];	
	//$_SESSION["aID"] = $row[accountID];
	header("Location:user.php");
	} 
	if(!is_array($row)) 
	{
		//$message = "Invalid Username or Password!";
	}
	if(isset($_SESSION["uID"])) 
	{
	header("Location:user.php");
	}

?>
<!DOCTYPE HTML>
<html>
<head>
<title>Register Monkey Bank of America</title>
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
                <h2>Register for a Monkey Bank Account</h2>
                <p>Upon registration you will be able to enjoy the many features Monkey Bank has to offer :) </p>
            </header>
            <div class="box">
                <form method="post" action="registration.php">
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input id="name" name="name" placeholder="Name" required="" tabindex="1" type="text" required>
                        </div>
                        <div class="6u">
                            <input id="name" name="uID" placeholder="Username" required="" tabindex="1" type="text" required>
                        </div>
                    </div>
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input type="email" name="email" id="email" value="" placeholder="Email Address" required>
                        </div>
                        <div class="6u">
                            <input id="phone" name="phone" placeholder="Phone Number" required type="text">
                        </div>

                    </div>
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input type="password" id="password" name="password" required="" placeholder="Password" required>
                        </div>
                        <div class="6u">
                            <input type="password" id="repassword" name="repassword" required="" placeholder="Verify Your Password" required>
                        </div>
                    </div>
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input name="age" placeholder="Age" required type="text">
                        </div>
                        <div class ="6u">
                            <input type="text" name="ssn" placeholder="Social Security Number" required>
                        </div>
                    </div>
                    <div class="row uniform">
                        <div class="12u">
                            <ul class="actions align-center">
                                <input class="buttom" name="submit" id="submit" tabindex="5" value="Submit" type="submit">
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
        </section>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Jeffrey Su. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>
