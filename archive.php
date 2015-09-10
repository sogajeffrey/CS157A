<?php
session_start();
$uID = $_SESSION['uID'];
$aID = $_SESSION['aID'];
include("connect.php");
include("dbconnect.php");
$month = $_POST['Month'];
$day = $_POST['day'];
$year = $_POST['year'];
$date = "$year-$month-$day";
mysql_query("CALL archiveActivity('" . $date . "')");
?>

<head>
<title>Archive Done</title>
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
</head><body>

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
<div id="main-wrapper">
  <div id="main" class="container">
    <div class="row">
      <div class="12u">
        <div class="content">
          <article class="box page-content">
            <header>
            <h2>Archive Complete! </h2>
            </header>
             <ul class="actions">
              <li><a href="manager.php" class="button large">Click to go Back</a></li>
            </ul> 
          </article>
        </div>
      </div>
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
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Code Monkeys. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>