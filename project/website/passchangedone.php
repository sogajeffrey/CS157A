<?php
session_start();
	if(!isset($_SESSION['uID'])) {
		header("Location:login.php");
	} 
     $uID = $_SESSION['uID'];
	include("connect.php");
	$result = mysql_query("UPDATE userinfo SET password = '". $_POST["newpass1"]."' WHERE uID='$uID'  and password = '". $_POST["passwordold"]."'");
	
	header("Location:index.php");	
?>