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
           
            $Username = $_GET['username'];		
            // $Password = $_GET['password'];

 

            // $result = mysqli_query($conn,"SELECT * FROM info_users");
            $result = mysqli_query($conn,"SELECT * FROM info_users WHERE username = '$Username'");
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                // header('Content-type: application/json');
                echo json_encode($output);
            }
        } else echo "Wellcome";
    }

		
    

