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
	
	$result = mysql_query("SELECT name FROM customerinfo WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$name = $row['name'];
    }
	
			
?><head>
<title>Account Overview</title>
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
			<?php echo "<h2> Welcome $name </h2> " ?>
              <p>Here you can see all your bank accounts and information about each one.</p>
            </header>
            <?php
			if($check == 1){
					$result = mysql_query("SELECT balance FROM checkingaccount WHERE accountID = '$aID'");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['balance'];
    				}							
	
            echo "<header>";
			  echo "<h3>Checking Account</h3>";
              echo "<h3>Balance:</h3> <p> $bal Monkey Bucks </p>";
			  echo "<ul class=\"actions\"> <li><a href=\"checking.php\" class=\"button medium\">View Checking Account</a></li></ul>";
            echo "</header>";
			}
			if($save == 1)
			{
				$result = mysql_query("SELECT balance FROM savingsaccount WHERE accountID = '$aID'");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['balance'];
    				}
			echo "<header>";
			  echo "<h3>Savings Account</h3>";
              echo "<h3>Balance:</h3> <p> $bal Monkey Bucks </p>";
			  echo "<ul class=\"actions\"> <li><a href=\"savings.php\" class=\"button medium\">View Savings Account</a></li></ul>";
            echo "</header>";
			}
			if($loan == 1){
				$result = mysql_query("SELECT amount, dueDate FROM loan WHERE accountID = '$aID'");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['amount'];
					$due = $row['dueDate'];
    				}
            
			  echo "<header>";
              echo "<h3>Loan</h3>";
              echo "<h3>Amount Owed:</h3><p> $bal Monkey Bucks </p>";
			  echo "<h3>Due by: $due</h3>";
              echo "<ul class=\"actions\"> <li><a href=\"loans.php\" class=\"button medium\">View Loan</a></li></ul>";
            echo "</header>";
			}
			
			?>
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