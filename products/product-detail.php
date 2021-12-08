<html>
	<head>
		<link rel='stylesheet' href='..//styles.css'>
		<link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<body>
		<div class='page-content'>
<?php

$page_roles = array('admin', 'employee', 'customer');

require_once '../bag/bag.php';
require_once '../dbinfo/dbinfo.php';
require_once '../dbinfo/checksession.php';


if(isset($_GET['prod_id']))
{ //Since we're creating a hyperlink, we're using $_GET. If it came from a form, we would use $_POST

	$prod_id = $_GET['prod_id'];
	
	$query =
		"SELECT
			i.prod_id,
			prod_name,
			type,
			sale_price,
			image,
			sum(quantity) AS available
		FROM
			product p,
			inventory i
		WHERE
			p.prod_id = i.prod_id and
			i.prod_id = $prod_id
		GROUP BY
			prod_id,
			prod_name,
			type,
			sale_price";
}
	$result = $conn->query($query);
	if(!$result) die($conn->error);

	$rows = $result->num_rows;

	for($j=0; $j<$rows; $j++)
	{
			//$result->data_seek($j);
			$row = $result->fetch_array(MYSQLI_ASSOC);
	}

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

echo "<h3>Welcome, $username!</h3>";


			
$result = $conn->query($query); 
if(!$result) die($conn->error);

$rows = $result->num_rows;
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

			<div class='product-container'>
				<div class='product-detail'>
<?php
for($j=0; $j<$rows; $j++)
{
	$row = $result->fetch_array(MYSQLI_ASSOC); 

echo <<<_END
					<span><a href='products.php'>Back to Product List</a></span>
					<span><img src='$row[image]' class='product-image'></img></span>
					<span>$row[prod_name]</span>
					<span>$row[type]</span>
					<span>$row[available] in stock</span>
					<span>Price: $$row[sale_price]</span>
					
					<form action='product-detail.php?prod_id=$row[prod_id]' method='post'>
						<input type='hidden' name='price' value='$row[sale_price]'>
						<input type='hidden' name='prod_id' value='$row[prod_id]'>
						<input type='hidden' name='prod_name' value='$row[prod_name]'>
						<input type='hidden' name='image' value='$row[image]'>
						<span><input type='image' src='../images/button_add-to-bag.png'></span>
					</form>
					
_END;

//add to bag
if(isset($_POST["prod_id"])){
		
	$bag = array();	
	if(isset($_SESSION["bag"])){
		$bag = $_SESSION["bag"];
	}
	
            $username = "$username";
			$date = date("Y/m/d");
            $prod_id = $_POST["prod_id"];
			$prod_name = $_POST["prod_name"];
            $quantity=1;
            $price = $_POST['price'];
            $total = $quantity * $price;
            $status = "active";
			$image = $_POST['image'];

	
	$bagitem = new bagitem($username, $date, $prod_name, $prod_id, $quantity, $price, $total, $status, $image);
	
	array_push($bag, $bagitem);
	
	$_SESSION["bag"] = $bag;

	echo "</span><h3>$quantity $row[prod_name] has been added to your bag!</h3></span>";
}

}
?>

			</div>
		</div>
		</div>
	</body>
</html>