<html>

	<head>
		<link rel='stylesheet' href='styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="logout-button">
			<a href='login.php'><img src='button_logout.png'></img></a>
		</div>
		<div class="page-content">
			<a class="logo"></a>
			
			<a href='products.php'>View Products</a>
			
			<form method='POST' action=''>
				<input  type='search' name='search-products'>
				<input type='submit' name='search' value = 'Search'>
			</form>
			
			<!-- Portfolio -->
			<div id="portfolio" class="container-fluid text-center">
				<h2>Offers & Promotions</h2>
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
							<h4><a href=''>Holiday Promotions</a></h4>
							<a href=''><img src='kitty1.jfif' style="height: 150px"></img></a>
						</div>
						<div class="item">
							<h4><a href=''>Buy 1 Get 1 Sale</a></h4>
							<a href=''><img src='kitty1.jfif' style="height: 150px"></img></a>
						</div>
						<div class="item">
							<h4><a href=''>40% off End of Summer Sale</a></h4>
							<a href=''><img src='kitty1.jfif' style="height: 150px"></img></a>
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