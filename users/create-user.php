<?php
$page_roles = array('admin');
require_once '../dbinfo/dbinfo.php';
require_once '../dbinfo/checksession.php';

$fail='';


?>

<html>
	<head>
		<title>Add User</title>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<body>
		<div class="page-content">
		<!--Nav Bar-->
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="collapse navbar-collapse" id="myNavbar">
						<img src='..//images/logo.png' class='logo-round'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/adminhome.php'>Admin Home</a></li>
							<li><a href='../logout/logout.php'>Logout</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="page-content">
				<a href='user-list.php'>Go back to User List</a>
				<div class = 'account-info-grid'>
					<form method='post' action='create-user.php' class='account-info-grid' onsubmit='return validate(this)'>
						<span>Username:</span> <span><input type='text' name='username'></span>
						<span>First Name:</span><span><input type='text' name='f_name'></span>
						<span>Last Name:</span><span><input type='text' name='l_name'></span>
						<span>Create Password:</span><span><input type='password' name='password1'></span>
						<span>Re-enter Password:</span><span><input type = 'password' name='password2'></span>
						<span>Roles:</span><span></span>
							<span><input type = 'radio' id='customer' name='role' value='customer' $A checked></span><span>Customer</span>
							<span><input type = 'radio' id='admin' name='role' value='admin' $B></span><span>Admin</span>
						<input type='submit' value='Add User'>
					</form>
				</div>
				<div class='warning'>
			

<?php
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_POST['username']))
{
	//Get Variables & sanitize strings
	$username = fix_string($_POST['username']);
	$f_name = fix_string($_POST['f_name']);
	$l_name = fix_string($_POST['l_name']);
	$password1 = fix_string($_POST['password1']);
	$password2 = fix_string($_POST['password2']);
	$role = $_POST['role'];

	$A=$B='';
	if($role='customer') $A='checked';
	if($role='admin') $B='checked';	
	
	$fail .= validate_username ($username);
	$fail .= validate_f_name($f_name);
	$fail .= validate_l_name($l_name);
	$fail .= validate_password1($password1);
	$fail .= validate_password2($password2);
	$fail .= compare_password($password1,$password2);
	$fail .= validate_role($role);
	
	if ($fail == ""){
		echo "Form data validated successfully<br>";
		
		$token = password_hash($password1,PASSWORD_DEFAULT);
		$add_user = "INSERT into users (username, forename, surname, password) values('$username','$f_name','$l_name','$token')";
		$result = $conn->query($add_user);
		if(!$result) die($conn->error);
		
		$add_role = "INSERT into roles (username, role) values('$username','$role')";
		$result = $conn->query($add_role);
		if(!$result) die($conn->error);
		
		header("Location: user-list.php");
		
		}else{
			echo $fail. '<br>';
	}
}

function validate_username ($field){
	return($field == "") ? "No Username was entered. " : "";
}

function validate_f_name($string){
	return ($string == "") ? "First name was not entered.\n" : "";
}

function validate_l_name($string){
	return ($string == "") ? "Last name was not entered.\n" : "";
}

function validate_password1($string){
	return ($string == "") ? "No Password was entered.\n" : "";
}


function validate_password2($string){
	return ($string == "") ? "Please re-type your password.\n" : "";
}

function validate_role($string){
	return ($string == "") ? "Select a role.\n" : "";
}

function compare_password($pass1, $pass2){
	if($pass1==$pass2) return "";
	else return "Your Passwords do not match\n";
}


///sanitization function
function fix_string($string){
	$string = stripslashes($string);
    $string = strip_tags($string);
    $string = htmlentities($string);
    return $string;
}

?>
			</div>
		</div>
	</body>
</html>