<?php

class sucursal_controlador extends controller {

    private $_sucursal;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_sucursal = $this->cargar_modelo('sucursal');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Sucursales';
        $this->_vista->datos = $this->_sucursal->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_sucursal->nombre=$_POST['nombre'];
        }
        echo json_encode($this->_sucursal->selecciona());
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
//            echo '<pre>';print_r($_POST);exit;
            $this->_sucursal->id_sucursal = $_POST['id_sucursal'];
            $this->_sucursal->nombre = $_POST['nombre'];
            $this->_sucursal->direccion = $_POST['direccion'];
            $this->_sucursal->telefono = $_POST['telefono'];
            $this->_sucursal->ciudad = $_POST['ciudad'];
            $this->_sucursal->inserta();
            $this->redireccionar('sucursal');
        }
        $this->_vista->titulo = 'Registrar Sucursal';
        $this->_vista->action = BASE_URL . 'sucursal/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        $this->_sucursal->id_sucursal = $id;
        $this->_vista->datos = $this->_sucursal->selecciona();

        if ($_POST['guardar'] == 1) {
            $this->_sucursal->id_sucursal = $_POST['id_sucursal'];
            $this->_sucursal->nombre = $_POST['nombre'];
            $this->_sucursal->direccion = $_POST['direccion'];
            $this->_sucursal->telefono = $_POST['telefono'];
            $this->_sucursal->ciudad = $_POST['ciudad'];
            $this->_sucursal->actualiza();
            $this->redireccionar('sucursal');
        }
        $this->_vista->titulo = 'Actualizar Sucursal';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        $this->_sucursal->id_sucursal = $id;
        $this->_sucursal->elimina();
        $this->redireccionar('sucursal');
    }

}

?>
