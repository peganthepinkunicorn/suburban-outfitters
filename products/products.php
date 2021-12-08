<?php

$page_roles = array('admin', 'employee', 'customer');

require_once '../dbinfo/checksession.php';
require_once '../dbinfo/user.php';
$conn = new mysqli($hn, $un, $pw, $db);

if ($conn->connect_error) die($conn->connect_error);
?>

<html>

	<head>
		<link rel='stylesheet' href='..//styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class='page-content'>
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
			<div class='product-list'>
<?php
$query=
	"select
		i.prod_id,
		prod_name, type,
		sale_price,
		image,
		sum(quantity) AS available
	from
		product p,
		inventory i
	where
		p.prod_id = i.prod_id
	group BY
		prod_id,
		prod_name,
		type,
		sale_price";

$result=$conn->query($query);

if(!$result) die ($conn->error);

$rows=$result->num_rows;

for($j=0; $j<$rows; $j++) {
	$result->data_seek($j);
	$row=$result->fetch_array(MYSQLI_BOTH);

echo <<<_END

<!--Products-->
				<div class='product-detail'>
					<span><a href='product-detail.php?prod_id=$row[prod_id]'><img src='$row[image]' height='300'></img></a></span>
					<span><a href='product-detail.php?prod_id=$row[prod_id]'>$row[prod_name]</a></span>
					<span>$row[type]</span>
					<span>Price: $$row[sale_price]</span>
					<span>$row[available] available</span>
				</div>
_END;
}
?>
			</div>
		</div>
	</body>
</html>
<?php
$result->close();
$conn->close();
function get_post($conn, $var)
{
	return $conn->real_escape_string($_POST[$var]);
}
?>