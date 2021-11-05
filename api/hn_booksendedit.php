<?php
  include('config.php');
    
  header("Access-Control-Allow-Origin: *");
  
  if (!$conn) {
	echo "Error: Unable to connect to MySQL." . PHP_EOL;
	echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
	echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;		
	exit;
}
if (!$conn->set_charset("utf8")) {
	printf("Error loading character set utf8: %s\n", $conn->error);
	exit();
}
if(isset($_GET)){
	if ($_GET['isAdd'] == 'true') { 
				
        $id = $_GET['BOOK_ID'];       
        $status = $_GET['SEND_STATUS'];
        $bookuse = $_GET['BOOK_USE'];
        $booknote = $_GET['BOOK_NOTE'];
        
		$sql = "UPDATE `gbook_index_inside` SET `SEND_STATUS` = '$status',`BOOK_USE` = '$bookuse',`BOOK_NOTE` = '$booknote' WHERE BOOK_ID = '$id'";

        $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());

       
		if ($result) {
			while($row=mysqli_fetch_assoc($result)){
				$output[]=$row;
			}
			// header('Content-type: application/json');
			echo json_encode($output);
		}
	} else echo "Wellcome";
}