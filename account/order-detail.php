<?php

$page_roles = array('admin', 'employee', 'customer');

require_once '../dbinfo/checksession.php';
require_once '../dbinfo/user.php';

?>

<html>

	<head>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="page-content">

<?php
echo "<h3>Welcome, $username!</h3>";
?>

			<!--Nav Bar-->
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="collapse navbar-collapse" id="myNavbar">
						<img src='..//images/logo.png' class='logo-round'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/home.php'>Home</a></li>
							<li><a href='../products/products.php'>Products</a></li>
							<li><a href=''>Sales</a></li>
							<li><a href='../account/account.php'>Account</a></li>
							<li><a href=''>Contact Us</a></li>
							<li><a href='../logout/logout.php'>Logout</a></li>
							<li><a href='../bag/shoppingbag.php'>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<span><h3>Order History</h3></span><span></span>
				<div class='orderline-history-list'>
				<span></span><span><h4>Item Name</h4></span><span><h4>Quantity</h4></span><span><h4>Price</h4></span><span><h4>Total</h4></span>
<?php

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_GET['order_id']))
{

	$order_id = $_GET['order_id'];
	
	$get_card_info = "SELECT *
		FROM orderline, product
		WHERE
			order_id = $order_id AND
			orderline.prod_id = product.prod_id";
	
	$result = $conn->query($get_card_info); 
	if(!$result) die($conn->error);

	$rows = $result->num_rows;

	for($j=0; $j<$rows; $j++)
	{
		$row = $result->fetch_array(MYSQLI_ASSOC); 

	echo <<<_END
		
		<span><img src=$row[image] class='product-thumbnail'></img></span>
		<span>$row[prod_name]</span>
		<span>$row[quantity]</span>
		<span>$row[price]</span>
		<span>$row[line_total]</span>
_END;

	}
}



?>
			</div>
		</div>
	</body>
</html>