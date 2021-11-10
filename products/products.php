<html>

	<head>
		<link rel='stylesheet' href='..//styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class='page-content'>
			<!--Nav Bar-->
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="collapse navbar-collapse" id="myNavbar">
						<img src='../images/logo.png' class='logo-round'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/home.php'>Home</a></li>
							<li><a href='../products/products.php'>Products</a></li>
							<li><a href=''>Sales</a></li>
							<li><a href='../account/account.php'>Account</a></li>
							<li><a href=''>Contact Us</a></li>
							<li><a href='../login/login.php'>Logout</a></li>
							<li><a href='../bag/bag.php'>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class='product-container'>
				<!--Filter container-->
				<div>
					<form class='filter-container' method='post' action=''>
						<h3>Filter</h3>
						<h4>size</h4>
							<span>Small <input type='checkbox' name='Size'/></span>
							<span>Medium <input type ='checkbox' name='size'/></span>
							<span>Large <input type = 'checkbox' name = 'size'/></span>
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
				<!--Products List-->
					<div class='product-list'>
						<!--Product 1-->
						<div class='product-detail'>
							<a href='../product1/product1.php'><img src='../images/product1.jpg' class='product-thumbnail'></img></a>
							<a href='../product1/product1.php'>Product 1</a>
							<span>1 in stock</span>
							<span>$100.00</span>
						</div>
						<!--Product 2-->
						<div class='product-detail'>
							<a href='../product1/product1.php'><img src='../images/product2.jpg' class='product-thumbnail'></img></a>
							<a href='../product1/product1.php'>Product 2</a>
							<span>3 in stock</span>
							<span>$100.00</span>
						</div>
						<!--Product 3-->
						<div class='product-detail'>
							<a href='../product1/product1.php'><img src='../images/product3.jpg' class='product-thumbnail'></img></a>
							<a href='../product1/product1.php'>Product 3</a>
							<span>2 in stock</span>
							<span>$100.00</span>
						</div>
					</div>
			</div>
		</div>
	</body>

</html>