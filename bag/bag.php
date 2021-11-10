<html>

	<head>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="page-content">
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
			
			<div class='page-content'>
				<div class='bag-list'>
					<!--list header-->
					<span></span>
					<h4>Size</h4>
					<h4>Color</h4>
					<h4>Quantity</h4>
					<h4>Promotion</h4>
					<h4>Line Total</h4>
					<img src='../images/product1.jpg' class='product-thumbnail'></img>
					<span>Medium</span>
					<span>White</span>
					<span>1</span>
					<span>50% off EOSS</span>
					<span>$50</span>
				</div>
				<div class='bag-footer'>
					<span>Order Sub-Total</span>
					<span>$100</span>
					<span>Discounts Applied:</span>
					<span>-$50</span>
					<span>Order Total</span>
					<span>$50</span>
				</div>
				<form method='POST' action='../order-confirmation/order-confirmation.php' class='checkout'>
					<span>Credit Card Number:</span><span><input type='number' name='credit-card' value='yyyy-mm'/></span>
					<span>Expiration Date:</span><span><input type='date' name='expiration-date'></span>
					<span>Name on Card:</span><span><input type='text' name='customer-name'/></span>
					<span></span><span><input type='image' name='checkout' src='../images/button_checkout.png'/></span>
				</form>
			</div>
			
		</div>
	</body>
</html>