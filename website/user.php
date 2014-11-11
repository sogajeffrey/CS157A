<?php
	session_start();
	include("connect.php");
	$aID = 0;
	$check = 1;
	$save = 1;
	$loan =1; 
	$name = "Not working";
	if(!isset($_SESSION['uID'])) {
		header("Location:index.php");
	} 		
	if(isset($_SESSION['uID'])) {
		$uID = $_SESSION['uID'];
	} 
	
	$result = mysql_query("SELECT hasChecking, hasSavings, hasLoan FROM customer_account_link WHERE uID = $uID");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$aID = $row['accountID'];
		$check = $row['hasChecking'];
		$save = $row['hasSavings'];
		$loan = $row['hasLoan'];
    }
	
	$result = mysql_query("SELECT name FROM customerinfo WHERE uID = $uID");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$name = $row['name'];
    }
	
			
?>
<head>
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

<!-- Nav -->
<nav id="nav" class="skel-layers-fixed">
  <ul>
    <li><a href="index.html">Home</a></li>
    <li> <a href="">Dropdown</a>
      <ul>
        <li><a href="#">Lorem ipsum dolor</a></li>
        <li><a href="#">Magna phasellus</a></li>
        <li> <a href="">Phasellus consequat</a>
          <ul>
            <li><a href="#">Lorem ipsum dolor</a></li>
            <li><a href="#">Phasellus consequat</a></li>
            <li><a href="#">Magna phasellus</a></li>
            <li><a href="#">Etiam dolore nisl</a></li>
          </ul>
        </li>
        <li><a href="#">Veroeros feugiat</a></li>
      </ul>
    </li>
    <li><a href="left-sidebar.html">Left Sidebar</a></li>
    <li><a href="right-sidebar.html">Right Sidebar</a></li>
    <li class="current"><a href="no-sidebar.html">No Sidebar</a></li>
  </ul>
</nav>

<!-- Main -->
<div id="main-wrapper">
  <div id="main" class="container">
    <div class="row">
      <div class="12u">
        <div class="content"> 
          
          <!-- Content -->
          
          <article class="box page-content">
            <header> 
			<?php echo "<h2> $name Account </h2> " ?>
              <p>Here you can see all your accounts and information about each one.</p>
            </header>
            <?php
			if($check == 1){
					$result = mysql_query("SELECT balance FROM checkingaccount WHERE accountID = $aID");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['balance'];
    				}							
	
            echo "<section>";
              echo "<h3>Checking Account</h3>";
              echo "<h4>Balance:</h4> $bal";
              echo "<ul class=\"actions\"> <li><a href=\"#\" class=\"button medium\">View Checking Account</a></li></ul>";
            echo "</section>";
			}
			if($save == 1)
			{
				$result = mysql_query("SELECT balance FROM savingsaccount WHERE accountID = $aID");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['balance'];
    				}
	
			  echo "<section>";
              echo "<h3>Savings Account</h3>";
              echo "<h4>Balance:</h4> $bal";
              echo "<ul class=\"actions\"> <li><a href=\"#\" class=\"button medium\">View Savings Account</a></li></ul>";
            echo "</section>";
			}
			if($loan == 1){
				$result = mysql_query("SELECT amount FROM loan WHERE accountID = $aID");
					$row  = mysql_fetch_array($result);
					if(is_array($row)) 
					{
					$bal = $row['amount'];
    				}
            echo "</section>";
			  echo "<section>";
              echo "<h3>Loan</h3>";
              echo "<h4>Amount Owed:</h4> $bal";
			  //echo "<h4>Due by:</h4>";
              echo "<ul class=\"actions\"> <li><a href=\"#\" class=\"button medium\">View Loan</a></li></ul>";
            echo "</section>";
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
  <div id="copyright">
    <ul class="menu">
      <li>&copy; CS157A. All rights reserved</li>
    </ul>
  </div>
</footer>
</body>
</html>