<?php

class categoria_controlador extends controller {

    private $_categoria;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_categoria = $this->cargar_modelo('categoria');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Categoria';
        $this->_vista->datos = $this->_categoria->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_categoria->descripcion=$_POST['descripcion'];
        }
        echo json_encode($this->_categoria->selecciona());
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_categoria->descripcion = $_POST['descripcion'];
            $this->_categoria->inserta();
            $this->redireccionar('categoria');
        }
        $this->_vista->titulo = 'Registrar Categoria';
        $this->_vista->action = BASE_URL . 'categoria/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('categoria');
        }

        $this->_categoria->id_categoria = $this->filtrarInt($id);
        $this->_vista->datos = $this->_categoria->selecciona();

        if ($_POST['guardar'] == 1) {
            $this->_categoria->id_categoria = $_POST['codigo'];
            $this->_categoria->descripcion = $_POST['descripcion'];
            $this->_categoria->actualiza();
            echo "<script>alert('Datos Guardados');</script>";
            $this->redireccionar('categoria');
        }
        $this->_vista->titulo = 'Actualizar Categoria';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('categoria');
        }
        $this->_categoria->id_categoria = $this->filtrarInt($id);
        $this->_categoria->elimina();
        $this->redireccionar('categoria');
    }

}

?>
