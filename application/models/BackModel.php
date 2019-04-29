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







    public function getGanancias($anio) {
        $query = $this->con->query(
            "SELECT epedido.dFecha as fecha, earticulo.dPrecio as pvp, rpedidoarticulo.iCantidad as cantidad
            FROM 
            earticulo, epedido, rpedidoarticulo
            WHERE
            rpedidoarticulo.xPedido_k = epedido.k AND
            rpedidoarticulo.xArticulo_k = earticulo.k AND
            epedido.dfecha LIKE '$anio-%-%'"
        );

        return $query->result_array();
    }


    public function getTopCompradores() {

        $query = $this->con->query(
            "SELECT eusuario.*, COUNT(eusuario.sUser) as compras

            FROM
            epedido, eusuario

            WHERE
            epedido.xUsuario_k = eusuario.k

            GROUP BY eusuario.sUser
            ORDER BY COUNT(eusuario.sUser) DESC
            LIMIT 3"
        );

        return $query->result_array();
    }

    public function getStocks() {
        $query = $this->con->query(
            "SELECT
            earticulo.sNombre as nombre, earticulo.iStock as stock
            
            FROM 
            earticulo
            
            ORDER BY earticulo.iStock ASC" 
        );

        return $query->result_array();
    }






    public function getArticulos () {
        $sql = "SELECT * FROM eArticulo";
        $query = $this->con->query($sql);
        $rs = $query->result_array();

        return $rs;
    }

    public function getDetallesArticulo($id) {
        $id = sanear($id);
        $sql = "SELECT A.k as k, A.iStock as iStock, A.sNombre as sNombre, T.sNombre as categoria, M.sNombre as marca, A.sDescripcion as sDescripcion, A.dPrecio as dPrecio, A.sImagen as sImagen FROM eArticulo AS A, eTipo as T, eMarca as M WHERE A.k = ? AND A.xTipo_k = T.k AND A.xMarca_k = M.k";
        $query = $this->con->query($sql, array($id));
        $rs = $query->result_array();
        
        return $rs;
    }

    public function insertarArticulo($dataPOST, $dataFILES) {
        $imagen = $dataFILES['imagen'];        
        $nombreImagen = time().'-'.$imagen['name'];
        move_uploaded_file($imagen['tmp_name'], "../assets/img/".$nombreImagen);

        $data = array(
            'sNombre'       => sanear($dataPOST['nombre']),
            'sDescripcion'  => sanear($dataPOST['descripcion']),
            'iStock'        => sanear($dataPOST['stock']),
            'xTipo_k'       => sanear($dataPOST['categoria']),
            'xMarca_k'      => sanear($dataPOST['marca']),
            'dPrecio'       => sanear($dataPOST['precio']),
            'sImagen'       => $nombreImagen
        );

        $this->con->set($data);
        $this->con->insert('eArticulo');
    }

    public function actualizarArticulo($datos) {
        // actualizamos los datos principales
        $data = array(
            'sNombre'       => sanear($datos['nombre']), 
            'sDescripcion'  => sanear($datos['descripcion']), 
            'iStock'        => sanear($datos['stock']), 
            'xTipo_k'       => sanear($datos['categoria']), 
            'xMarca_k'      => sanear($datos['marca']),
            'dPrecio'       => sanear($datos['precio'])
        );
        $this->con->update('eArticulo', $data, array('k' => sanear($datos['id'])));
        

        // actualizamos la imagen
        if (isset($datos['imagen']) && !empty($datos['imagen']['name'])) {
            
            // Borramos la imagen anterior
            $sql = "SELECT sImagen FROM eArticulo WHERE k = ?";
            $query = $this->con->query($sql, array($datos['id']));
            $fichero = $query->row('sImagen');
            unlink("../assets/img/".$fichero) or die('No se ha podido eliminar la imagen anterior');

            // Subimos la nueva imagen
            $imagen = $datos['imagen'];        
            $nombreImagen = time().'-'.sanear($imagen['name']);
            move_uploaded_file($imagen['tmp_name'], "../assets/img/".$nombreImagen);

            // ACtualizamos el registro
            $data = array(
                'sImagen' => $nombreImagen
            );
            $this->con->update('eArticulo', $data, array('k' => sanear($datos['id'])));
        }
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

    public function insertarCategoria($dataPOST) {
        $data = array(
            'sNombre'       => sanear($dataPOST['nombre'])
        );
        $this->con->set($data);
        $this->con->insert('eTipo');
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
    
    public function insertarMarca($dataPOST) {
        $data = array(
            'sNombre'       => sanear($dataPOST['nombre'])
        );
        $this->con->set($data);
        $this->con->insert('eMarca');
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

    public function insertarUsuario($dataPOST) {
        $data = array(
            'sUser'             => sanear($dataPOST['usuario']),
            'sNombre'           => sanear($dataPOST['nombre']),
            'sApellido'         => sanear($dataPOST['apellido']),
            'sDireccion'        => sanear($dataPOST['direccion']),
            'sDni'              => sanear($dataPOST['dni']),
            'sEmail'            => sanear($dataPOST['email']),
            'dFechaRegistro'    => date('Y-m-d'),
            'sPassword'         => hash('sha512', sanear($dataPOST['password'])),
            'bAdministrador'    => sanear($dataPOST['rol'])
        );
        $this->con->set($data);
        $this->con->insert('eUsuario');
    }

    public function actualizarUsuario($datos) {
        $data = array(
            'sUser'             => sanear($datos['usuario']),
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







    public function activarCuenta($idURL, $codigoURL) {
        $idURL = sanear($idURL);
        $codigoURL = sanear($codigoURL);

        $sql = "SELECT * FROM eUsuario WHERE k = ?";
        $query = $this->con->query($sql, array($idURL));
        
        $idUser = $query->row('k');
        $hashed_pass = $query->row('sPassword');

        if ($codigoURL == md5($idUser.$hashed_pass)) {
            $data = array('bStatus' => 1);
            $this->con->update('eUsuario', $data, array('k' => $idUser));
        } else {
            return false;
        }

        return true;
    }
    
}