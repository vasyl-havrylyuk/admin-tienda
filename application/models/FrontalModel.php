<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FrontalModel extends CI_Model {
    private $con = null;

    public function __construct() {
        parent::__construct();

        try {
            $this->con = $this->load->database('default', true);
        } catch(PDOException $e) {
            die($e->getMessage());
        }

    }



    public function getArticulos() {
        $sql = "SELECT 
                A.k as k, 
                A.sNombre as nombre, 
                A.sDescripcion as descripcion, 
                A.dPrecio as precio, 
                T.sNombre as tipo, 
                M.sNombre as marca,  
                A.sImagen as imagen, 
                A.iStock as stock
                FROM eArticulo as A, eTipo as T, eMarca as M
                WHERE A.xTipo_k = T.k 
                AND A.xMarca_k = M.k";
        
        $query = $this->con->query($sql);
        $rs = $query->result_array();
        return $rs;
    }


    public function getCategorias() {
        $sql = "SELECT T.sNombre as tipo 
                FROM eTipo as T";
        
        $query = $this->con->query($sql);
        $rs = $query->result_array();
        return $rs;
    }


    public function getMarcas() {
        $sql = "SELECT M.sNombre as marca 
                FROM eMarca as M";
            
        $query = $this->con->query($sql);
        $rs = $query->result_array();
        return $rs;
    }


    public function getDetalleArticulo() {
        $detalleArticulo = sanear($this->uri->segment(2));

        $sql = "SELECT 
                A.k as k, 
                A.sNombre as nombre, 
                A.sDescripcion as descripcion, 
                A.dPrecio as precio, 
                T.sNombre as tipo, 
                M.sNombre as marca,  
                A.sImagen as imagen, 
                A.iStock as stock
                FROM eArticulo as A, eTipo as T, eMarca as M
                WHERE A.xTipo_k = T.k 
                AND A.xMarca_k = M.k
                AND A.k = '$detalleArticulo'";

        $query = $this->con->query($sql);
        $rs = $query->result_array();
        return $rs;
    }



    public function autenticacion($data) {
        $usuario = sanear($data['usuario']);
        $password = hash('sha512', sanear($data['password']));

        $sql = "SELECT U.k as k, U.sNombre as nombre, U.sDireccion as direccion, U.bAdministrador as bAdmin, U.bStatus as bStatus
                FROM eUsuario as U WHERE sUser = '$usuario' AND sPassword = '$password'";
        
        $query = $this->con->query($sql);
        $rs = $query->row('k');
        $usuario = $query->result_array();
        $existe = $query->num_rows();

        $resultado = array();

        if ($existe) {
            $resultado['autenticado'] = true;

            // En caso de que exista en la database creamos una sesion con la id de ese usuario
            $_SESSION['id'] = $usuario[0]['k'];

            // Comprobamos si es administrador
            if ($usuario[0]['bAdmin'] == 1) { 
                $resultado['adminAutenticado'] = true;
                $_SESSION['adminAutenticado'] = true;
            }
            
            // Comprobamos si el usuario tiene activada su cuenta
            if ($usuario[0]['bStatus'] == 1) {
                $resultado['usuarioActivado'] = true;
                $_SESSION['autenticado'] = true;
            }

        }

        return $resultado;

    }



    public function comprobarLogin() {
        if (isset($_SESSION['autenticado'])) {
            if (isset($_SESSION['adminAutenticado'])) {
                return(["autenticado" => true, "adminAutenticado" =>  true]);    
            } else {
                return(["autenticado" => true]);
            }
        } else {
            return(["autenticado" => false]);
        }
    }




    public function registrarUsuario($data) {
        $usuario = sanear($data['usuario']);
        $nombre = sanear($data['nombre']);
        $apellido = sanear($data['apellido']);
        $direccion = sanear($data['direccion']);
        $dni = sanear($data['dni']);
        $email = sanear($data['email']);
        $password = hash('sha512', sanear($data['password']));
        $resultado = null;

        $data = array(
            'sUser'     => $usuario,
            'sNombre'   => $nombre,
            'sApellido' => $apellido,
            'sDireccion' => $direccion,
            'sDni'      => $dni,
            'sEmail'    => $email,
            'sPassword' => $password,
            'dFechaRegistro' => date('Y-m-d')
        );

        $this->con->set($data);
        $this->con->insert('eUsuario') or die(
            $resultado = ["registrado" => false]
        );

        $resultado = ["registrado" => true];




        // Extraemos el id y la clave hasheada para formar el link de activacion de cuenta
        $sql = "SELECT * FROM eUsuario ORDER BY k DESC LIMIT 1";
        $query = $this->con->query($sql);
        $id = $query->row('k');
        $hashed_pass = $query->row('sPassword');

        // Formamos el link
        $link = base_url().'activate/'.$id.'/'.md5($id.$hashed_pass);

        // Le enviamos un email de activación de cuenta al usuario registrado
        $this->email->initialize(array('mailtype' => 'html'));
        $this->email->from('webcalistenia@gmail.com', 'WebCalistenia');
        $this->email->to($email);
        $this->email->subject('Activación de cuenta');
        $this->email->message('<a href="'.$link.'">'.$link.'</a>');
        if ($this->email->send()) {
            $resultado = ["registrado" => true];
        } else {
            $resultado = ["registrado" => false];
        }

        
        return $resultado;
    }


    public function getDetallesUsuario() {
        $id = $_SESSION['id'];
        $sql = "SELECT * FROM eUsuario WHERE k = ?";
        $query = $this->con->query($sql, array($id));

        return $query->row(0);
    }


    public function compra($data) {
        // Datos que usaremos durante el procesamiento del pedido
        $id_user = $_SESSION['id'];
        $carrito = $data['carrito'];
        $fecha = date('Y-m-d');
        $ultimoPedido = null;
        $direccion = null;

        // Consultamos primero la dirección del usuario
        $sql = "SELECT sDireccion FROM eUsuario WHERE k = '$id_user'";
        $query = $this->con->query($sql);
        $direccion = $query->row('sDireccion');

        // Primero insertamos un registro en ePedido
        $data = array(
            'xUsuario_k'    => $id_user,
            'dFecha'        => $fecha,
            'sDireccion'    => $direccion
        );
        $this->con->set($data);
        $this->con->insert('ePedido');

        
        // extraemos el id del ultimo pedido realizado para procesar los articulos seleccioandos por 
        // el usuario
        $sql = "SELECT k FROM ePedido ORDER BY k DESC LIMIT 1";
        $query = $this->con->query($sql);
        $ultimoPedido = $query->row('k');


        // Ahora creamos tanto registros en rPedidoArticulo como 
        // los articulos que haya seleccionado el usuario apuntando al ultimo registro creado en ePedido
        for ($i=0; $i < count($carrito); $i++) { 

            // Introducimos el articulo en rPedidoArticulo, indicando el id del ultimoPedido
            $articulo = sanear($carrito[$i]['k']);
            $cantidad = sanear($carrito[$i]['cantidad']);
            $data = array(
                'xPedido_k'     => $ultimoPedido,
                'xArticulo_k'   => $articulo,
                'iCantidad'     => $cantidad
            );
            $this->con->set($data);
            $this->con->insert('rPedidoArticulo');
            
            // actualizamos el stock actual del articulo correspondiente y lo actualizamos
            $sql = "SELECT iStock FROM eArticulo WHERE k = $articulo";
            $query = $this->con->query($sql);
            $stockActual = $query->row('iStock');
            
            $data = array('iStock' => $stockActual - $cantidad);
            $this->con->update('eArticulo', $data, array('k' => $articulo));
        }
        
        return(array("correcto" => true, "user" => $id_user, "direccion" => $direccion, "fecha" => $fecha));
    }

}