<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;


// GRAFICOS POR DEFECTO
$route['default_controller'] = 'AdminController/home';



// EL LOGIN
$route['login'] = 'AdminController/login';
$route['login/auth'] = 'AdminController/auth';
$route['login/logout'] = 'AdminController/logout';
$route['login/error'] = 'AdminController/login';



// ARTICULOS
$route['articulos'] = 'AdminController/articulos';
$route['articulos/nuevo'] = 'AdminController/nuevoArticulo';
$route['articulos/insertar'] = 'AdminController/insertarArticulo';
$route['articulos/editar/(:num)'] = 'AdminController/editarArticulo';
$route['articulos/actualizar/(:num)'] = 'AdminController/actualizarArticulo';
$route['articulos/eliminar/(:num)'] = 'AdminController/eliminarArticulo';



// CATEGORIAS
$route['categorias'] = 'AdminController/categorias';
$route['categorias/nuevo'] = 'AdminController/nuevoCategoria';
$route['categorias/editar/(:num)'] = 'AdminController/editarCategoria';
$route['categorias/actualizar/(:num)'] = 'AdminController/actualizarCategoria';
$route['categorias/eliminar/(:num)'] = 'AdminController/eliminarCategoria';



// MARCAS
$route['marcas'] = 'AdminController/marcas';
$route['marcas/nuevo'] = 'AdminController/nuevoMarca';
$route['marcas/editar/(:num)'] = 'AdminController/editarMarca';
$route['marcas/actualizar/(:num)'] = 'AdminController/actualizarMarca';
$route['marcas/eliminar/(:num)'] = 'AdminController/eliminarMarca';



// USUARIOS
$route['usuarios'] = 'AdminController/usuarios';
$route['usuarios/nuevo'] = 'AdminController/nuevoUsuario';
$route['usuarios/editar/(:num)'] = 'AdminController/editarUsuario';
$route['usuarios/actualizar/(:num)'] = 'AdminController/actualizarUsuario';
$route['usuarios/eliminar/(:num)'] = 'AdminController/eliminarUsuario';





// RUTAS A LAS QUE VA A LLAMAR ANGULAR
$route['json_getArticulos'] = 'FrontalController/getArticulos';
$route['json_getCategorias'] = 'FrontalController/getCategorias';
$route['json_getMarcas'] = 'FrontalController/getMarcas';
$route['json_getDetalleArticulo/(:num)'] = 'FrontalController/getDetalleArticulo';

$route['autenticacion'] = 'FrontalController/autenticacion';
$route['comprobarLogin'] = 'FrontalController/comprobarLogin';
$route['cerrarsesion'] = 'FrontalController/cerrarsesion';
$route['registro'] = 'FrontalController/registro';
$route['compra'] = 'FrontalController/compra';
