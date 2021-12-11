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

    if ($conn) {
        $sql = 'SELECT * FROM z_chart';
        $query = mysqli_query($conn,$sql);
        $result=array();

        while ($row=mysqli_fetch_assoc($query)) {
            $result[]=$row;
        }
        echo json_encode($result);

    }

      