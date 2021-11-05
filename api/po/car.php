<?php
header("content-type:text/javascript;charset=utf-8");
error_reporting(0);
error_reporting(E_ERROR | E_PARSE);
$link = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91', "gtw");
	if (!$link) {
		echo "Error: Unable to connect to MySQL." . PHP_EOL;
		echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
		echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;		
		exit;
	}	
	if (!$link->set_charset("utf8")) {
		printf("Error loading character set utf8: %s\n", $link->error);
		exit();
		}
		$id = $_GET['RESERVE_ID'];	
		$status = 'SUCCESS';
		$result = mysqli_query($link, "SELECT vr.RESERVE_ID,vr.RESERVE_PERSON_NAME,vr.CAR_DRIVER_NAME,vr.RESERVE_NAME,gl.LOCATION_ORG_NAME,vr.RESERVE_BEGIN_DATE,vr.RESERVE_END_DATE,vi.CAR_REG,vr.STATUS\n"		
		. "FROM vehicle_car_reserve vr\n"
		. "LEFT JOIN grecord_org_location gl ON gl.LOCATION_ID = vr.RESERVE_LOCATION_ID\n"
        . "LEFT JOIN vehicle_car_request_status vs ON vs.STATUS_ID = vr.STATUS\n" 
        . "LEFT JOIN vehicle_car_index vi ON vi.CAR_ID = vr.CAR_SET_ID\n"       
		. "WHERE vr.STATUS = '$status'");		
	   
		while($row=mysqli_fetch_assoc($result)){
		$output[]=$row;
		}	
		echo json_encode($output);
	
		mysqli_close($link);
	?>

