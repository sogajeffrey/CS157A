<?php
session_start();
unset($_SESSION["uID"]);
unset($_SESSION["type"]);
unset($_SESSION["aID"]);	
header("Location:index.php");
?>