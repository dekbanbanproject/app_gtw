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
           
            $id = $_GET['LEADER_PERSON_ID'];	
		    $status = 'Pending';
          
            $result=mysqli_query($conn,"SELECT count(*) as total FROM gleave_register WHERE LEAVE_STATUS_CODE = 'Pending' AND LEADER_PERSON_ID = $id ");
            // $data=mysql_fetch_assoc($result);
            
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

