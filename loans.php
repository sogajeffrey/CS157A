<?php
	session_start();
	include("connect.php");
	include("dbconnect.php");
	if(!isset($_SESSION['uID'])) {
		header("Location:login.php");
	}
	if(isset($_SESSION['uID'])) {
		$uID = $_SESSION['uID'];
		$aID = $_SESSION['aID'];
	}
	if(isset($_POST['amount']))
	{
		$amt = $_POST['amount'];
		$year = $_POST['year'];
		$month = $_POST['month'];
		$day = $_POST['day'];
		$date = "$year-$month-$day";
		$query = "INSERT INTO loan "
                ." (`AccountID`, `amount`, `dueDate`) VALUES "
                ."('$aID', '$amt', '$date')";
		mysqli_query($conn2, $query);
	}

	$result = mysql_query("SELECT accountID, hasChecking, hasSavings, hasLoan FROM customer_account_link WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row))
	{
		$check = $row['hasChecking'];
		$save = $row['hasSavings'];
		$loan = $row['hasLoan'];
    }
	if($loan == 0)
	{
	   header("Location:user.php");

	}

	if (isset($_GET['action']))
	{
    	$action = $_GET['action'];

		if($action = "ca")
		{
			$amount = $_POST['chamt'];
			mysql_query("UPDATE loan SET amount = amount-$amount WHERE accountID = $aID");
			header("Location:loans.php");
		}

		if($action = "c")
		{
			$amount = $_POST['camt'];
			mysql_query("UPDATE loan SET amount = amount-$amount WHERE accountID = $aID");
			mysql_query("UPDATE checkingaccount SET balance = balance-$amount WHERE accountID = $aID");
			header("Location:loans.php");
		}
		if($action = "s")
		{
			$amount = $_POST['samt'];
			mysql_query("UPDATE loan SET amount = amount-$amount WHERE accountID = $aID");
			mysql_query("UPDATE savingsaccount SET balance = balance-$amount WHERE accountID = $aID");
			header("Location:loans.php");
		}


	}


	$result = mysql_query("SELECT amount, loanDate, dueDate FROM loan WHERE accountID = '$aID'");
					$row  = mysql_fetch_array($result);
					if(is_array($row))
					{
					$bal = $row['amount'];
					$loanD = $row['loanDate'];
					$dueD = $row['dueDate'];

    				}
	$result = mysql_query("SELECT name FROM userinfo WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row))
	{
		$name = $row['name'];
    }


?><head>
<title>Loan</title>
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

<!-- Main -->
<div id="main-wrapper">
  <div id="main" class="container">
    <div class="row">
      <div class="12u">
        <div class="content">

          <!-- Content -->

          <article class="box page-content">
            <header>
			  <h2> Your loan </h2>
              <p>Here you can view your loan amount, pay it off, and more!</p>
            </header>
            <?php

            echo "<header>";
              echo "<h3>Amount Loaned:</h3> <p> $bal Monkey Bucks </p>";
			  echo "<h3>Date of Loan:</h3> <p> $loanD </p>";
			  echo "<h3>Due by:</h3> <p> $dueD </p>";
            echo "</header>";
			?>
          <header>
			  <h3>Options</h3>
          </header>
       <form method=post action="loans.php?action=ca">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="chamt" placeholder="Pay off With Cash" />
        </div>
        <div class="6u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Pay" />
            </li>
          </ul>
        </div>
      </div>
    </form>
       <form method=post action="loans.php?action=c">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="camt" placeholder="Pay with Checking Account" />
        </div>
        <div class="6u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Pay" />
            </li>
          </ul>
        </div>
      </div>
    </form>
    <form method=post action="loans.php?action=s">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="samt" placeholder="Pay with Savings Account" />
        </div>
        <div class="6u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Pay" />
            </li>
          </ul>
        </div>
      </div>
    </form>
         <ul class="actions">
         <li><a href="user.php" class="button large">Go Back to Account Overview</a></li></ul>
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
