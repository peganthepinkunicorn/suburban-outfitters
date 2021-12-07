<?php

$days = 60*60*24*7;

//sets cookie into hard drive of the client.
//setcookie('username','Hannah',time() + $days, '/');

//We're looking for the username. We use if(isset()) to see if username is available in the array. If it is available, we will access the cookie value, 'hannah'
if(isset($_COOKIE['username'])) {
	$username = $_COOKIE['username'];
	echo $username.'<br>';
};

//Destroying a cookie: needs to be issued again, and the date is set in the past, making the cookie invalid.
setcookie('username', 'Hannah', time()-$days, '/');

?>