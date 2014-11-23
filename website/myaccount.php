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
	
	$result = mysql_query("SELECT name, age, email, phoneNumber FROM userinfo WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$name = $row['name'];
		$age = $row['age'];
		$email = $row['email'];
		$phone = $row['phoneNumber'];
    }
	
	
			
?><head>
<title>My Account</title>
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
              <p>Here you can see your account information and update if needed</p>
            </header>
            <header> 
			<?php echo "<h3> Email: </h2> <p> $email </p> " ?>
            </header>
             <header> 
			<?php echo "<h3> Age: </h2> <p> $age </p> " ?>
            </header>
             <header> 
			<?php echo "<h3> Phone Number: </h2> <p> $phone </p> " ?>
            </header>
              <header>
              <h2>Account Settings</h2> 
              <p>Make changes to your Account here</p>
              <ul class="actions"> 
              	<li><a href="namechange.php" class="button large">Update your Name</a></li>
                <li><a href="phonechange.php" class="button large">Update your Phone Number</a></li>
                <li><a href="emailchange.php" class="button large">Update Email Address</a></li>
                <li><a href="passchange.php" class="button large">Change Password</a></li>
                </ul>
                <ul class="actions">
                <li><a href="feedback.php" class="button large">Give us Feedback</a></li>
                <li><a href="deleteaccount.php" class="button large">DELETE YOUR ACCOUNT</a></li>
                </ul>
               
            </header>
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