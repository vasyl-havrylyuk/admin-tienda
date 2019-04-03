<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function sanear($dato) {
    return htmlspecialchars($dato, ENT_QUOTES, "UTF-8");
}

function debug($dato) {
    $debug = debug_backtrace();
    echo "<pre>";
    echo $debug[0]['file']." ".$debug[0]['line']."<br><br>";
    print_r($dato);
    echo "</pre>";
    echo "</br>";
}