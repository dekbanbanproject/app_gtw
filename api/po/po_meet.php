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
		$status = 'SUCCESS';		
		$result = mysqli_query($link, "SELECT ms.ID,ms.PERSON_REQUEST_NAME,ms.PERSON_REQUEST_DEP,ms.PERSON_REQUEST_PHONE,ms.SERVICE_STORY,ms.DATE_BEGIN,ms.STATUS,ms.GROUP_FOCUS,ms.TOTAL_PEOPLE,mi.ROOM_NAME,ms.DATE_END\n"		
		. "FROM meetingroom_service ms\n"
		. "LEFT JOIN meetingroom_index mi ON mi.ROOM_ID = ms.ROOM_ID\n"   
		. "LEFT JOIN meetingroom_service_status mss ON mss.STATUS_CODE = ms.STATUS\n"       	
		. "WHERE ms.STATUS = '$status'");		
	   
		while($row=mysqli_fetch_assoc($result)){
		$output[]=$row;
		}	
		echo json_encode($output);
	
		mysqli_close($link);
	?>

