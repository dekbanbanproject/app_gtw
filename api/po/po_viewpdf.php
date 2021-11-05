<?php
header("content-type:text/javascript;charset=utf-8");
error_reporting(0);
error_reporting(E_ERROR | E_PARSE);

$link = mysqli_connect('161.82.218.107', 'scan', 'gotowin', "gtw_app");

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
		// $status = 4;		
		$result = mysqli_query($link, "SELECT gi.BOOK_ID,gi.BOOK_NUM_IN,gi.BOOK_NUMBER,gi.BOOK_DATE,gt.BOOK_TYPE_NAME,gi.BOOK_NAME,gi.BOOK_DETAIL,gi.SEND_STATUS,gs.BOOK_SECRET_NAME,gi.BOOK_YEAR_ID,gis.INSTANT_NAME\n"		
		. "FROM gbook_index gi\n"
		. "LEFT JOIN gbook_type gt ON gt.BOOK_TYPE_ID = gi.BOOK_TYPE_ID\n"   
        . "LEFT JOIN gbook_index_send_leader gl ON gl.BOOK_LD_ID = gi.BOOK_ID\n"   
		. "LEFT JOIN gbook_secret gs ON gs.BOOK_SECRET_ID = gi.BOOK_SECRET_ID\n"    
		. "LEFT JOIN gbook_instant gis ON gis.INSTANT_ID = gi.BOOK_URGENT_ID\n"  	
		// . "WHERE gi.SEND_STATUS = 4\n"
		. "ORDER BY gi.BOOK_ID DESC ");	
		
		if ($result) {
			while ($row =mysqli_fetch_assoc($result)){
				$list[] = $row;
			}
			echo json_encode($list);		
		}
             
	?>






