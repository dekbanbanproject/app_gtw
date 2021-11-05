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

            $result = mysqli_query($conn, "SELECT gr.ID,gr.LEAVE_WORK_SEND,gt.LEAVE_TYPE_NAME,gr.LEAVE_PERSON_FULLNAME,gr.LEAVE_BECAUSE,gr.LEAVE_STATUS_CODE,gr.LEAVE_YEAR_ID,gl.LOCATION_NAME,gr.LEAVE_DATE_BEGIN,gr.LEAVE_TYPE_CODE,gr.LEAVE_DATE_END,pe.HR_DEPARTMENT_SUB_SUB_ID,gr.LEAVE_WORK_SEND_ID\n"		
            . "FROM gleave_register gr\n"
            . "LEFT JOIN gleave_location gl ON gl.LOCATION_ID = gr.LOCATION_ID\n"
            . "LEFT JOIN gleave_type gt ON gt.LEAVE_TYPE_ID = gr.LEAVE_TYPE_CODE\n"
            . "LEFT JOIN hrd_person pe ON pe.ID = gr.LEAVE_PERSON_ID\n"
            . "WHERE gr.LEADER_PERSON_ID = $id\n"
            // . "WHERE gr.LEAVE_STATUS_CODE = '$status'\n"
            . "AND gr.LEAVE_STATUS_CODE = 'Pending' ORDER BY gr.ID DESC ");

            
            // $result = mysqli_query($conn, "SELECT LEAVE_YEAR_ID,LEAVE_BECAUSE,LEAVE_DATE_BEGIN,LEAVE_DATE_END,LEAVE_PERSON_FULLNAME,LEADER_PERSON_ID FROM gleave_register\n"
            // . "WHERE LEADER_PERSON_ID = $id\n"
            // . "AND LEAVE_STATUS_CODE = 'Pending' ORDER BY ID DESC" );

            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
        } else echo "Wellcome";
    }

