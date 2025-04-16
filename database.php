<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$host="localhost";
$login="phpuser";
$password="phpuser";
$database="eventboarddb";

// connect to the mysql sever
$conn=@new mysqli($host,$login,$password,$database);
if ($conn->connect_errno){
    $errno=$conn->connect_errno;
    $errmsg=$conn->connect_error;
    die("Connection to database faild:($errno)$errmsg.");
}
