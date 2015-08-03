<?php

class motivomovimiento_controlador extends controller {
    
    private $_motivomovimiento;
    private $_tipomovimiento;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_motivomovimiento = $this->cargar_modelo('motivomovimiento');
        $this->_tipomovimiento = $this->cargar_modelo('tipomovimiento');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Motivo Movimiento';
        $this->_vista->datos = $this->_motivomovimiento->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_motivomovimiento->descripcion=$_POST['descripcion'];
        }
        if($_POST['filtro']==1){
            $this->_motivomovimiento->tipomovimiento=$_POST['descripcion'];
        }
        echo json_encode($this->_motivomovimiento->selecciona());
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_motivomovimiento->descripcion = $_POST['descripcion'];
            $this->_motivomovimiento->id_tipomovimiento = $_POST['id_tipomovimiento'];
            $this->_motivomovimiento->inserta();
            $this->redireccionar('motivomovimiento');
        }
        $this->_vista->datos_tipomovimiento = $this->_tipomovimiento->selecciona();
        $this->_vista->titulo = 'Registrar Movimiento Producto';
        $this->_vista->action = BASE_URL . 'motivomovimiento/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('motivomovimiento');
        }

        $this->_motivomovimiento->idmotivomovimiento = $this->filtrarInt($id);
        $this->_vista->datos = $this->_motivomovimiento->selecciona();

        if ($_POST['guardar'] == 1) {
            $this->_motivomovimiento->idmotivomovimiento = $_POST['codigo'];
            $this->_motivomovimiento->descripcion = $_POST['descripcion'];
            $this->_motivomovimiento->id_tipomovimiento = $_POST['id_tipomovimiento'];
            $this->_motivomovimiento->actualiza();
            $this->redireccionar('motivomovimiento');
        }
        $this->_vista->datos_tipomovimiento = $this->_tipomovimiento->selecciona();
        $this->_vista->titulo = 'Actualizar Movimiento Producto';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('motivomovimiento');
        }
        $this->_motivomovimiento->idmotivomovimiento = $this->filtrarInt($id);
        $this->_motivomovimiento->elimina();
        $this->redireccionar('motivomovimiento');
    }
    
}

?>
