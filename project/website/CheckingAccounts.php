<?php
session_start();
include('connect.php');
$result = mysql_query("SELECT hasChecking FROM customer_account_link WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$check = $row['hasChecking'];
		if($check == 1)
		{
			header("Location:checking.php");
		}
    }
?>

<!DOCTYPE HTML>
<html>
<head>
<title>Checking Accounts</title>
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
<div id="main-wrapper">
  <div id="main" class="container">
    <div class="row">
      <div class="12u">
        <div class="content"> 
          
          <!-- Content -->
          
          <article class="box page-content">
            <header>
              <h2>Monkey Checking Accounts</h2>
              <p>What makes our Checking Account Different?</p>
            </header>
            <section> <span class="image featured"><img src="images/checking.jpg" alt="" /></span>
            </section>
            <section>
              <h3>Why our checking account is the best</h3>
              <p> Because we are all monkeys and we have the best checking acocunt in the world where you can do everything online!</p>
            </section>
        
          </article>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Code Monkeys. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>