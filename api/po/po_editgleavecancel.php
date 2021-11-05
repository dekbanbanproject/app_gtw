<?php
$db = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91', "gtw");
mysqli_set_charset($db,"utf8");
if (!$db) {
    echo $db->connect_error;
    exit();
}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
        $id = $_GET['ID'];
        $yearid = $_GET['LEAVE_YEAR_ID'];
        $statusC = $_GET['LEAVE_STATUS_CODE'];
        
		$sql = "UPDATE `gleave_register` SET `LEAVE_YEAR_ID` = '$yearid',`LEAVE_STATUS_CODE` = '$statusC' WHERE ID = '$id'";
        $result = mysqli_query($db, $sql);

     ////  ส่งไลน์แจ้งเตือน /////

     $data = "SELECT `LEAVE_DATE_BEGIN`, `LEAVE_DATE_END`,`LEAVE_BECAUSE` , `LEAVE_PERSON_FULLNAME`,`WORK_DO`, `LEAVE_WORK_SEND`, `LEAVE_TYPE_CODE` FROM gleave_register WHERE ID = '$id'";	
     $res = mysqli_query($db, $data) or die ("Error : $data" .mysqli_error());	 
                  
     while($obj = mysqli_fetch_array($res,MYSQLI_ASSOC))
     {
       $datestart =$obj["LEAVE_DATE_BEGIN"]; 
       $dateend =$obj["LEAVE_DATE_END"];
       $name =$obj["LEAVE_PERSON_FULLNAME"]; 
       $because =$obj["LEAVE_BECAUSE"]; 
       $workjob =$obj["LEAVE_WORK_SEND"]; 
       $do =$obj["WORK_DO"]; 
       $codetype = $obj["LEAVE_TYPE_CODE"];          
     }  
     if ($codetype == "01") {
        $tp = 'ลาป่วย';
     } elseif($codetype == "02") {
         $tp = 'ลาคลอดบุตร';
     } elseif($codetype == "03") {
         $tp = 'ลากิจ';
     } elseif($codetype == "04") {
         $tp = 'ลาพักผ่อน';
     } elseif($codetype == "05") {
         $tp = 'ลาอุปสมบท';
     } elseif($codetype == "06") {
         $tp = 'ลาช่วยภริยาคลอด';
     } elseif($codetype == "07") {
         $tp = 'ลาเกณฑ์ทหาร';
     } elseif($codetype == "08") {
         $tp = 'ลาศึกษา ฝึกอบรม';
     } elseif($codetype == "09") {
         $tp = 'ลาทำงานต่างประเทศ';
     } elseif($codetype == "10") {
         $tp = 'ลาติดตามคู่สมรส';
     } elseif($codetype == "11") {
         $tp = 'ลาฟื้นฟูอาชีพ';
     } elseif($codetype == "12") {
         $tp = 'ลาออก';
     } elseif($codetype == "13") {
         $tp = 'ลาป่วยตามกฎหมายฯ';
     }
     
 //// Line Group  ////
      $linetoken = "SELECT `LINE_TOKEN` FROM line_token WHERE ID_LINE_TOKEN = '8'";	
      $resline = mysqli_query($db, $linetoken) or die ("Error : $linetoken" .mysqli_error());
      while($objet = mysqli_fetch_array($resline,MYSQLI_ASSOC))
      {
          $Linegroup =$objet["LINE_TOKEN"];    
      } 	
  
     function DateThailine($strDate)
     {
       $strYear = date("Y",strtotime($strDate))+543;
       $strMonth= date("n",strtotime($strDate));
       $strDay= date("j",strtotime($strDate));

       $strMonthCut = Array("","ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค.");
       $strMonthThai=$strMonthCut[$strMonth];
       return "$strDay $strMonthThai $strYear";
     }
 
     $sta = 'ไม่อนุมัติ'; 
     $na  = $name ;
     $ds = DateThailine($datestart); 
     $de = DateThailine($dateend); 
     $be = $because; 
     $work = $workjob; 
     $wdo = $do;
     $ptt = $tp;
    
     $message = $header.        
         "\n"." ผู้ลา : " . $na .   
         "\n"." ประเภทการลา : " . $ptt .         
         "\n"." ลาตั้งแต่วันที่ : " . $ds .
         "\n"." ถึงวันที่ : " . $de .
         "\n"." เหตุผล : " . $be .
         "\n"." ผู้รับมอบ : " . $work .
         "\n"."จำนวน : " . $wdo ." วัน" .
         "\n"."สถานะ : " . $sta ;
         

     $sending = $Linegroup;  // Line Token Group   

     $chOne = curl_init();
     curl_setopt( $chOne, CURLOPT_URL, "https://notify-api.line.me/api/notify");
     curl_setopt( $chOne, CURLOPT_SSL_VERIFYHOST, 0);
     curl_setopt( $chOne, CURLOPT_SSL_VERIFYPEER, 0);
     curl_setopt( $chOne, CURLOPT_POST, 1);
     curl_setopt( $chOne, CURLOPT_POSTFIELDS, $message);
     curl_setopt( $chOne, CURLOPT_POSTFIELDS, "message=$message");
     curl_setopt( $chOne, CURLOPT_FOLLOWLOCATION, 1);
     $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$sending.'', );
     curl_setopt($chOne, CURLOPT_HTTPHEADER, $headers);
     curl_setopt( $chOne, CURLOPT_RETURNTRANSFER, 1);
     $result = curl_exec( $chOne );
     if(curl_error($chOne)) { echo 'error:' . curl_error($chOne); }
     else { $result_ = json_decode($result, true);
     echo "status : ".$result_['status']; echo "message : ". $result_['message']; }
     curl_close( $chOne );


     $sendingsubsub = 'q7MyLm4B8u5q47f7sIVwifXk8gjgB0H7jjGhtBQUzoC';  // Line หน่วยงาน   

     $chOne1 = curl_init();
     curl_setopt( $chOne1, CURLOPT_URL, "https://notify-api.line.me/api/notify");
     curl_setopt( $chOne1, CURLOPT_SSL_VERIFYHOST, 0);
     curl_setopt( $chOne1, CURLOPT_SSL_VERIFYPEER, 0);
     curl_setopt( $chOne1, CURLOPT_POST, 1);
     curl_setopt( $chOne1, CURLOPT_POSTFIELDS, $message);
     curl_setopt( $chOne1, CURLOPT_POSTFIELDS, "message=$message");
     curl_setopt( $chOne1, CURLOPT_FOLLOWLOCATION, 1);
     $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$sendingsubsub.'', );
     curl_setopt($chOne1, CURLOPT_HTTPHEADER, $headers);
     curl_setopt( $chOne1, CURLOPT_RETURNTRANSFER, 1);
     $result = curl_exec( $chOne1 );
     if(curl_error($chOne1)) { echo 'error:' . curl_error($chOne1); }
     else { $result_ = json_decode($result, true);
     echo "status : ".$result_['status']; echo "message : ". $result_['message']; }
     curl_close( $chOne1 );


     $worksending = 'bM0bkAa2nCECmA7jtyF4PlGZu9tR59vJ56dio5GtLy1';  // Line ผู้รับมอบ   

     $chOne3 = curl_init();
     curl_setopt( $chOne3, CURLOPT_URL, "https://notify-api.line.me/api/notify");
     curl_setopt( $chOne3, CURLOPT_SSL_VERIFYHOST, 0);
     curl_setopt( $chOne3, CURLOPT_SSL_VERIFYPEER, 0);
     curl_setopt( $chOne3, CURLOPT_POST, 1);
     curl_setopt( $chOne3, CURLOPT_POSTFIELDS, $message);
     curl_setopt( $chOne3, CURLOPT_POSTFIELDS, "message=$message");
     curl_setopt( $chOne3, CURLOPT_FOLLOWLOCATION, 1);
     $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$worksending.'', );
     curl_setopt($chOne3, CURLOPT_HTTPHEADER, $headers);
     curl_setopt( $chOne3, CURLOPT_RETURNTRANSFER, 1);
     $result = curl_exec( $chOne3 );
     if(curl_error($chOne3)) { echo 'error:' . curl_error($chOne3); }
     else { $result_ = json_decode($result, true);
     echo "status : ".$result_['status']; echo "message : ". $result_['message']; }
     curl_close( $chOne3 );

  } else echo "Welcome Master";	// if2   
}	// if1

  mysqli_close($link);
?>