<?php
session_start();
unset($_SESSION["uID"]);
unset($_SESSION["type"]);
header("Location:index.php");
?>