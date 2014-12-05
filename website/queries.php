<?php
session_start();
$uID = $_SESSION['uID'];
$aID = $_SESSION['aID'];
include("connect.php");
include("dbconnect.php");
?><head>
<title>Queries</title>
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
			if ($_GET['query'] == "netbal")
			{
		    $sql = mysqli_query($conn2, " CALL getNetBalanceOfCustomers()");
			echo "<header>";
             echo " <h2> Here are the net balances of all customers!</h2><p>The net balance is a combination of their savings and checking account balance </p>";
            echo "</header>";
			
            echo "<section id='main' class='container large'>";
              echo "<table style = 'width:100%'>";
                echo "<thead>";
                 echo " <tr>" ;
                    echo "<th><b>Account ID</b></th>";
                    echo "<th><b>Net Balance</b></a></th>";
                  echo "</tr>";
               echo " </thead>";
               echo " <tbody>";

	          while (list($id, $amount) = mysqli_fetch_array($sql))
             {
				echo "<tr  align='center'>";
				echo "<td> $id </td>";
				echo "<td> $amount Monkey Bucks</td>";
				echo "</tr>";
       			 }
	 			 
                echo "</tbody>";
             echo " </table>";
            echo "</section>";
			}
			
			else if ($_GET['query'] == "probloaners")
			{
			$sql = mysqli_query($conn2, " CALL getProblemLoaners()");	
			echo "<header>";
             echo " <h2> Here are the problematic loaners!</h2> <p>These customers have loans geater than both their checking and savings balance combined!</p>";
            echo "</header>";
			
            echo "<section id='main' class='container large'>";
              echo "<table style = 'width:100%'>";
                echo "<thead>";
                 echo " <tr>" ;
                    echo "<th><b>Account ID</b></th>";
                    echo "<th><b>Net Balance</b></th>";
					echo "<th><b>Loan Amount</b></th>";
                  echo "</tr>";
               echo " </thead>";
               echo " <tbody>";

	          while (list($id, $bal, $amt) = mysqli_fetch_array($sql))
             {
				echo "<tr align='center'>";
				echo "<td> $id </td>";
				echo "<td> $bal Monkey Bucks</td>";
				echo "<td> $amt Monkey Bucks </td>";
				echo "</tr>";
       			 }
	 			 
                echo "</tbody>";
             echo " </table>";
            echo "</section>";
			}
			else if ($_GET['query'] == "checkact")
			{
			$sql = mysqli_query($conn2, " CALL getCheckingAccounts()");	
			echo "<header>";
             echo " <h2> Here is a list of all customers and their Checking Accounts </h2> <p>If Customers do not have a checking account then their value in the table will be blank</p>";
            echo "</header>";
			
            echo "<section id='main' class='container large'>";
              echo "<table style = 'width:100%'>";
                echo "<thead>";
                 echo " <tr>" ;
                    echo "<th><b>Account ID</b></th>";
                    echo "<th><b>Checking Account Number</b></th>";
					echo "<th><b>Balance</b></th>";
                  echo "</tr>";
               echo " </thead>";
               echo " <tbody>";

	          while (list($id, $cid, $bal) = mysqli_fetch_array($sql))
             {
				echo "<tr align='center'>";
				echo "<td> $id </td>";
				echo "<td> $cid </td>";
				echo "<td> $bal Monkey Bucks</td>";
				echo "</tr>";
       			 }
	 			 
                echo "</tbody>";
             echo " </table>";
            echo "</section>";
			}
			else if ($_GET['query'] == "aveage")
			{
			$sql = mysqli_query($conn2, " CALL  avgAgeUsersWithLoanOverXDollars('" . $_POST['loanamt'] . "')");
			list($ave) = mysqli_fetch_array($sql);
			$lmt = $_POST['loanamt'];
		     echo "<header>";
             echo " <h2> Average age of users with loans over $lmt Monkey Bucks</h2> <p>Average Age = $ave</p>";
            echo "</header>";
			}
			else if ($_GET['query'] == "transac")
			{
			$month1 = $_POST['Month1'];
			$day1 = $_POST['day1'];
			$year1 = $_POST['year1'];
			$date1 = "$year1-$month1-$day1";
			$month2 = $_POST['Month2'];
			$day2 = $_POST['day2'];
			$year2 = $_POST['year2'];
			$date2 = "$year2-$month2-$day2";
		    $sql = mysqli_query($conn2, " CALL getNumberOfTransactions('" . $date1 . "', '" . $date2 . "')");
			echo "<header>";
             echo " <h2>Transaction Count Query</h2><p>Here are the number of transactions per account between $date1 and $date2</p>";
            echo "</header>";
			
            echo "<section id='main' class='container large'>";
              echo "<table style = 'width:100%'>";
                echo "<thead>";
                 echo " <tr>" ;
                    echo "<th><b>Account ID</b></th>";
                    echo "<th><b>Number of Transactions</b></a></th>";
                  echo "</tr>";
               echo " </thead>";
               echo " <tbody>";

	          while (list($id, $transactions) = mysqli_fetch_array($sql))
             {
				echo "<tr  align='center'>";
				echo "<td> $id </td>";
				echo "<td> $transactions</td>";
				echo "</tr>";
       			 }
	 			 
                echo "</tbody>";
             echo " </table>";
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
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Code Monkeys. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>