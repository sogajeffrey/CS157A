<?php
session_start();
include('connect.php');
?>

<!DOCTYPE HTML>
<html>
<head>
<title>Monkey Bank of America</title>
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
      <p>by CS157A</p>
    </div>
  </div>
</header>

<?php include('nav.php'); ?>

<!-- Banner -->
<div id="banner-wrapper">
  <section id="banner">
    <h2>Welcome to the Monkey Bank of America Website</h2>
    <p>Here you can do anything with your account including withdraw money, deposit money and create new accounts!</p>
    <?php
						if(isset($_SESSION['uID'])) {
							echo "<a href=\"user.php\" class=\"button\">View My Account</a>";
						} else {
							echo "<a href=\"login.php\" class=\"button\">Login</a>";
							echo "<a href=\"register.php\" class=\"button\">Register</a>";
						}
					?>
  </section>
</div>

<!-- Main -->
<div id="main-wrapper">
  <div id="main" class="container">
    <div class="row 200%">
      <div class="12u"> 
        
        <!-- Highlight -->
        <section class="box highlight">
          <ul class="special">
            <li><a href="#" class="icon fa-bank"><span class="label">Bank</span></a></li>
            <li><a href="#" class="icon fa-money"><span class="label">Money</span></a></li>
            <li><a href="#" class="icon fa-tablet"><span class="label">Tablet</span></a></li>
            <li><a href="#" class="icon fa-cog"><span class="label">Settings</span></a></li>
          </ul>
          <header>
            <h2>Why choose Monkey Bank of America?</h2>
            <p>Why do we beat the rest? </p>
          </header>
          <p> Monkey Bank prides ourselves in having primarily online transactions whereas other banks require you to actually go in and sign up for an account or do other basic stuff! 
            We provide brick and morter locations but you can easily do anything you need to do online! </p>
        </section>
      </div>
    </div>


  </div>
</div>

<!-- Footer -->
<footer id="footer" class="container">
  <div class="row 200%">
    <div class="12u"> 
      
      <!-- About -->
      <section>
        <h2 class="major"><span>About the Monkey Team</span></h2>
        <p> We are a team of highly efficient coders that get things done with speed and efficiency. </p>
      </section>
    </div>
  </div>
  
  <!-- Copyright -->
  <div id="copyright">
    <ul class="menu">
      <li>&copy; Code Monkeys. All rights reserved</li>
    </ul>
  </div>
</footer>
</body>
</html>