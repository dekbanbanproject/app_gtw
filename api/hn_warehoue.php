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
           
            $id = $_GET['WAREHOUSE_AGREE_HR_ID'];
       

            $result = mysqli_query($conn, "SELECT w.WAREHOUSE_ID,w.WAREHOUSE_REQUEST_CODE,w.WAREHOUSE_SAVE_HR_NAME,w.WAREHOUSE_DATE_WANT,w.WAREHOUSE_SAVE_HR_ID,w.WAREHOUSE_SAVE_HR_POSITION,w.WAREHOUSE_SAVE_HR_DEP_SUB_NAME,w.WAREHOUSE_STATUS,w.WAREHOUSE_AGREE_HR_ID,w.WAREHOUSE_AGREE_HR_NAME,w.WAREHOUSE_REQUEST_BUY_COMMENT,w.WAREHOUSE_BUDGET_YEAR,w.WAREHOUSE_INVEN_ID,s.INVEN_NAME \n"	         		
            . "FROM warehouse_request w\n"   
            . "LEFT JOIN supplies_inven s ON s.INVEN_ID = w.WAREHOUSE_INVEN_ID\n"          
            . "WHERE w.WAREHOUSE_AGREE_HR_ID = $id\n"
            . "AND w.WAREHOUSE_STATUS = 'Pending' ORDER BY w.WAREHOUSE_ID DESC ");
           

            // $result = mysqli_query($conn, "SELECT WAREHOUSE_ID,WAREHOUSE_REQUEST_CODE,WAREHOUSE_SAVE_HR_NAME,WAREHOUSE_DATE_WANT,WAREHOUSE_SAVE_HR_ID\n"	
            // . "WAREHOUSE_SAVE_HR_POSITION,WAREHOUSE_SAVE_HR_DEP_SUB_NAME,WAREHOUSE_STATUS\n"	
            // . "WAREHOUSE_AGREE_HR_ID,WAREHOUSE_AGREE_HR_NAME,WAREHOUSE_REQUEST_BUY_COMMENT,WAREHOUSE_BUDGET_YEAR,WAREHOUSE_INVEN_ID\n"		
            // . "FROM warehouse_request \n"            
            // . "WHERE WAREHOUSE_AGREE_HR_ID = $id\n"
            // . "AND WAREHOUSE_STATUS = 'Pending' ORDER BY WAREHOUSE_ID DESC ");
           

            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                // header('Content-type: application/json');
                echo json_encode($output);
            

            }
            
            /////////////////////////////////////  ???????????????????????????????????????????????? ////////////////////////////////////////////////////

            // $data = "SELECT `LEAVE_DATE_BEGIN`, `LEAVE_DATE_END`,`LEAVE_BECAUSE` , `LEAVE_PERSON_FULLNAME`,`WORK_DO`, `LEAVE_WORK_SEND`, `LEAVE_TYPE_CODE` FROM gleave_register WHERE ID = '$id'";	
            // $res = mysqli_query($conn, $data) or die ("Error : $data" .mysqli_error());	 
                        
            // while($obj = mysqli_fetch_array($res,MYSQLI_ASSOC))
            // {
            // $datestart =$obj["LEAVE_DATE_BEGIN"]; 
            // $dateend =$obj["LEAVE_DATE_END"];
            // $name =$obj["LEAVE_PERSON_FULLNAME"]; 
            // $because =$obj["LEAVE_BECAUSE"]; 
            // $workjob =$obj["LEAVE_WORK_SEND"]; 
            // $do =$obj["WORK_DO"]; 
            // $codetype = $obj["LEAVE_TYPE_CODE"];          
            // }  
            // if ($codetype == "01") {
            // $tp = '??????????????????';
            // } elseif($codetype == "02") {
            //     $tp = '??????????????????????????????';
            // } elseif($codetype == "03") {
            //     $tp = '???????????????';
            // } elseif($codetype == "04") {
            //     $tp = '???????????????????????????';
            // } elseif($codetype == "05") {
            //     $tp = '???????????????????????????';
            // } elseif($codetype == "06") {
            //     $tp = '?????????????????????????????????????????????';
            // } elseif($codetype == "07") {
            //     $tp = '?????????????????????????????????';
            // } elseif($codetype == "08") {
            //     $tp = '????????????????????? ?????????????????????';
            // } elseif($codetype == "09") {
            //     $tp = '???????????????????????????????????????????????????';
            // } elseif($codetype == "10") {
            //     $tp = '?????????????????????????????????????????????';
            // } elseif($codetype == "11") {
            //     $tp = '???????????????????????????????????????';
            // } elseif($codetype == "12") {
            //     $tp = '???????????????';
            // } elseif($codetype == "13") {
            //     $tp = '????????????????????????????????????????????????';
            // }

            //Qury Linegroup            
            $linetoken = "SELECT `LINE_TOKEN` FROM line_token WHERE ID_LINE_TOKEN = '8'";	
            $resline = mysqli_query($conn, $linetoken) or die ("Error : $linetoken" .mysqli_error());
            while($objet = mysqli_fetch_array($resline,MYSQLI_ASSOC))
            {
                $Linegroup =$objet["LINE_TOKEN"];    
            } 

            //Qury ????????????????????????
            $sql2 = "SELECT `HR_DEPARTMENT_SUB_SUB_NAME`,`LINE_TOKEN` FROM hrd_department_sub_sub WHERE HR_DEPARTMENT_SUB_SUB_ID = '$depss'";
            $resline2 = mysqli_query($conn, $sql2) or die ("Error : $sql2" .mysqli_error());
                while($obje = mysqli_fetch_array($resline2,MYSQLI_ASSOC))
                {
                    $Linegroupdeb =$obje["LINE_TOKEN"]; 
                    $subsubname = $obje['HR_DEPARTMENT_SUB_SUB_NAME'];   
                }

            //Qury ???????????????????????????
            $sql3 = "SELECT `LINE_TOKEN` FROM hrd_person WHERE ID = '$sendworkid'";
            $resline3 = mysqli_query($conn, $sql3) or die ("Error : $sql3" .mysqli_error());
                while($objsend = mysqli_fetch_array($resline3,MYSQLI_ASSOC))
                {
                    $Linesend =$objsend["LINE_TOKEN"];    
                }

            function DateThailine($strDate)
            {
            $strYear = date("Y",strtotime($strDate))+543;
            $strMonth= date("n",strtotime($strDate));
            $strDay= date("j",strtotime($strDate));

            $strMonthCut = Array("","???.???.","???.???.","??????.???.","??????.???.","???.???.","??????.???.","???.???.","???.???.","???.???.","???.???.","???.???.","???.???.");
            $strMonthThai=$strMonthCut[$strMonth];
            return "$strDay $strMonthThai $strYear";
            }

            // $sta = '?????????????????????'; 
            // $na  = $name ;
            // $ds = DateThailine($datestart); 
            // $de = DateThailine($dateend); 
            // $be = $because; 
            // $work = $workjob; 
            // $wdo = $do;
            // $ptt = $tp;
            // $suname = $subsubname;

            // $message = $header.        
            //     "\n"." ??????????????? : " . $na .   
            //     "\n"." ????????????????????????????????? : " . $ptt .  
            //     "\n"." ???????????????????????? : " . $suname .     
            //     "\n"." ????????????????????????????????????????????? : " . $ds .
            //     "\n"." ??????????????????????????? : " . $de .
            //     "\n"." ?????????????????? : " . $be .
            //     "\n"." ??????????????????????????? : " . $work .
            //     "\n"."??????????????? : " . $wdo ." ?????????" .
            //     "\n"."??????????????? : " . $sta ;
                

            // $sending = $Linegroup;  // Line Token Group   

            // $chOne = curl_init();
            // curl_setopt( $chOne, CURLOPT_URL, "https://notify-api.line.me/api/notify");
            // curl_setopt( $chOne, CURLOPT_SSL_VERIFYHOST, 0);
            // curl_setopt( $chOne, CURLOPT_SSL_VERIFYPEER, 0);
            // curl_setopt( $chOne, CURLOPT_POST, 1);
            // curl_setopt( $chOne, CURLOPT_POSTFIELDS, $message);
            // curl_setopt( $chOne, CURLOPT_POSTFIELDS, "message=$message");
            // curl_setopt( $chOne, CURLOPT_FOLLOWLOCATION, 1);
            // $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$sending.'', );
            // curl_setopt($chOne, CURLOPT_HTTPHEADER, $headers);
            // curl_setopt( $chOne, CURLOPT_RETURNTRANSFER, 1);
            // $result = curl_exec( $chOne );
            // if(curl_error($chOne)) { echo 'error:' . curl_error($chOne); }
            // else { $result_ = json_decode($result, true);
            // echo "status : ".$result_['status']; echo "message : ". $result_['message']; }
            // curl_close( $chOne );


            // $sendingsubsub = $Linegroupdeb;  // Line ????????????????????????  ///////

            // $chOne1 = curl_init();
            // curl_setopt( $chOne1, CURLOPT_URL, "https://notify-api.line.me/api/notify");
            // curl_setopt( $chOne1, CURLOPT_SSL_VERIFYHOST, 0);
            // curl_setopt( $chOne1, CURLOPT_SSL_VERIFYPEER, 0);
            // curl_setopt( $chOne1, CURLOPT_POST, 1);
            // curl_setopt( $chOne1, CURLOPT_POSTFIELDS, $message);
            // curl_setopt( $chOne1, CURLOPT_POSTFIELDS, "message=$message");
            // curl_setopt( $chOne1, CURLOPT_FOLLOWLOCATION, 1);
            // $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$sendingsubsub.'', );
            // curl_setopt($chOne1, CURLOPT_HTTPHEADER, $headers);
            // curl_setopt( $chOne1, CURLOPT_RETURNTRANSFER, 1);
            // $result = curl_exec( $chOne1 );
            // if(curl_error($chOne1)) { echo 'error:' . curl_error($chOne1); }
            // else { $result_ = json_decode($result, true);
            // echo "status : ".$result_['status']; echo "message : ". $result_['message']; }
            // curl_close( $chOne1 );


            $worksending = $Linesend;  // Line ???????????????????????????  //////////

            // $chOne3 = curl_init();
            // curl_setopt( $chOne3, CURLOPT_URL, "https://notify-api.line.me/api/notify");
            // curl_setopt( $chOne3, CURLOPT_SSL_VERIFYHOST, 0);
            // curl_setopt( $chOne3, CURLOPT_SSL_VERIFYPEER, 0);
            // curl_setopt( $chOne3, CURLOPT_POST, 1);
            // curl_setopt( $chOne3, CURLOPT_POSTFIELDS, $message);
            // curl_setopt( $chOne3, CURLOPT_POSTFIELDS, "message=$message");
            // curl_setopt( $chOne3, CURLOPT_FOLLOWLOCATION, 1);
            // $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$worksending.'', );
            // curl_setopt($chOne3, CURLOPT_HTTPHEADER, $headers);
            // curl_setopt( $chOne3, CURLOPT_RETURNTRANSFER, 1);
            // $result = curl_exec( $chOne3 );
            // if(curl_error($chOne3)) { echo 'error:' . curl_error($chOne3); }
            // else { $result_ = json_decode($result, true);
            // echo "status : ".$result_['status']; echo "message : ". $result_['message']; }
            // curl_close( $chOne3 );




        } else echo "Wellcome";
    }

