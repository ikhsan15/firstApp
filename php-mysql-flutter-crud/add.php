<?php 

	include 'database.php';

	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];

	$link->query("INSERT INTO person(firstname,lastname,phone,address)VALUES('".$firstname."','".$lastname."','".$phone."','".$address."')");













































	// include 'database.php';

	// $firstname = $_POST['firstname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(firstname,lastname,phone,address)VALUES('".$firstname."','".$lastname."','".$phone."','".$address."')");

