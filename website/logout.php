<?php
session_start();
unset($_SESSION["uID"]);
header("Location:index.php");
?>