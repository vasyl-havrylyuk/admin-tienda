<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LogModel extends CI_Model {
    private $con = null;

    public function __construct() {
        parent::__construct();

        try {
            $this->con = $this->load->database('default', true);
        } catch(PDOException $e) {
            die($e->getMessage());
        }

    }

    public function loguearDato($data) {
        $datoLogueado = true;

        $tipo = sanear($data[0]);
        $descripcion = sanear($data[1]);


        $data = array(
            'sTipo'         => $tipo,
            'sDescripcion'  => $descripcion,
            'sTimestamp'    => date("Y-m-d H:i:s")
        );

        $this->con->set($data);
        $this->con->insert('eLog'); 
    }
    
}