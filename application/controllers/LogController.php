<?php
session_start();
defined('BASEPATH') OR exit('No direct script access allowed');

class LogController extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $_POST = json_decode(file_get_contents('php://input'), true);
    }

    function loguearDato() {
        $this->LogModel->loguearDato($_POST['data']);
    }

}