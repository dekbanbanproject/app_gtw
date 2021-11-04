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
           
            $idper = $_GET['personid'];	
          
            $result = mysqli_query($conn, "SELECT gi.ID,gi.BOOK_NUM,gi.RECORD_HEAD,gi.USER_POST_NAME,gi.DATE_GO,gi.DATE_BACK,gi.RECORD_HEAD_USE,gi.STATUS,gi.LEADER_HR_ID,gt.RECORD_TYPE_NAME,gol.LOCATION_ORG_NAME,gg.RECORD_GO_NAME,gl.RECORD_LEVEL_NAME,gv.RECORD_VEHICLE_NAME,gw.WITHDRAW_NAME,gi.OFFER_WORK_HR_NAME\n"		
            . "FROM grecord_index gi\n"
            . "LEFT JOIN grecord_type gt ON gt.RECORD_TYPE_ID = gi.RECORD_TYPE_ID\n"
            . "LEFT JOIN grecord_go gg ON gg.RECORD_GO_ID = gi.RECORD_GO_ID\n"
            . "LEFT JOIN grecord_org_location gol ON gol.LOCATION_ID = gi.RECORD_LOCATION_ID\n"
            . "LEFT JOIN grecord_level gl ON gl.ID = gi.RECORD_LEVEL_ID\n"
            . "LEFT JOIN grecord_vehicle gv ON gv.RECORD_VEHICLE_ID = gi.RECORD_VEHICLE_ID\n"
            . "LEFT JOIN grecord_withdraw gw ON gw.WITHDRAW_ID = gi.RECORD_MONEY_ID\n"
            . "LEFT JOIN hrd_person hp ON hp.ID = gi.RECORD_USER_ID\n"
            . "WHERE gi.STATUS = 'APPLY'"
            . "AND gi.LEADER_HR_ID = '$idper' ORDER BY gi.ID DESC ");	

            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                // header('Content-type: application/json');
                echo json_encode($output);
            }
        } else echo "Wellcome";
    }

		
    

