<?php
session_start();
$uID = $_SESSION['uID'];
$aID = $_SESSION['aID'];
include("connect.php");
include("dbconnect.php");
if(isset($_POST['queries']))
{
	$qaction = $_POST['queries'];
	if($qation = "Q1")
	{
		$sql = mysqli_query($conn2, "CALL getNetBalanceOfCustomers()");
	}
	if($qation = "Q2")
	{
		$sql = mysqli_query($conn2, "CALL  getProblemLoaners()");
	}
    
}
if(isset($_POST['ave_age_loan']))
{
	$qaction = "loanX";
    $sql = mysqli_query($conn2, " CALL avgAgeUsersWithLoanOverXDollars('" . $_POST["ave_age_loan"] . "')");
}

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
            
            <?php
			if ($qaction = "Q1")
			{
				
			echo "<header>";
             echo " <h2> Here are the net balances of all customers!</h2>";
            echo "</header>";
			
            echo "<section id='main' class='container large'>";
              echo "<table style = 'width:100%'>";
                echo "<thead>";
                 echo " <tr>" ;
                    echo "<th>Account ID</th>";
                    echo "<th>Net Balance</a></th>";
                  echo "</tr>";
               echo " </thead>";
               echo " <tbody>";

	          while (list($id, $amount) = mysqli_fetch_array($sql))
             {
				echo "<tr>";
				echo "<td> $id </td>";
				echo "<td> $amount </td>";
				echo "</tr>";
       			 }
	 			 
                echo "</tbody>";
             echo " </table>";
            echo "</section>";
			}
			
			else if ($qaction = "Q2")
			{
				
			echo "<header>";
             echo " <h2> Here are the problematic loaners!</h2> <p>These customers have loans geater than both their checking and savings balance combined!</p>";
            echo "</header>";
			
            echo "<section id='main' class='container large'>";
              echo "<table style = 'width:100%'>";
                echo "<thead>";
                 echo " <tr>" ;
                    echo "<th>Account ID</th>";
                    echo "<th>Net Balance</a></th>";
					echo "<th>Loan Amount</a></th>";
                  echo "</tr>";
               echo " </thead>";
               echo " <tbody>";

	          while (list($id, $bal, $amt) = mysqli_fetch_array($sql))
             {
				echo "<tr>";
				echo "<td> $id </td>";
				echo "<td> $bal </td>";
				echo "<td> $amt </td>";
				echo "</tr>";
       			 }
	 			 
                echo "</tbody>";
             echo " </table>";
            echo "</section>";
			}
			
			else if ($qaction = "loanX")
			{
		     list($ave) = mysqli_fetch_array($sql);
			 $lmt = $_POST['ave_age_loan'];
		     echo "<header>";
             echo " <h2> Average age of users with loans over $lmt Monkey Bucks</h2> <p>Average Age = $ave</p>";
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