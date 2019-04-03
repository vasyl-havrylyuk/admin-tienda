<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Layouts {
    private $CI = null;

    function __construct() {
        $this->CI =& get_instance();
    }

    public function view($data = array()) {
        if (!empty($data)) {
            $vista = $this->CI->load->view($data['vista'], $data['params'], TRUE);

            $this->CI->load->view('layouts/'.$data['layout'], array(
                'contenido' => $vista,
                'titulo' => $data['titulo'],
                'style' => $data['style'],
                'js' => $data['js'],
            ));
        }
    }
}
