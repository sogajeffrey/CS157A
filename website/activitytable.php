<?php
session_start();
$uID = $_SESSION['uID'];
$aID = $_SESSION['aID'];
include("dbconnect.php");
$type = $_GET['type'];
$sql = mysqli_query($conn2, "SELECT transactiondate, actionDone, amount, newbalance FROM accountactivity WHERE accountID = '13' and type = 'Checking'")
//$sql = $mysqli_query($conn2, "CALL getAccountActivity('$aID', '$accounttype')");
//$sql = $mysqli_prepare($conn2, 'CALL getAccountActivity(?,?)');
//mysqli_stmt_bind_param($sql, 'is', $aID, $accounttype);
//mysqli_stmt_execute($sql);
//mysqli_stmt_close($sql);
//$result = mysqli_get_result($sql);

?><head>
<title>Account Activity</title>
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
      <p>by CS157A</p>
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
              <h2> Your <?php echo $accounttype ?> Account Activity</h2>
            </header>
            <section id="main" class="container large">
              <table id="results" class="display" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th>Transaction Date</th>
                    <th>Action Done</a></th>
                    <th>Amount</a></th>
                    <th>New Balance</a></th>
                  </tr>
                </thead>
                <tbody>
                  <?php

	  while (list($date, $action, $amount, $new) = mysqli_fetch_array($sql))
        {
			print "<tr>";
			echo "<td> $date </td>";
			print "<td> $action </td>";
			print "<td> $amount </td>";
			print "<td> $new </td>";
			print "</tr>";
        }
	  ?>
                </tbody>
              </table>
            </section>
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