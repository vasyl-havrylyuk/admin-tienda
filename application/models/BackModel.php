<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BackModel extends CI_Model {
    private $con = null;

    public function __construct() {
        parent::__construct();

        try {
            $this->con = $this->load->database('default', true);
        } catch(PDOException $e) {
            die($e->getMessage());
        }
    }



    public function auth($usuario, $password) {
        $usuario = sanear($usuario);
        $password = sanear($password);
        $sql = "SELECT * FROM eUsuario WHERE sUser = '$usuario' AND sPassword = '$password' AND bAdministrador = 1";
        $query = $this->con->query($sql);
        $rs = $query->row('k');
        $existe = $query->num_rows();
        

        if ($existe) {
            return array('autenticado' => true, 'id' => $rs);
		} else {
			return array('autenticado' => false);
        }
    }





    public function getNombreAdmin($id) {
        $sql = "SELECT * FROM eUsuario WHERE k = '$id'";
        $query = $this->con->query($sql);
        $rs = $query->row('sNombre');
        return $rs;
    }






    public function getArticulos () {
        $sql = "SELECT * FROM eArticulo";
        $query = $this->con->query($sql);
        $rs = $query->result_array();

        return $rs;
    }

    public function getDetallesArticulo($id) {
        $id = sanear($id);
        $sql = "SELECT A.k as k, A.iStock as iStock, A.sNombre as sNombre, T.sNombre as categoria, M.sNombre as marca, A.sDescripcion as sDescripcion, A.dPrecio as dPrecio FROM eArticulo AS A, eTipo as T, eMarca as M WHERE A.k = ? AND A.xTipo_k = T.k AND A.xMarca_k = M.k";
        $query = $this->con->query($sql, array($id));
        $rs = $query->result_array();
        
        return $rs;
    }

    public function actualizarArticulo($datos) {
        $data = array(
            'sNombre'       => sanear($datos['nombre']), 
            'sDescripcion'  => sanear($datos['descripcion']), 
            'iStock'        => sanear($datos['stock']), 
            'xTipo_k'       => sanear($datos['categoria']), 
            'xMarca_k'      => sanear($datos['marca']),
            'dPrecio'       => sanear($datos['precio'])
        );
        $this->con->update('eArticulo', $data, array('k' => sanear($datos['id'])));
    }


    public function eliminarArticulo($id) {
        $this->con->delete('eArticulo', array('k' => sanear($id)));
    }








    
    public function getCategorias() {
        $sql = "SELECT * FROM eTipo";
        $query = $this->con->query($sql);
        $rs = $query->result_array();

        return $rs;
    }

    public function getDetallesCategoria($id) {
        $id = sanear($id);
        $sql = "SELECT * FROM eTipo WHERE k = ?";
        $query = $this->con->query($sql, array($id));
        $rs = $query->result_array();
        
        return $rs;
    }

    public function actualizarCategoria($datos) {
        $data = array(
            'sNombre' => sanear($datos['nombre'])
        );
        $this->con->update('eTipo', $data, array('k' => sanear($datos['id'])));
    }

    public function eliminarCategoria($id) {
        $this->con->delete('eTipo', array('k' => sanear($id)));
    }







    public function getMarcas() {
        $sql = "SELECT * FROM eMarca";
        $query = $this->con->query($sql);
        $rs = $query->result_array();

        return $rs;
    }

    public function getDetallesMarca($id) {
        $id = sanear($id);
        $sql = "SELECT * FROM eMarca WHERE k = ?";
        $query = $this->con->query($sql, array($id));
        $rs = $query->result_array();
        
        return $rs;
    }
    
    public function actualizarMarca($datos) {
        $data = array(
            'sNombre' => sanear($datos['nombre'])
        );
        $this->con->update('eMarca', $data, array('k' => sanear($datos['id'])));
    }
    
    public function eliminarMarca($id) {
        $this->con->delete('eMarca', array('k' => sanear($id)));
    }





    


    public function getUsuarios() {
        $sql = "SELECT * FROM eUsuario";
        $query = $this->con->query($sql);
        $rs = $query->result_array();

        return $rs;
    }

    public function getDetallesUsuario($id) {
        $id = sanear($id);
        $sql = "SELECT * FROM eUsuario WHERE k = ?";
        $query = $this->con->query($sql, array($id));
        $rs = $query->result_array();
        
        return $rs;
    }

    public function actualizarUsuario($datos) {
        $data = array(
            'sNombre'           => sanear($datos['nombre']),
            'sApellido'         => sanear($datos['apellido']),
            'sDni'              => sanear($datos['dni']),
            'sDireccion'        => sanear($datos['direccion']),
            'sEmail'            => sanear($datos['email']),
            'dFechaRegistro'    => sanear($datos['registro']),
            'bAdministrador'    => sanear($datos['rol'])
        );
        $this->con->update('eUsuario', $data, array('k' => sanear($datos['id'])));
    }
    

    public function eliminarUsuario($id) {
        $this->con->delete('eUsuario', array('k' => sanear($id)));
    }
    
}