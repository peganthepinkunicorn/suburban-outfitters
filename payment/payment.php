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
$page_roles = array('admin', 'employee', 'customer');

require_once '../bag/bag.php';
require_once  '../dbinfo/dbinfo.php';
require_once '../dbinfo/user.php';
require_once '../dbinfo/checksession.php';

echo "<h3>Welcome, $username!</h3>";
?>
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
							<li><a href='../logout/logout.php'>Logout</a></li>
							<li><a href='../bag/shoppingbag.php'>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>
			

<?php

//Get Customer Information
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);
$cust_query = ("select * from customer where username ='$username'");

$result = $conn->query($cust_query); 
if(!$result) die($conn->error);

$rows = $result->num_rows;
for($j=0; $j<$rows; $j++)
{
	$row= $result ->fetch_array(MYSQLI_ASSOC);
	$f_name = $row['f_name'];
	$l_name = $row['l_name'];
	$cust_id = $row['cust_id'];
}
//End of getting customer information

if(isset($_GET["checkout"])){
	$bagarray = $_SESSION["bag"];
	
	$item = $bagarray[0];
	echo "Username: $item->username"; echo "<br>";
	echo "Date: $item->bagdate";echo "<br><br>";
	
	$count=0;
	$grand=0;
	foreach($bagarray as $item){
		
		$prod_id = $item->prod_id;
		$prod_name = $item->prod_name;
		$quantity= $item->quantity;
		$price = $item->price;
		$total = $item->total;
		$status = $item->status;
		$grand = $grand + $total;
		$count++;
		
echo <<<_END
		
		$prod_name $quantity at $$price each total $$total
		<br><br>

_END;
		
	}
	echo "Grand Total: $$grand <br><br>";

//Get Customer Information
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);
$pmt_query = ("select customer.cust_id, card_id, name_on_card, card_number, exp_date, sec_num, card_type
	from customer, cust_saved_pmt
	where customer.username ='$username' AND customer.cust_id = cust_saved_pmt.cust_id");

$result = $conn->query($pmt_query); 
if(!$result) die($conn->error);

$rows = $result->num_rows;
for($j=0; $j<$rows; $j++)
{
	$row= $result ->fetch_array(MYSQLI_ASSOC);

echo <<<_END

	<form method='POST' action='payment.php' class='checkout'>
		<input type ='radio' id='$row[card_id]' name='card_id' value='$row[card_id]'> Use Saved $row[card_type] card expiring $row[exp_date] <br>
_END;

}

	echo <<<_END
		<input type='hidden' name='saved' value='1'>
		<span></span><span><input type='submit' value='Pay with Saved Payment'></span>
		<input type='hidden' name='grand' value='$grand'>
	</form>
_END;

echo <<<_END
	<form method='post' action='payment.php' class='checkout'>
		<span></span><span>Add New Payment</span>
		<span>Credit Card Number:</span>
		<span><input type='number' name='card_number' maxLength="16" required></span>
		
		<span>Card Type:</span>
		<span><select name='card_type' id='card_type'></span>
			<span><option value='AmericanExpress'>AmericanExpress</option></span>
			<span><option value='Discover'>Discover</option></span>
			<span><option value='MasterCard'>MasterCard</option></span>
			<span><option value='Visa'>Visa</option></span>
		
		<span>Expiration Date:</span>
		<span><input type='date' name='exp_date' required></span>
		
		<span>Name on card:</span>
		<span><input type='text' name='name_on_card' maxLength="128" required></span>
		
		<span>CVV:</span>
		<span><input type='number' name='sec_num' maxLength="4" required></span>
		
		<span></span><span><input type='submit' value='Pay with New Card'></span>
		
		<input type='hidden' name='pay' value='1' >
		<input type='hidden' name='grand' value='$grand'>
	</form>

_END;
	
}


