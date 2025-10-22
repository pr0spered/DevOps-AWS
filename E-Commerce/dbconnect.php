<?php
$host = "<host>";
$port = 3306;
$dbname = "ecomm-data";
$username = "admin";
$password = "12345678";

$conn = new mysqli($host, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully to RDS!";