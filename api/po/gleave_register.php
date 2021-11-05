<?php
header("content-type:text/javascript;charset=utf-8");
error_reporting(0);
error_reporting(E_ERROR | E_PARSE);

$link = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91', "gtw");
	if (!$link) {
		echo "เชื่อต่อฐานไม่ได้: Unable to connect to MySQL." . PHP_EOL;
		echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
		echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;		
		exit;
	}	
	if (!$link->set_charset("utf8")) {
		printf("Error loading character set utf8: %s\n", $link->error);
		exit();
		}
		$id = $_GET['ID'];	
		$status = 'Verify';
		$result = mysqli_query($link, "SELECT gr.ID,gr.LEAVE_WORK_SEND,gt.LEAVE_TYPE_NAME,gr.LEAVE_PERSON_FULLNAME,gr.LEAVE_BECAUSE,gr.LEAVE_STATUS_CODE,gr.LEAVE_YEAR_ID,gl.LOCATION_NAME,gr.LEAVE_DATE_BEGIN,gr.LEAVE_DATE_END,pe.HR_DEPARTMENT_SUB_SUB_ID,gr.LEAVE_WORK_SEND_ID\n"	
		. "FROM gleave_register gr\n"
		. "LEFT JOIN gleave_location gl ON gl.LOCATION_ID = gr.LOCATION_ID\n"
		. "LEFT JOIN gleave_type gt ON gt.LEAVE_TYPE_ID = gr.LEAVE_TYPE_CODE\n"
		. "LEFT JOIN hrd_person pe ON pe.ID = gr.LEAVE_PERSON_ID\n"
		. "WHERE LEAVE_STATUS_CODE = '$status'\n"
		. "ORDER BY gr.ID DESC ");			
	   
		while($row=mysqli_fetch_assoc($result)){
		$output[]=$row;
		}	
		echo json_encode($output);
	
		mysqli_close($link);






		
	?>