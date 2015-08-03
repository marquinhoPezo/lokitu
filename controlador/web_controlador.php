<?php

class web_controlador extends controller {
    
    private $_informacion;
    private $_productos;
    private $_marcas;

    public function __construct() {
        parent::__construct();
        $this->_vista->vermenu = '1';
        $this->_informacion = $this->cargar_modelo('informacion');
        $this->_productos = $this->cargar_modelo('productos');
        $this->_marcas = $this->cargar_modelo('marcas');
        $this->_categoria = $this->cargar_modelo('categoria');
        $this->_subcategoria = $this->cargar_modelo('subcategoria');
        $this->_marcas = $this->cargar_modelo('marcas');
    }
    
    public function index() {
        $this->_vista->datos = $this->_productos->selecciona();
        $this->_vista->marcas = $this->_marcas->selecciona();
        $this->_vista->renderiza_web('index');
    }
    
    public function verp(){
        $this->_productos->id=$_POST['id'];
       echo json_encode($this->_productos->selecciona());
    }
    
    public function verm(){
        $this->_marcas->id=$_POST['id'];
       echo json_encode($this->_marcas->selecciona());
    }
    
    public function ver(){
        $this->_productos->id=$_POST['id'];
       echo json_encode($this->_productos->selecciona());
    }
    
    public function buscador(){
        $this->_productos->producto=$_POST['producto'];
       echo json_encode($this->_productos->selecciona_web());
    }
    
    public function nosotros(){
        $this->_vista->datos = $this->_informacion->selecciona();
        $this->_vista->renderiza_web('nosotros');
    }
    
    public function productos($pagina = false) {
        if(!$this->filtrarInt($pagina)){
            $pagina = false;
        }else{
            $pagina = (int)$pagina;
        }
        $this->get_Libreria('paginador/paginador');
        $paginador = new Paginador();
        $this->_vista->datos = $paginador->paginar($this->_productos->selecciona(), $pagina);
        $this->_vista->paginacion = $paginador->getView('prueba', 'web/productos');
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_vista->datos_subcategoria = array();
        $this->_vista->renderiza_web('productos');
    }
    
    public function galeria(){
        $this->_vista->renderiza_web('galeria');
    }
        
    public function contactenos(){
        $this->_vista->renderiza_web('contactenos');
    }
    
    public function getSubcategoriaAjax(){
        $this->_subcategoria->id_categoria = $_POST['id_categoria'];
        echo json_encode($this->_subcategoria->selecciona());
    }
    
    public function getProductos(){
        $this->_productos->id_subcategoria = $_POST['id_subcategoria'];
        echo json_encode($this->_productos->selecciona_prod());
    }
    
}

?>
