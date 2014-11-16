<?php
session_start();
	if(!isset($_SESSION['uID'])) {
		header("Location:login.php");
	} 
     $uID = $_SESSION['uID'];
	include("connect.php");
	if (isset($_GET['check'])) 
	{
    	$acct = $_GET['check'];
	}
	else
	{
		header("Location:user.php");
	}
	
	$result = mysql_query("UPDATE customerinfo SET password = '". $_POST["newpass1"]."' WHERE uID='$uID'  and password = '". $_POST["passwordold"]."'");
	
	header("Location:user.php");	
?>
