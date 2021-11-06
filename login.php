
<?php
echo <<<_END
<HTML>
<title>Login</title>
<head>
	<link rel='stylesheet' href='styles.css'>
</head>

<body>
	<div class='page-content'>
		<div class='logo'>
			<img src='logo.png'></img>
		</div>
		<div class="login-container bg-grey">
				<h1>Login</h1>
				<form method="POST" action="">
							Username: <br>
							<input type='text' name='username'><br><br>
							Password: <br>
							<input  type='password' name='password'><br><br>
							<div class="login-buttons">
							<input class="login-buttons__submit" type='submit' name='submit' value='Login'/>
							</div>
				</form>
		</div>
	</div>
</body>
</HTML>

_END


//Add New User signup
?>