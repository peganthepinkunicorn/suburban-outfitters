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
if(isset($_POST["checkout"])){
	$bagarray = $_SESSION["bag"];
	$units = $_POST['quantity'];
	
	$item = $bagarray[0];
	echo "Username: $item->username"; echo "<br>";
	echo "Date: $item->bagdate";echo "<br><br>";
	
	$count=0;
	$grand=0;
	foreach($bagarray as $item){
			
		$prod_id = $item->prod_id;
		$prod_name = $item->prod_name;
		$quantity = $units[$count];
		$price = $item->price;
		$total = $quantity * $price;
		$status = $item->status;
		$grand = $grand + $total;
		
		//set quantity
		$bagarray[$count]->quantity = $units[$count];
		$bagarray[$count]->total = $total;
		
		$count++;		
		
echo <<<_END
		
		$prod_name $quantity at $$price each total $$total
		<br><br>

_END;
		
	}
	echo "Grand Total: $$grand <br><br>";
	echo "<a href='../payment/payment.php?checkout=1'>Proceed to Payment</a>";
	
}



?>