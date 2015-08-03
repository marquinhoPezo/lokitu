<?php

class producto_controlador extends controller{

    private $_producto;
    private $_marca;
    private $_almacen;
    private $_subcategoria;
    private $_unidadmedida;
    private $_detproductounidmedida;
    private $_detprodalm;
    private $_kardex_producto;
    private $_categoria;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_producto=  $this->cargar_modelo('producto');
        $this->_marca=  $this->cargar_modelo('marca');
        $this->_almacen=  $this->cargar_modelo('almacenes');
        $this->_subcategoria=  $this->cargar_modelo('subcategoria');
        $this->_unidadmedida=  $this->cargar_modelo('unidadmedida');
        $this->_detproductounidmedida=  $this->cargar_modelo('detproductounidmedida');
        $this->_detprodalm=  $this->cargar_modelo('detprodalm');
        $this->_kardex_producto=  $this->cargar_modelo('kardex_producto');
        $this->_categoria = $this->cargar_modelo('categoria');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Productos';
        $this->_vista->datos = $this->_producto->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_producto->descripcion=$_POST['cadena'];
        }
        if($_POST['filtro']==1){
            $this->_producto->marca=$_POST['cadena'];
        }
        echo json_encode($this->_producto->selecciona());
    }
    
    public function buscarProdxAlmacen(){
        $this->_producto->id_almacen=$_POST['id_almacen'];
        if($_POST['filtro']==0){
            $this->_producto->descripcion=$_POST['cadena'];
        }
        if($_POST['filtro']==1){
            $this->_producto->marca=$_POST['cadena'];
        }
        if($_POST['filtro']==2){
            $this->_producto->subcategoria=$_POST['cadena'];
        }
        echo json_encode($this->_producto->seleccionaProdxAlmacen());
    }
    
    public function ver(){
        $this->_producto->id_producto=$_POST['idproducto'];
        echo json_encode($this->_producto->selecciona());
    }

    public function nuevo() {
//        echo '<pre>';print_r($_POST);exit;
        if ($_POST['guardar'] == 1) {
            $this->_producto->id_marca = $_POST['id_marca'];
            $this->_producto->id_subcategoria = $_POST['id_subcategoria'];
            $this->_producto->descripcion = $_POST['descripcion'];
            $this->_producto->id_unidadmedida = $_POST['id_unidadmedida'];
            $datos = $this->_producto->inserta();
            //Insertamos unidad de medida x producto
            $this->_detproductounidmedida->id_producto = $datos[0]['INS_PRODUCTO'];
            $this->_detproductounidmedida->id_unidadmedida = $_POST['id_unidadmedida'];
            $this->_detproductounidmedida->preciovcont = 0.00;
            $this->_detproductounidmedida->preciovcre = 0.00;
            $this->_detproductounidmedida->inserta();
            //Insertamos producto x almacen
            $datos_almacen = $this->_almacen->selecciona();
            for($i=0;$i<count($datos_almacen);$i++){
                $this->_detprodalm->id_almacen = $datos_almacen[$i]['ID_ALMACEN'];
                $this->_detprodalm->id_producto = $datos[0]['INS_PRODUCTO'];
                $this->_detprodalm->stock = 0;
                $this->_detprodalm->inserta();
            }
            $this->redireccionar('producto');
        }
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_vista->datos_subcategoria = array();
        $this->_vista->datos_marca = $this->_marca->selecciona();
        $this->_vista->datos_unidadmedida = $this->_unidadmedida->selecciona_unidadbase();
        $this->_vista->titulo = 'Registrar Producto';
        $this->_vista->action = BASE_URL . 'producto/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('producto');
        }

        $this->_producto->id_producto = $this->filtrarInt($id);
        $datos = $this->_producto->selecciona();
