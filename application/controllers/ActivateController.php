<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ActivateController extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
    }

    function index() {
        $idURL = $this->uri->segment('2');
        $codigoURL = $this->uri->segment('3');

        $this->BackModel->activarCuenta($idURL, $codigoURL);

        header('Location: '.WEBSITE.'/login/cuenta');
    }

}