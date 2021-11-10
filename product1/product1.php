<html>
	<head>
		<link rel='stylesheet' href='..//styles.css'>
		<link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<body>
		<div class='page-content'>
			<!--Nav Bar-->
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="collapse navbar-collapse" id="myNavbar">
						<img src='../logo.png' style='height: 50px; border-radius: 50%; border: 3px solid black;'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/home.php'>Home</a></li>
							<li><a href='../products/products.php'>Products</a></li>
							<li><a href=''>Sales</a></li>
							<li><a href=''>Account</a></li>
							<li><a href=''>Contact Us</a></li>
							<li><a href='../login/login.php'>Logout</a></li>
							<li><a href=''>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class='product-container'>
				<div class='product-detail'>
					<div class='product-image'>
						<img src='..//product1.jpg' style='height: 100%'></img>
					</div>				
				</div>
				<form class='product-detail-form' method='POST' action=''>
					<span>1 in stock</span>
					<span>Category: Dress</span>
					<h3>Select size</h3>
						<span>Small <input type='radio' name='size'/></span>
						<span>Medium <input type='radio' name='size'/></span>
						<span>Large <input type='radio' name='size'/></span>
					<h3>Select color</h3>
						<span>Black <input type='radio' name='color'/></span>
						<span>White <input type='radio' name='color'/></span>
						<span>Gray <input type='radio' name='color'/></span>
					<input type='submit' name='add-to-bag' value='Add to Bag'/>
				</form>
			</div>
		</div>
	</body>
</html>