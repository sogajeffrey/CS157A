<?php
session_start();
     $uID = $_SESSION['uID'];
	include("connect.php");
	
    if(isset($_POST["message"]))
	{ 
	$content = $_POST["message"];
	mysql_query("INSERT INTO customercomplaints (uID, name, email, phoneNumber, message)($uID, $name, $email, $phoneNumber, $content)");
	header("Location:index.php");
	}
?>
