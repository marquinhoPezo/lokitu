<?php

class marca_controlador extends controller {

    private $_marca;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_marca = $this->cargar_modelo('marca');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Marcas';
        $this->_vista->datos = $this->_marca->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_marca->descripcion=$_POST['descripcion'];
        }
        echo json_encode($this->_marca->selecciona());
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_marca->descripcion = $_POST['descripcion'];
            $this->_marca->inserta();
            $this->redireccionar('marca');
        }
        $this->_vista->titulo = 'Registrar Marca';
        $this->_vista->action = BASE_URL . 'marca/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('marca');
        }

        $this->_marca->idmarca = $this->filtrarInt($id);
        $this->_vista->datos = $this->_marca->selecciona();

        if ($_POST['guardar'] == 1) {
            $this->_marca->idmarca = $_POST['codigo'];
            $this->_marca->descripcion = $_POST['descripcion'];
            $this->_marca->actualiza();
            $this->redireccionar('marca');
        }
        $this->_vista->titulo = 'Actualizar Marca';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('marca');
        }
        $this->_marca->idmarca = $this->filtrarInt($id);
        $this->_marca->elimina();
        $this->redireccionar('marca');
    }

}

?>
