<?php
session_start();
defined('BASEPATH') OR exit('No direct script access allowed');


class AdminController extends CI_Controller {
    public function __construct() {
        parent::__construct();
    }

    public function loguearDato($level, $descripcion) {
        $nombreAdmin = $this->BackModel->getNombreAdmin($_SESSION['id']);
        $this->LogModel->loguearDato([$level, $nombreAdmin.' '.$descripcion]);
    }



    public function getPedidos() {
        echo json_encode($this->BackModel->getPedidos());
    }

    public function resolverPedido() {
        $this->BackModel->resolverPedido($_POST);
    }









    public function home() {

        $data = ["topCompradores" => $this->BackModel->getTopCompradores()];

        $vista = array(
            'vista'     => 'admin/view_home',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Panel principal',
            'style'     => 'home',
            'js'        => 'home'
        );

        $this->layouts->view($vista);
    }

    public function getGanancias() {
        echo json_encode($this->BackModel->getGanancias($_GET["anio"]));
    }

    public function getTopCompradores() {
        echo json_encode($this->BackModel->getTopCompradores());
    }

    public function getStocks() {
        echo json_encode($this->BackModel->getStocks());
    }
    
    public function setStock() {
        $this->BackModel->setStock($_POST);
    }

    






    public function login() {
        $data = array();

        if ($this->uri->segment(2) ==! null && $this->uri->segment(2) == 'error')  {
            $data = array(
                'mensaje'   => 'Contraseña y/o password incorrecto/s',
                'alert'     => 'alert-danger'
            );
        }


        $vista = array(
            'vista'     => 'admin/view_login',
            'params'    =>  $data,
            'layout'    => 'ly_login',
            'titulo'    => 'Login',
            'style'     => 'login',
            'js'        => ''
        );

        $this->layouts->view($vista);
    }

    public function auth() {
		$usuario = $_POST['usuario'];
        $password = hash('sha512', $_POST['password']);

        $auth = $this->BackModel->auth($usuario, $password);

		if ($auth['autenticado']) {
            $_SESSION['adminAutenticado'] = true;
            $_SESSION['id'] = $auth['id'];
            $this->loguearDato('info', 'se ha logueado');

			header('Location: '.base_url());
		} else {
			header('Location: '.base_url().'login/error');
        }
    }

    public function logout() {
        $this->loguearDato('info', 'ha cerrado la sesión');

        session_unset();
        
        if (isset($_COOKIE[session_name()])) setcookie(session_name(), "", time(), "/");

        session_destroy();

        header('Location: '.base_url().'login');
        
    }





    
    

    // MOSTRAMOS TODOS LOS ARTICULOS
    public function articulos() {
        $data = array(
            'articulos' => $this->BackModel->getArticulos()
        );

        $vista = array(
            'vista'     => 'admin/view_articulos',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Artículos',
            'style'     => '',
            'js'        => 'articulos'
        );

        $this->layouts->view($vista);
    }

    // CREAMOS NUUEVO ARTICULO
    public function nuevoArticulo() {
        $data = array(
            'categorias' => $this->BackModel->getCategorias(),
            'marcas' => $this->BackModel->getMarcas()
        );

        $vista = array(
            'vista'     => 'admin/view_nuevoArticulo',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Nuevo artículo',
            'style'     => 'articulos',
            'js'        => 'articulos'
        );

        $this->layouts->view($vista);
    }

    public function insertarArticulo() {
        $this->BackModel->insertarArticulo($_POST, $_FILES);
        $this->loguearDato('info', 'insertó un nuevo artículo');
        header('Location: '.base_url().'articulos');
    }

    // EDITAMOS EL ARTICULO
    public function editarArticulo() {
        $id = $this->uri->segment(3);

        $data = array(
            'detalles' => $this->BackModel->getDetallesArticulo($id)[0],
            'categorias' => $this->BackModel->getCategorias(),
            'marcas' => $this->BackModel->getMarcas()
        );

        $vista = array(
            'vista'     => 'admin/view_editarArticulo',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Edición de artículo',
            'style'     => 'articulos',
            'js'        => 'articulos'
        );

        $this->layouts->view($vista);
    }

    // ACTUALIZAMOS EL ARTICULO
    public function actualizarArticulo() {
        if (!empty($_FILES['imagen']['name'])) {
            $_POST['imagen'] = $_FILES['imagen'];
        }

        $this->BackModel->actualizarArticulo($_POST);
        $this->loguearDato('info', 'actualizó un artículo');
        header('Location: '.base_url().'articulos');
    }
    
