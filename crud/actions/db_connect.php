<?php 

$hostname = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "fswd13_cr10_philipmahlberg_biglibrary";

// create connection
$connect = mysqli_connect($hostname, $username, $password, $dbname);

// check connection
if(mysqli_connect_error()) die("Connection failed");
else echo "<script>console.log('Successfully connected to \"$dbname\" database');</script>";
