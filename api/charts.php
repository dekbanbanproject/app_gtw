<?php
    header("Access-Control-Allow-Origin: *");
    error_reporting(0);
    error_reporting(E_ERROR | E_PARSE);
    header("content-type:text/javascript;charset=utf-8");

    define("server ","localhost");
    define("username","root");
    define("password", "");
    define("database", "dis_medical");
   
    $connect = mysqli_connect($server, $username, $password,$database); 

    if ($connect) {
        $sql ='SELECT * FROM sales';

    $query = mysqli_query($connect,$sql);
    $results=array();

    while ($row =mysqli_fetch_assoc($query)) {
        $results[]=$row;
    }
    echo json_encode($results);
    }

    ?>
  