    // ELIMINAMOS EL ARTICULO
    public function eliminarArticulo() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarArticulo($id);
        $this->loguearDato('info', 'eliminó un artículo');
        header('Location: '.base_url().'articulos');
    }









    // MOSTRAMOS TODAS LAS CATEGORIAS
    public function categorias() {
        $data = array(
            'categorias' => $this->BackModel->getCategorias()
        );

        $vista = array(
            'vista'     => 'admin/view_categorias',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Categorias',
            'style'     => '',
            'js'        => 'categorias'
        );

        $this->layouts->view($vista);
    }

    // CREAMOS NUUEVA CATEGORIA
    public function nuevoCategoria() {
        $vista = array(
            'vista'     => 'admin/view_nuevoCategoria',
            'params'    =>  array(),
            'layout'    => 'ly_admin',
            'titulo'    => 'Nueva categoria',
            'style'     => '',
            'js'        => 'categorias'
        );

        $this->layouts->view($vista);
    }

    // INSERTAMOS CATEGORIA
    public function insertarCategoria() {
        $this->BackModel->insertarCategoria($_POST);
        $this->loguearDato('info', 'insertó una nueva categoria');
        header('Location: '.base_url().'categorias');
    }

    // EDITAMOS CATEGORIA
    public function editarCategoria() {
        $id = $this->uri->segment(3);

        $data = array(
            'detalles' => $this->BackModel->getDetallesCategoria($id)[0]
        );

        $vista = array(
            'vista'     => 'admin/view_editarCategoria',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Edición de categoria',
            'style'     => '',
            'js'        => 'categorias'
        );

        $this->layouts->view($vista);
    }

    // ACTUALIZAMOS CATEGORIA
    public function actualizarCategoria() {
        $this->BackModel->actualizarCategoria($_POST);
        $this->loguearDato('info', 'actualizó una categoria');
        header('Location: '.base_url().'categorias');
    }

    // ELIMINAMOS CATEGORIA
    public function eliminarCategoria() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarCategoria($id);
        $this->loguearDato('info', 'eliminó una categoria');
        header('Location: '.base_url().'categorias');
    }







    // MOSTRAMOS TODAS LAS MARCAS
    public function marcas() {
        $data = array(
            'marcas' => $this->BackModel->getMarcas()
        );

        $vista = array(
            'vista'     => 'admin/view_marcas',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Marcas',
            'style'     => '',
            'js'        => 'marcas'
        );

        $this->layouts->view($vista);
    }

    // CREAMOS NUUEVA MARCA
    public function nuevoMarca() {
        $vista = array(
            'vista'     => 'admin/view_nuevoMarca',
            'params'    =>  array(),
            'layout'    => 'ly_admin',
            'titulo'    => 'Nueva marca',
            'style'     => '',
            'js'        => 'marcas'
        );

        $this->layouts->view($vista);
    }

    // INSERTAMOS MARCA
    public function insertarMarca() {
        $this->BackModel->insertarMarca($_POST);
        $this->loguearDato('info', 'insertó una nueva marca');
        header('Location: '.base_url().'marcas');
    }

    // EDITAMOS MARCA
    public function editarMarca() {
        $id = $this->uri->segment(3);

        $data = array(
            'detalles' => $this->BackModel->getDetallesMarca($id)[0]
        );

        $vista = array(
            'vista'     => 'admin/view_editarMarca',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Edición de marca',
            'style'     => '',
            'js'        => 'marcas'
        );

        $this->layouts->view($vista);
    }

    // ACTUALIZAMOS MARCA
    public function actualizarMarca() {
        $this->BackModel->actualizarMarca($_POST);
        $this->loguearDato('info', 'actualizó una marca');
        header('Location: '.base_url().'marcas');
    }

    // ELIMINAMOS MARCA
    public function eliminarMarca() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarMarca($id);
        $this->loguearDato('info', 'eliminó una marca');
        header('Location: '.base_url().'marcas');
    }






    // MOSTRAMOS TODOS LOS USUARIOS
    public function usuarios() {
        $data = array(
            'usuarios'  => $this->BackModel->getUsuarios()
        );

        $vista = array(
            'vista'     => 'admin/view_usuarios',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Usuarios',
            'style'     => '',
            'js'        => 'usuarios'
        );

        $this->layouts->view($vista);
    }

    // CREAMOS NUUEVO USUARIO
    public function nuevoUsuario() {
        $vista = array(
            'vista'     => 'admin/view_nuevoUsuario',
            'params'    =>  array(),
            'layout'    => 'ly_admin',
            'titulo'    => 'Nuevo usuario',
            'style'     => '',
            'js'        => 'usuarios'
        );

        $this->layouts->view($vista);
    }

    // INSERTAMOS USUARIO
    public function insertarUsuario() {
        $this->BackModel->insertarUsuario($_POST);
        $this->loguearDato('info', 'insertó un nuevo usuario');
        header('Location: '.base_url().'usuarios');
    }

    // EDITAMOS USUARIO
    public function editarUsuario() {
        $id = $this->uri->segment(3);

        $data = array(
            'detalles' => $this->BackModel->getDetallesUsuario($id)[0]
        );

        $vista = array(
            'vista'     => 'admin/view_editarUsuario',
            'params'    =>  $data,
            'layout'    => 'ly_admin',
            'titulo'    => 'Edición de usuario',
            'style'     => '',
            'js'        => 'usuarios'
        );

        $this->layouts->view($vista);
    }

    // ACTUALIZAMOS USUARIO
    public function actualizarUsuario() {
        $this->BackModel->actualizarUsuario($_POST);
        $this->loguearDato('info', 'actualizó un usuario');
        header('Location: '.base_url().'usuarios');
    }
    
    // ELIMINAMOS UN USUARIO
    public function eliminarUsuario() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarUsuario($id);
        $this->loguearDato('info', 'eliminó un usuario');
        header('Location: '.base_url().'usuarios');
    }

}