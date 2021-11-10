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
						<img src='../logo.png' style='height: 50px'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/home.php'>Home</a></li>
							<li><a href='../products/products.php'>Products</a></li>
							<li><a href=''>Sales</a></li>
							<li><a href=''>Account</a></li>
							<li><a href='../login/login.php'>Logout</a></li>
							<li><a href=''>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>
				<!-- Portfolio -->
				<div id="portfolio" class="container-fluid text-center">
					<h3>Offers & Promotions</h3>
					<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<a href=''><h3>Holiday Promotions</h3></a>
								<a href=''><img src='../kitty3.jfif'></img></a>
							</div>
							<div class="item">
								<h3><a href=''>Buy 2 Get 1 Sale</a></h3>
								<a href=''><img src='../kitty2.jfif' ></img></a>
							</div>
							<div class="item">
								<h3><a href=''>40% off End of Summer Sale</a></h3>
								<a href=''><img src='../kitty1.jfif' ></img></a>
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
		</div>
	</body>

</html>