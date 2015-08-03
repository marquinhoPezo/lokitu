<?php

class subcategoria_controlador extends controller {
    
    private $_subcategoria;
    private $_categoria;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_subcategoria = $this->cargar_modelo('subcategoria');
        $this->_categoria = $this->cargar_modelo('categoria');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Subcategorias';
        $this->_vista->datos = $this->_subcategoria->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_subcategoria->descripcion=$_POST['descripcion'];
        }
        if($_POST['filtro']==1){
            $this->_subcategoria->categoria=$_POST['descripcion'];
        }
        echo json_encode($this->_subcategoria->selecciona());
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
            $this->_subcategoria->descripcion = $_POST['descripcion'];
            $this->_subcategoria->id_categoria = $_POST['id_categoria'];
            $this->_subcategoria->inserta();
            $this->redireccionar('subcategoria');
        }
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_vista->titulo = 'Registrar Subcategoria';
        $this->_vista->action = BASE_URL . 'subcategoria/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('subcategoria');
        }

        if ($_POST['guardar'] == 1) {
            $this->_subcategoria->id_subcategoria = $_POST['codigo'];
            $this->_subcategoria->descripcion = $_POST['descripcion'];
            $this->_subcategoria->id_categoria = $_POST['id_categoria'];
            $this->_subcategoria->actualiza();
            $this->redireccionar('subcategoria');
        }
        $this->_subcategoria->id_subcategoria = $this->filtrarInt($id);
        $this->_vista->datos = $this->_subcategoria->selecciona();
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_vista->titulo = 'Actualizar Subcategoria';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('subcategoria');
        }
        $this->_subcategoria->id_subcategoria = $this->filtrarInt($id);
        $this->_subcategoria->elimina();
        $this->redireccionar('subcategoria');
    }
    
    public function getSubcategoriaAjax(){
        $this->_subcategoria->id_categoria = $_POST['id_categoria'];
        echo json_encode($this->_subcategoria->selecciona());
    }
    
}

?>
