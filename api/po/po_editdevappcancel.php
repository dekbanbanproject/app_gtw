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

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
        $id = $_GET['ID'];       
        $statusC = $_GET['STATUS'];
        
		$sql = "UPDATE `grecord_index` SET `STATUS` = '$statusC' WHERE ID = '$id'";

        $result = mysqli_query($link, $sql);

        if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master";	// if2
   
}	// if1


	mysqli_close($link);
?>