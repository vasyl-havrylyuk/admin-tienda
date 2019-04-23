<?php
session_start();
defined('BASEPATH') OR exit('No direct script access allowed');

class FrontalController extends CI_Controller {
    public function __construct() {
        parent::__construct();

        $_POST = json_decode(file_get_contents('php://input'), true);
    }

    public function getArticulos() {
        echo json_encode($this->FrontalModel->getArticulos());
    }

    public function getCategorias() {
        echo json_encode($this->FrontalModel->getCategorias());
    }

    public function getMarcas() {
        echo json_encode($this->FrontalModel->getMarcas());
    }

    public function getDetalleArticulo() {
        echo json_encode($this->FrontalModel->getDetalleArticulo());
    }
    
    public function autenticacion() {
        echo json_encode($this->FrontalModel->autenticacion($_POST));
    }

    public function comprobarLogin() {
        echo json_encode($this->FrontalModel->comprobarLogin());
    }

    public function registro() {
        echo json_encode($this->FrontalModel->registrarUsuario($_POST['formulario']));
    }

    public function getDetallesUsuario() {
        echo json_encode($this->FrontalModel->getDetallesUsuario());
    }

    public function cerrarsesion() {
        session_unset();
        if (isset($_COOKIE[session_name()])) setcookie(session_name(), "", time(), "/");
        session_destroy();
    }

    public function compra() {
        echo json_encode($this->FrontalModel->compra($_POST));
    }

    public function actualizarCuenta() {
        echo json_encode($this->FrontalModel->actualizarCuenta($_POST));
    }


    public function getHistorialPedidos() {
        echo json_encode($this->FrontalModel->getHistorialPedidos());
    }

}