<?php

require_once '../dbinfo/dbinfo.php';
require_once '../dbinfo/user.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if (isset($_POST['username']) && isset($_POST['password'])) {
	
	//Get values from login screen
	$tmp_username = mysql_entities_fix_string($conn, $_POST['username']);
	$tmp_password = mysql_entities_fix_string($conn, $_POST['password']);
	
	//get password from DB w/ SQL
	$query = "SELECT password FROM users WHERE username = '$tmp_username'";
	
	$result = $conn->query($query); 
	if(!$result) die($conn->error);
	
	$rows = $result->num_rows;
	$passwordFromDB="";
	for($j=0; $j<$rows; $j++)
	{
		$result->data_seek($j); 
		$row = $result->fetch_array(MYSQLI_ASSOC);
		$passwordFromDB = $row['password'];
	}
	
	//Compare passwords
	if(password_verify($tmp_password,$passwordFromDB))
	{
		echo "successful login<br>";
		
		$user = new User($tmp_username);

		session_start();
		$_SESSION['user'] = $user;
		
		$query = "SELECT role FROM roles WHERE username = '$tmp_username'";
		$result = $conn->query($query);
		if(!$result) die($conn->error);
		
		$rows = $result->num_rows;
		for($j=0; $j<$rows; $j++)
		{
			$result->data_seek($j);
			$row = $result->fetch_array(MYSQLI_ASSOC);
			$urole = $row['role'];
		}
		
		if($urole=='customer') 
		{
			header('Location: ../home/home.php'); 
		} else
			header('Location: ../home/adminhome.php');
		
		
	}
	else
	{
		echo "login error<br>";
	}	
	
}

$conn->close();


//sanitization functions
function mysql_entities_fix_string($conn, $string){
	return htmlentities(mysql_fix_string($conn, $string));	
}

function mysql_fix_string($conn, $string){
	$string = stripslashes($string);
	return $conn->real_escape_string($string);
}



?>

<!--Add New User signup-->


<HTML>
<title>Login</title>
<head>
	<link rel='stylesheet' href='../styles.css'>
</head>

<body>
	<div class='page-content'>
		<div class="login-container bg-grey">
			<img src='../images/logo.png' class='logo-round'></img>
			<h3>Suburban</h3>
			<h3>Outfitters</h3>
			<h1>Login</h1>
			<form method='POST' action='login.php'>
				Username: <br>
				<input type='text' name='username'><br><br>
				Password: <br>
				<input  type='password' name='password'><br><br>
				<div class="login-buttons">
				<input type='image' name='login' src='../images/log-in-button.png'/>
				</div>
			</form>
			<a href='../account/account.php'><img src='../images/signup-button.png'></img></a>
		</div>
	</div>
</body>
</HTML>
