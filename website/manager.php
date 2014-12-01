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
	
	$result = mysql_query("SELECT name FROM userinfo WHERE uID = '$uID'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) 
	{
		$name = $row['name'];
    }
	
			
?><head>
<title>Manager Portal</title>
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
            <header> <?php echo "<h2> Welcome Manager $name </h2> " ?>
              <p>This is the manager portal.</p>
            </header>
            <header>
              <h3> Run Different Queries here </h3>
            </header>
            <form method=post action="queries.php">
              <div class="row uniform half collapse-at-2">
                <div class="10u">
                  <select name="queries">
                    <option value= "#">Queries</option>
                    <option value= "getNetBalanceOfCustomers()">Get the Net Balance of All Customers (Checking and Savings Combined)</option>
                    <option value= "getProblemLoaners()">Get all Customers who have loan amounts greater than their Checking and Savings </option>
                    <option value= "temp">Query 3</option>
                    <option value= "temp">Query 4</option>
                    <option value= "temp">Query 5</option>
                    <option value= "temp">Query 6</option>
                  </select>
                </div>
                <div class="2u">
                  <input type="submit" value="Run" />
                </div>
              </div>
            </form>
            <br>
            <form method=post action="queries.php">
              <div class="row uniform half collapse-at-2">
                <div class="10u">
                  <input type="text" name="amt" placeholder="Get the Average Age of all customers with loan over this amount" />
                </div>
                <div class="2u">
                  <input type="submit" value="Run" />
                </div>
              </div>
            </form>
            <br>
            <header>
              <h3> Archive Users </h3>
              <p> Archive Users who have been inactive since this day </p>
            </header>
            <form method=post action="archive.php">
              <div class="row uniform half collapse-at-4">
                <div class="4u">
                  <select name="Month">
                    <option value= "">Month</option>
                    <option value= "1">January</option>
                    <option value= "2">February</option>
                    <option value= "3">March</option>
                    <option value= "4">April</option>
                    <option value= "5">May</option>
                    <option value= "6">June</option>
                    <option value= "7">July</option>
                    <option value= "8">August</option>
                    <option value= "9">September</option>
                    <option value= "10">October</option>
                    <option value= "11">November</option>
                    <option value= "12">December</option>
                  </select>
                </div>
                <div class="3u">
                  <input type="text" name="day" placeholder="Day" />
                </div>
                <div class="3u">
                  <input type="text" name="year" placeholder="Year" />
                </div>
                <div class="2u">
                  <input type="submit" value="Archive" />
                </div>
              </div>
            </form>
            <header>
              <h3> Customer Feedback </h3>
            </header>
            <form method=post action="problemcustomers.php">
              <div class="row uniform half collapse-at-2">
                <div class="7u">
                  <select name="prob">
                    <option value= "">Get the customers with this many feedbacks or complaints</option>
                    <option value= "1">1</option>
                    <option value= "2">2</option>
                    <option value= "3">3</option>
                    <option value= "4">4</option>
                    <option value= "5">5</option>
                    <option value= "6">6</option>
                    <option value= "7">7</option>
                    <option value= "8">8</option>
                    <option value= "9">9</option>
                    <option value= "10">10</option>
                    <option value= "11">11</option>
                    <option value= "12">12</option>
                    <option value= "13">13</option>
                    <option value= "14">14</option>
                    <option value= "15">15</option>
                    <option value= "16">16</option>
                    <option value= "17">17</option>
                    <option value= "18">18</option>
                    <option value= "19">19</option>
                    <option value= "20">20</option>
                                  
                 </select>
                </div>
                <div class="5u">
                  <input type="submit" value="Get Results" />
                </div>
              </div>
            </form>
            <ul class="actions">
              <li><a href="viewcomplaints.php" class="button large">View All Feedback</a></li>
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