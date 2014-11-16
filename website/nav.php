<?php
session_start();
     $uID = $_SESSION['uID'];
	include("connect.php");
	
	echo "<nav id=\"nav\" class=\"skel-layers-fixed\"><ul>";
    echo "<li class=\"current\"><a href=\"index.php\">Home</a></li>";
    echo "<li><a href=\"CheckingAccounts.php\">Monkey Checking</a></li>";
    echo "<li><a href=\"#\">Monkey Savings</a></li>";
    echo "<li><a href=\"#\">Monkey Loans</a></li>";
						if(isset($_SESSION['uID'])) {
						    echo "<li> <a href=\"\">Account</a> <ul>";
        					echo "<li><a href=\"user.php\">Bank Account Overview</a></li>";
       						echo "<li><a href=\"myaccount.php\">My Account</a></li> </ul>  </li>";
							echo "<li><a href=\"logout.php\">Log Out</a></li>";
						} else {
							echo "<li><a href=\"login.php\">Login</a></li>";
							echo "<li><a href=\"register.php\">Register</a></li>";
						}
					
  echo "</ul>";
echo "</nav>";
?>
