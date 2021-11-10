<html>

	<head>
		<link rel='stylesheet' href='styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class='logout-button'>
			<a href='login.php'><img src='button_logout.png'></img></a>
		</div>
		<div='page-content'>
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand" href=""></a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="">Women</a></li>
							<li><a href="">Men</a></li>
							<li><a href="">Kids</a></li>
							<li><a href="">Sale</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class = 'filter'>
				<h3>Filter</h3>
				<form method='post' action=''>
					<h4>size</h4>
						<span>Small <input type='radio' name='size'/></span>
						<span>Medium <input type ='radio' name='size'/></span>
						<span>Large </input type = 'radio' name = 'size'/></span>
					<h4>Color</h4>
						<span>Black <input type = 'checkbox' name='color[]'/></span>
						<span>White <input type = 'checkbox' name='color[]'/></span>
						<span>Gray <input type = 'checkbox' name='color[]'/></span>
					<h4>Category</h4>
						<span>Shirts <input type = 'checkbox' name='category[]'/></span>
						<span>Pants <input type = 'checkbox' name='category[]'/></span>
						<span>Dresses <input type = 'checkbox' name='category[]'/></span>
						<span>Accessories <input type = 'checkbox' name='category[]'/></span>
					<input type='submit' name='submit' value='Filter Results'/>
				</form>
			</div>
	</body>

</html>