if(isset($_POST['pay'])){
	
	$conn = new mysqli($hn, $un, $pw, $db);
	if($conn->connect_error) die($conn->connect_error);
	
	$card_number = $_POST['card_number'];
	$exp_date = $_POST['exp_date'];
	$name_on_card = fix_string($_POST['name_on_card']);
	$sec_num = $_POST['sec_num'];
	$card_type = $_POST['card_type'];
	$grand = $_POST['grand'];
		
	$bagarray = $_SESSION['bag'];
	$firstcart = $bagarray[0];
	$username = $firstcart->username;
	$date = $firstcart->bagdate;
	$emp_id= 1;
	$store_id = 1;
	
	//create Order
	$insert_order = "insert into cust_order (emp_id, cust_id, store_id, order_date, order_total) values ($emp_id, '$cust_id', $store_id, '$date', $grand)";
	//echo $query1; 
	$result = $conn->query($insert_order); 
	if(!$result) die($conn->error);
	
	$order_id = $conn->insert_id;
	
	//process each orderline item in the bag
	foreach ($bagarray as $item){		
		$prod_id = $item->prod_id;
		$prod_name = $item->prod_name; 
		$quantity = $item->quantity; 
		$price = $item->price;
		$line_total = $item->total;
		$status = $item->status;
		
		//insert into orderline items
		$insert_orderlines = "insert into orderline (order_id, prod_id, quantity, price, promo_percent, line_total) values ($order_id, $prod_id, $quantity, $price, 0, $line_total)";
		$result = $conn->query($insert_orderlines); 
		if(!$result) die($conn->error);
		
		$line_id = $conn->insert_id;
		
		//remove product from inventory
		$remove_inventory = "insert into inventory (prod_id, cust_id, line_id, store_id, date, quantity) values ($prod_id, $cust_id, $line_id, $store_id, '$date', $quantity)";
		$result = $conn->query($remove_inventory); 
		if(!$result) die($conn->error);
	}
	
	
	
	//create saved payment
	$insert_saved_pmt = "insert into cust_saved_pmt (cust_id, name_on_card, card_number, card_type, exp_date, sec_num) values ($cust_id,'$name_on_card','$card_number', '$card_type', '$exp_date', '$sec_num')";
	$result = $conn->query($insert_saved_pmt); 
	if(!$result) die($conn->error);	
	
	//pay for order record (order_pmt)
	$card_id = $conn->insert_id;
	$insert_order_pmt = "insert into order_pmt (card_id, order_id, pmt_date, pmt_amt) values ($card_id, $order_id, '$date', '$grand')";
	$result = $conn->query($insert_order_pmt); 
	if(!$result) die($conn->error);	
	
	
	
	//empty the bag
	$_SESSION["bag"] = null;		
		
	echo "Thanks, $f_name! Your order confirmation number is $order_id. Your purchase will ship soon. <br>";
	echo "<a href='product.php'>Shop again</a><br>";
	
}

if(isset($_POST['saved'])){
	
	$conn = new mysqli($hn, $un, $pw, $db);
	if($conn->connect_error) die($conn->connect_error);
	
	
	$grand = $_POST['grand'];
		
	$card_id = $_POST['card_id'];
	
	
	$bagarray = $_SESSION['bag'];
	$firstcart = $bagarray[0];
	$username = $firstcart->username;
	$date = $firstcart->bagdate;
	$emp_id= 1;
	$store_id = 1;
	
	
	//create Order
	$insert_order = "insert into cust_order (emp_id, cust_id, store_id, order_date, order_total) values ($emp_id, $cust_id, $store_id, '$date', '$grand')";
	//echo $query1; 
	$result = $conn->query($insert_order); 
	if(!$result) die($conn->error);
	
	$order_id = $conn->insert_id;
	
	//process each orderline item in the bag
	foreach ($bagarray as $item){		
		$prod_id = $item->prod_id;
		$prod_name = $item->prod_name; 
		$quantity = $item->quantity; 
		$price = $item->price;
		$line_total = $item->total;
		$status = $item->status;
		
		//insert into orderline items
		$insert_orderlines = "insert into orderline (order_id, prod_id, quantity, price, line_total) values ($order_id, $prod_id, $quantity, $price, $line_total)";
		$result2 = $conn->query($insert_orderlines); 
		if(!$result2) die($conn->error);
		
		$line_id = $conn->insert_id;
		
		//remove product from inventory
		$remove_inventory = "insert into inventory (prod_id, cust_id, line_id, store_id, date, quantity) values ($prod_id, $cust_id, $line_id, $store_id, '$date', -$quantity)";
		$result = $conn->query($remove_inventory); 
		if(!$result) die($conn->error);
		
	}
	
	//pay for order record (order_pmt)
	$insert_order_pmt = "insert into order_pmt (card_id, order_id, pmt_date, pmt_amt) values ($card_id, $order_id, '$date', '$grand')";
	$result2 = $conn->query($insert_order_pmt); 
	if(!$result2) die($conn->error);
	
	//empty the bag
	$_SESSION["bag"] = null;		
		
	echo "Thanks, $f_name! Your order confirmation number is $order_id. Your purchase will ship soon. <br>";
	echo "<a href='../products/products.php'>Shop again</a><br>";
	
}

///sanitization function
function fix_string($string){
	$string = stripslashes($string);
    $string = strip_tags($string);
    $string = htmlentities($string);
    return $string;
}

$conn->close();

?>



</html>