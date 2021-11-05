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
           
            $id = $_GET['personid'];	
		    $status = 'Pending';
           
            $result = mysqli_query($conn, "SELECT gi.BOOK_ID,gi.BOOK_NUM_IN,gi.BOOK_NUMBER,gi.BOOK_DATE,gt.BOOK_TYPE_NAME,gi.BOOK_NAME,gi.BOOK_DETAIL,gi.SEND_STATUS,gs.BOOK_SECRET_NAME,gi.BOOK_YEAR_ID,gis.INSTANT_NAME,gl.SEND_LD_BY_HR_ID\n"		
                . "FROM gbook_index gi\n"
                . "LEFT JOIN gbook_type gt ON gt.BOOK_TYPE_ID = gi.BOOK_TYPE_ID\n"   
                . "LEFT JOIN gbook_index_send_leader gl ON gl.BOOK_LD_ID = gi.BOOK_ID\n"   
                . "LEFT JOIN gbook_secret gs ON gs.BOOK_SECRET_ID = gi.BOOK_SECRET_ID\n"    
                . "LEFT JOIN gbook_instant gis ON gis.INSTANT_ID = gi.BOOK_URGENT_ID\n" 
                . "WHERE gl.SEND_LD_BY_HR_ID = $id\n" 	
                // . "WHERE gi.SEND_STATUS = 4\n"
                . "ORDER BY gi.BOOK_ID DESC ");	
         
            // $result = mysqli_query($conn, "SELECT LEAVE_YEAR_ID,LEAVE_BECAUSE,LEAVE_DATE_BEGIN,LEAVE_DATE_END,LEAVE_PERSON_FULLNAME FROM gleave_register\n"
            // . "WHERE LEAVE_STATUS_CODE = 'Pending' ORDER BY ID DESC" );

            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
        } else echo "Wellcome";
    }

