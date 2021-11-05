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
		$id = $_GET['ID'];	
		$status = 'RECEIVE';
		$result = mysqli_query($link, "SELECT gi.ID,gi.BOOK_NUM,gi.RECORD_HEAD,gi.USER_POST_NAME,gi.DATE_GO,gi.DATE_BACK,gi.RECORD_HEAD_USE,gi.STATUS,gt.RECORD_TYPE_NAME,gol.LOCATION_ORG_NAME,gg.RECORD_GO_NAME,gl.RECORD_LEVEL_NAME\n"		
		. "FROM grecord_index gi\n"
		. "LEFT JOIN grecord_type gt ON gt.RECORD_TYPE_ID = gi.RECORD_TYPE_ID\n"
        . "LEFT JOIN grecord_go gg ON gg.RECORD_GO_ID = gi.RECORD_GO_ID\n"
        . "LEFT JOIN grecord_org_location gol ON gol.LOCATION_ID = gi.RECORD_LOCATION_ID\n"
		. "LEFT JOIN grecord_level gl ON gl.ID = gi.RECORD_LEVEL_ID\n"
		. "LEFT JOIN hrd_person hp ON hp.ID = gi.RECORD_USER_ID\n"
		. "WHERE gi.STATUS = '$status'");		
	   
		while($row=mysqli_fetch_assoc($result)){
		$output[]=$row;
		}	
		echo json_encode($output);
	
		mysqli_close($link);
	?>

