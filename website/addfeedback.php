<?php
session_start();
     $uID = $_SESSION['uID'];
	include("connect.php");
	
	$result = mysql_query("SELECT name, email, phoneNumber FROM userinfo WHERE uID = $uID");
	$row  = mysql_fetch_array($result);
		$name = $row[name];
		$email = $row[email];
		$phoneNumber = $row[phoneNumber];
	
    if(isset($_POST["message"]))
	{ 
	$content = $_POST["message"];
	mysql_query("INSERT INTO customercomplaints (uID, name, email, phoneNumber, message)($uID, $name, $email, $phoneNumber, $content)");
	header("Location:index.php");
	}
?>
