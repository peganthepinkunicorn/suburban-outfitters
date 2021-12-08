<?php

class bagitem{
	
	public $username, $bagdate, $prod_name, $prod_id, $quantity, $price, $total, $status, $image;
	
	function __construct($username, $date, $prod_name, $prod_id, $quantity, $price, $total, $status, $image){
		$this->username = $username;
		$this->bagdate = $date;
		$this->prod_id = $prod_id;
		$this->prod_name = $prod_name;
		$this->quantity = $quantity;
		$this->price = $price;
		$this->total = $total;
		$this->status = $status;
		$this->image = $image;
	}
	
}

/*

	$bagitem = new bagitem($username, $date, $prod_name, $prod_id, $quantity, $sale_price, $total, $status);

//create the shopping cart
$cart = array();
$cartitem1 = new CartItem("bsmith","01/01/2021",1234,2,2.10, 4.20,"active");

array_push($cart, $cartitem1);

//add to the cart
$cartitem2 = new CartItem("bsmith","01/01/2021",34,2,2.10, 4.20,"active");
$cartitem3 = new CartItem("bsmith","01/01/2021",87,2,2.10, 4.20,"active");
$cartitem4 = new CartItem("bsmith","01/01/2021",698,2,2.10, 4.20,"active");

array_push($cart, $cartitem2);
array_push($cart, $cartitem3);
array_push($cart, $cartitem4);

print_r($cart);
echo "<br>";
echo "<br>";

//add to DB

function addtoDB($cart){
	
	//create order first
	$stmt = "insert into order () values ()";
	
	
	//add to order item
	foreach($cart as $item){
		$userid = $item->userid;
		$productid = $item->productid;
		
		$stmt = "insert into orderitem () values ()";

	}
}

//empty the cart
$cart = array();

//test
print_r($cart);

*/

?>