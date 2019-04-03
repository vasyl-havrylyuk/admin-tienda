<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class APIController extends CI_Controller {
    public function __construct() {
        parent::__construct();

        $this->load->model('BackModel');
    }

    public function get_JSON_Articulos() {
        echo json_encode($this->BackModel->getArticulos());
    }
}