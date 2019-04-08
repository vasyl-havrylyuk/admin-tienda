<?php
session_start();
defined('BASEPATH') OR exit('No direct script access allowed');


class AdminController extends CI_Controller {
    public function __construct() {
        parent::__construct();

        $this->load->model('BackModel');
    }




    public function home() {

        $vista = array(
            'vista'     => 'admin/view_home',
            'params'    =>  array(),
            'layout'    => 'ly_admin',
            'titulo'    => 'Home',
            'style'     => '',
            'js'        => ''
        );

        $this->layouts->view($vista);
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
			header('Location: '.base_url());
		} else {
			header('Location: '.base_url().'login/error');
        }
    }

    public function logout() {
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
        
        header('Location: '.base_url().'articulos');
    }
    
    // ELIMINAMOS EL ARTICULO
    public function eliminarArticulo() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarArticulo($id);

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
        
        header('Location: '.base_url().'categorias');
    }

    // ELIMINAMOS CATEGORIA
    public function eliminarCategoria() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarCategoria($id);

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
        
        header('Location: '.base_url().'marcas');
    }

    // ELIMINAMOS MARCA
    public function eliminarMarca() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarMarca($id);

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

        //header('Location: '.base_url().'usuarios');
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
        header('Location: '.base_url().'usuarios');
    }
    
    // ELIMINAMOS UN USUARIO
    public function eliminarUsuario() {
        $id = $this->uri->segment(3);

        $this->BackModel->eliminarUsuario($id);

        header('Location: '.base_url().'usuarios');
    }

}