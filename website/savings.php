<?php
	session_start();
	include("connect.php");
	if(!isset($_SESSION['uID'])) {
		header("Location:login.php");
	} 		
	if(isset($_SESSION['uID'])) {
		$uID = $_SESSION['uID'];
	} 
	$result = mysql_query("SELECT accountID, hasChecking, hasSavings, hasLoan FROM customer_account_link WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$aID = $row['accountID'];
		$check = $row['hasChecking'];
		$save = $row['hasSavings'];
		$loan = $row['hasLoan'];
    }
	
	if (isset($_GET['action'])) 
	{
    	$action = $_GET['action'];
		
		if($action = "w")
		{
			$amount = $_POST['wamt'];
			mysql_query("UPDATE Savingsaccount SET balance = balance-$amount WHERE accountID = $aID");
			header("Location:Savings.php");
		}
		if($action = "d")
		{
			$amount = $_POST['damt'];
			mysql_query("UPDATE Savingsaccount SET balance = balance+$amount WHERE accountID = $aID");
			header("Location:Savings.php");
		}
		if($action = "t")
		{
			$amount = $_POST['tamt'];
			mysql_query("UPDATE Savingsaccount SET balance = balance-$amount WHERE accountID = $aID");
			mysql_query("UPDATE checkingsaccount SET balance = balance+$amount WHERE accountID = $aID");
			header("Location:Savings.php");
		}
	
	}
	
	
	$result = mysql_query("SELECT balance FROM Savingsaccount WHERE accountID = '$aID'");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['balance'];
    				}
	$result = mysql_query("SELECT name FROM customerinfo WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$name = $row['name'];
    }
	
			
?><head>
<title>Savings Account </title>
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

<!-- Main -->
<div id="main-wrapper">
  <div id="main" class="container">
    <div class="row">
      <div class="12u">
        <div class="content"> 
          
          <!-- Content -->
          
          <article class="box page-content">
            <header> 
			  <h2> Your Savings Account</h2>
              <p>Here you can view your balance, withdraw money, deposit money and more!</p>
            </header>
            <?php					
	
            echo "<header>";
              echo "<h3>Balance:</h3> <p> $bal Monkey Bucks </p>";
            echo "</header>";
			?>
          <header> 
			  <h3>Options</h3>
          </header>  
       <form method=post action="Savings.php?action=w">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="wamt" placeholder="Withdraw Amount" />
        </div>
        <div class="6u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Withdraw" />
            </li>
          </ul>
        </div>
      </div>
    </form>
    <form method=post action="Savings.php?action=d">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="damt" placeholder="Deposit Amount" />
        </div>
        <div class="6u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Deposit" />
            </li>
          </ul>
        </div>
      </div>
    </form>
    <?php
    if($save == 1)
			{
				echo "<form method=post action=\"Savings.php?action=t\">";
      echo "<div class=\"row uniform half collapse-at-2\">";
        echo "<div class=\"6u\"> <input type=\"text\" name=\"tamt\" placeholder=\"Transfer to your Checking Account\" /> </div>";
        echo "<div class=\"6u\"> <ul class=\"actions align-center\"> <li>";
         echo "<input type=\"submit\" value=\"Transfer\" /> </li></ul></div></div></form>";
			} 
			?>
         <ul class="actions"> <li><a href="user.php" class="button large">Go Back to Account Overview</a></li></ul>
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