<?php

$page_roles = array('admin', 'employee', 'customer');

require_once 'bag.php';
require_once  '../dbinfo/dbinfo.php';
require_once '../dbinfo/user.php';
require_once '../dbinfo/checksession.php';

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
						<img src='../images/logo.png' class='logo-round'></img>
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
			
			<div class='page-content'>
				

<?php
echo "<form method='post' action = 'checkout.php'>";

if(isset($_SESSION["bag"])){
	$bag = $_SESSION["bag"];

	echo "<form method='post' action='checkout.php'>";
	
	foreach($bag as $item){
		$username = $item->username;
		$date = $item->bagdate;
		$prod_id = $item->prod_id;
		$prod_name = $item->prod_name;
		$quantity= $item->quantity;
		$price = $item->price;
		$total = $item->total;
		$status = $item->status;
		
echo <<<_END
			<div class='bag-list'>
			<span>$prod_name</span><span></span>
			<span>$$price each</span>
			<span>Quantity <input type='text' name='quantity[]' size='2' value='1'></span>
			<span>$$total</span>
			<br>
			</div>
_END;
		
	}
	
	echo "<input type='hidden' name='checkout'>";
	echo "<input type='image' src='../images/button_checkout.png'></form>";
}else{
	echo "Shopping bag is empty";
}



if(isset($_GET["checkout"])){
	if(isset($_SESSION["bag"])){
		
		//Get Customer Information
		$conn = new mysqli($hn, $un, $pw, $db);
		if($conn->connect_error) die($conn->connect_error);
		$query1 = ("select * from customer where username ='$username'");

		$result = $conn->query($query1); 
		if(!$result) die($conn->error);

		$rows = $result->num_rows;
		for($j=0; $j<$rows; $j++)
		{
			$row= $result ->fetch_array(MYSQLI_ASSOC);
			$firstname = $row['f_name'];
			$lastname = $row['l_name'];
			$cust_id = $row['cust_id'];
		}
		//End of getting customer information
		
		$bag = $_SESSION["bag"];
		$user = $_SESSION["user"];
		
		$emp_id = 1;
		$store_id = 1;
		$date = date("YYYY-MM-DD");
		
		$conn = new mysqli($hn, $un, $pw, $db);
		if($conn->connect_error) die($conn->connect_error);
		
		//create Order
		$query2 = "INSERT INTO cust_order (emp_id, cust_id, store_id, order_date, order_total)
					VALUES ($emp_id, $cust_id, $store_id, '$date')";
		
		$result = $conn->query($query2); 
		if(!$result) die($conn->error);		
		$order_id = $conn->insert_id;
		
		$final_total = 0;
		
		foreach($bag as $item){
			$username = $item->username;
			$date = $item->bagdate;
			$prod_id = $item->prod_id;
			$quantity= $item->quantity;
			$price = $item->price;
			$total = $item->total;
			$status = $item->status;
			$final_total+=$total;
			
			//create each OrderItem
			$query3 = "insert into orderline (order_id, order_date, prod_id, quantity, price, line_total) 
				values ($order_id, $date, $prod_id, $quantity, $price, $total)";
			$result = $conn->query($query3); 
			if(!$result) die($conn->error);	
		}
		
		//empty the cart
		$_SESSION["bag"] = null;		
		
		echo "Your order is successfully submitted. Your purchase will ship soon. <br>";
		echo "<a href='shortspage.php'>Shop again</a><br>";
	}
}

?>
				</div>
				<div class='bag-footer'>
				</div>
			</div>
			
		</div>
	</body>
</html>