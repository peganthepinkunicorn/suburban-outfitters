<?php

require_once 'dbinfo.php';

$conn = new mysqli($hn, $un, $pw, $db);
if ($conn->connect_error) die($conn->connect_error);

class User{
	
	public $username;
	public $roles = array(); //one or multiple rows the user has access to.
	
	function __construct($username){ //constructor takes username coming from the front and sets it in the user class to contain the valule of the username coming from the front.
		global $conn;
		
		$this->username = $username;
		
		$query="select role from roles where username='$username' ";
		//echo $query.'<br>';
		$result = $conn->query($query);
		if(!$result) die($conn->error);
			
		$rows = $result->num_rows;	
		
		$roles = Array();
		for($i=0; $i<$rows; $i++){
			$row = $result->fetch_array(MYSQLI_ASSOC);
			//echo $row['role']; echo '<br>';
			$role = $row['role'];
			$this->roles[] = $role;
		}		
		
	}

	function getRoles(){
		return $this->roles;
	}

}

//$user = new User('bsmith');
//$roles = $user -> getRoles();
//print_r($roles);


?>