//        echo '<pre>';print_r($datos);exit;
        $this->_vista->datos = $datos;

        if ($_POST['guardar'] == 1) {
            $this->_producto->id_producto = $_POST['codigo'];
            $this->_producto->id_marca = $_POST['id_marca'];
            $this->_producto->id_subcategoria = $_POST['id_subcategoria'];
            $this->_producto->descripcion = $_POST['descripcion'];
            $this->_producto->id_unidadmedida = $_POST['id_unidadmedida'];
            $this->_producto->actualiza();
            $this->_detproductounidmedida->id_producto = $_POST['codigo'];
            $this->_detproductounidmedida->id_unidadmedida = $_POST['id_unidadmedida'];
            $this->_detproductounidmedida->preciovcont = 0.00;
            $this->_detproductounidmedida->preciovcre = 0.00;
            $this->_detproductounidmedida->actualiza();
            $this->redireccionar('producto');
        }
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_subcategoria->id_categoria = $datos[0]['ID_CATEGORIA'];
        $this->_vista->datos_subcategoria = $this->_subcategoria->selecciona();
        $this->_vista->datos_marca = $this->_marca->selecciona();
        $this->_vista->datos_unidadmedida = $this->_unidadmedida->selecciona_unidadbase();
        $this->_vista->titulo = 'Actualizar Producto';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('producto');
        }
        $this->_producto->id_producto = $this->filtrarInt($id);
        $this->_producto->elimina();
        $this->redireccionar('producto');
    }
    
    public function asignarunidades($id){
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('producto');
        }
        $this->_producto->id_producto = $this->filtrarInt($id);
        $this->_vista->id_producto = $this->filtrarInt($id);
        $producto = $this->_producto->selecciona();
        $this->_unidadmedida->id_unidadmedida = $producto[0]['ID_UNIDADMEDIDA'];
        $this->_vista->datos_detproductounidmedida = $this->_unidadmedida->selecciona_unidadbase();
        $this->_detproductounidmedida->id_producto = $this->filtrarInt($id);
        $this->_vista->datos = $this->_detproductounidmedida->selecciona();
        $this->_vista->titulo = 'Asignar Unidades Equivalentes';
        $this->_vista->action = BASE_URL . 'producto/asignarunidades';
        $this->_vista->setJs(array('funciones_asignarunidades'));
        $this->_vista->renderizar('formasignarunidades');
    }
    
    public function getUnidadMedida(){
        $this->_detproductounidmedida->id_producto = $_POST['codigo'];
        $this->_detproductounidmedida->id_unidadmedida = $_POST['id_unidadmedida'];
        echo json_encode($this->_detproductounidmedida->selecciona());
    }
    
    public function addUnidadMedida(){
        $this->_detproductounidmedida->id_producto = $_POST['codigo'];
        $this->_detproductounidmedida->id_unidadmedida = $_POST['id_unidadmedida'];
        $this->_detproductounidmedida->preciovcont = $_POST['preciovcont'];
        if(trim($_POST['preciovcre'])==''){
            $this->_detproductounidmedida->preciovcre = 0;
        }else{
            $this->_detproductounidmedida->preciovcre = $_POST['preciovcre'];
        }
        $this->_detproductounidmedida->inserta();
        echo json_encode(array('code'=>'ok'));
    }
    
    public function delUnidadMedida(){
        $this->_detproductounidmedida->id_producto = $_POST['id_producto'];
        $this->_detproductounidmedida->id_unidadmedida = $_POST['id_unidadmedida'];
        $this->_detproductounidmedida->elimina();
        echo json_encode(array('code'=>'ok'));
    }
    
    public function getUnidadesProducto(){
        $this->_detproductounidmedida->id_producto = $_POST['id_producto'];
        echo json_encode($this->_detproductounidmedida->selecciona());
    }
    
    public function updatePrecioVxUM(){
        $this->_detproductounidmedida->id_producto = $_POST['id_producto'];
        $this->_detproductounidmedida->id_unidadmedida = $_POST['id_unidadmedida'];
        $this->_detproductounidmedida->preciovcont = $_POST['preciovcont'];
        $this->_detproductounidmedida->preciovcre = $_POST['preciovcre'];
        $this->_detproductounidmedida->actualiza();
        echo json_encode(array('code'=>'ok'));
    }
    
    public function kardex($id){
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('producto');
        }
        $this->_kardex_producto->id_producto = $this->filtrarInt($id);
        $this->_vista->datos = $this->_kardex_producto->selecciona();
        $this->_vista->titulo = 'Movimiento de Producto';
        $this->_vista->action = BASE_URL . 'producto/kardex';
        $this->_vista->renderizar('kardex');
    }
    
}

?>
