<?php
    include('config.php');
    
    header("Access-Control-Allow-Origin: *");
    // $conn = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91','gtw'); 

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

		$id = $_GET['RESERVE_ID'];	
		$status = 'RECERVE';

		$result = mysqli_query($conn, "SELECT vr.RESERVE_ID,vr.RESERVE_PERSON_NAME,vr.CAR_DRIVER_NAME,vr.RESERVE_NAME,gl.LOCATION_ORG_NAME,vr.RESERVE_BEGIN_DATE,vr.RESERVE_END_DATE,vi.CAR_REG,vr.STATUS\n"		
		. "FROM vehicle_car_reserve vr\n"
		. "LEFT JOIN grecord_org_location gl ON gl.LOCATION_ID = vr.RESERVE_LOCATION_ID\n"
        . "LEFT JOIN vehicle_car_request_status vs ON vs.STATUS_ID = vr.STATUS\n" 
        . "LEFT JOIN vehicle_car_index vi ON vi.CAR_ID = vr.CAR_SET_ID\n"       
		. "WHERE vr.STATUS = '$status'");		
	   
		 if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
        } else echo "Wellcome";
    }
