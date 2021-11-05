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

		$id = $_GET['ID'];	
		$status = 'Verify';
		$result = mysqli_query($link, "SELECT sr.ID,sr.DATE_WANT,sr.DEP_SUB_SUB_PHONE,sr.SAVE_HR_NAME,sr.SAVE_HR_DEP_SUB_NAME,sr.REQUEST_FOR,sr.BUDGET_SUM,sr.STATUS,sr.BUDGET_YEAR,sr.REQUEST_BUY_COMMENT\n"		
		. "FROM supplies_request sr\n"
		. "LEFT JOIN supplies_request_status ss ON ss.STATUS_CODE = sr.STATUS\n"       	
		. "WHERE sr.STATUS = '$status'");	
	   
		if ($result) {
			while($row=mysqli_fetch_assoc($result)){
				$output[]=$row;
			}
			// header('Content-type: application/json');
			echo json_encode($output);
		}
	} else echo "Wellcome";
}

