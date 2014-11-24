<?php
	session_start();
	include("connect.php");
	if(!isset($_SESSION['uID'])) {
		header("Location:login.php");
	} 		
	if(isset($_SESSION['uID'])) {
		$uID = $_SESSION['uID'];
	} 
	$result = mysql_query("SELECT accountID, hasChecking, hasSavings FROM customer_account_link WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$_SESSION['aID'] = $row['accountID'];
		$aID = $_SESSION['aID'];
		$check = $row['hasChecking'];
		$save = $row['hasSavings'];
    }
	
	if (isset($_GET['action'])) 
	{
    	$action = $_GET['action'];
		
		if($action = "newcheck")
		{
			$amount = $_POST['start'];
			mysql_query("INSERT INTO checkingaccount (accountID, balance) VALUES ('$aID', '$amount')");
			header("Location:user.php");
		}
		if($action = "newsave")
		{
			$amount = $_POST['start2'];
			mysql_query("INSERT INTO savingsaccount (accountID, balance) VALUES ('$aID', '$amount')");
			header("Location:user.php");
		}
	
	}
	
	$result = mysql_query("SELECT name FROM userinfo WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$name = $row['name'];
    }
	
	
			
?><head>
<title>Sign up for Account</title>
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
			<?php echo "<h2> Welcome $name to the Moneky Bank of America</h2> " ?>
              <p>All users MUST have either a checking account or savings account so please make one below</p>
            </header>
           <?php
    		if($check == 0)
			{
				echo "<form method=post action=\"newaccount.php?action=newcheck\">";
      			echo "<div class=\"row uniform half collapse-at-2\">";
       			 echo "<div class=\"6u\"> <input type=\"text\" name=\"start\" placeholder=\"Initial Checking Deposit\" /> </div>";
        		echo "<div class=\"6u\"> <ul class=\"actions align-center\"> <li>";
        		 echo "<input type=\"submit\" value=\"Create Checking Account\" /> </li></ul></div></div></form>";
			} 
			if($save == 0)
			{
				echo "<form method=post action=\"newaccount.php?action=newsave\">";
      			echo "<div class=\"row uniform half collapse-at-2\">";
       			 echo "<div class=\"6u\"> <input type=\"text\" name=\"start2\" placeholder=\"Initial Savings Deposit\" /> </div>";
        		echo "<div class=\"6u\"> <ul class=\"actions align-center\"> <li>";
        		 echo "<input type=\"submit\" value=\"Create Savings Account\" /> </li></ul></div></div></form>";
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