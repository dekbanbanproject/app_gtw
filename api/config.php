<?php
    header("Access-Control-Allow-Origin: *");
    error_reporting(0);
    error_reporting(E_ERROR | E_PARSE);
    header("content-type:text/javascript;charset=utf-8");
    $server = "27.254.191.157";
    $username = "gotowin";
    $password = "gotx!!;Mas!zxwera!!-2554!";
    // $database = "gtw";
    $database = "gtwinfomation_demo";
  
    // $conn = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91','gtw'); 
    $conn = mysqli_connect($server, $username, $password,$database); 
  

