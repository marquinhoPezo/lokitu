<?php

class movimientoproducto_controlador extends controller {

    private $_kardex_producto;
    private $_detprodalm;
    private $_almacenes;
    private $_tipomovimiento;
    private $_motivomovimiento;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_detprodalm = $this->cargar_modelo('detprodalm');
        $this->_almacenes = $this->cargar_modelo('almacenes');
        $this->_kardex_producto = $this->cargar_modelo('kardex_producto');
        $this->_tipomovimiento = $this->cargar_modelo('tipomovimiento');
        $this->_motivomovimiento = $this->cargar_modelo('motivomovimiento');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Movimiento de Productos';
        $this->_vista->datos = $this->_kardex_producto->selecciona();
//        echo '<pre>';print_r($this->_kardex_producto->selecciona());exit;
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_kardex_producto->producto=$_POST['descripcion'];
        }
        echo json_encode($this->_kardex_producto->selecciona());
    }
    
    public function nuevo() {
        if ($_POST['guardar'] == 1) {
//            echo '<pre>';print_r($_POST);exit;
            if($_POST['id_motivomovimiento']==1 || $_POST['id_motivomovimiento']==2){
                for($i=0;$i<count($_POST['id_producto']);$i++){
                    //Disminuimos el stock de producto por almacen
                    $this->_detprodalm->id_almacen = $_POST['id_almacen_origen'];
                    $this->_detprodalm->id_producto = $_POST['id_producto'][$i];
                    $this->_detprodalm->cantidadub = $_POST['cantidadub'][$i];
                    $this->_detprodalm->id_motivomovimiento = 2;
                    $this->_detprodalm->aumenta = 0;
                    $this->_detprodalm->act_stock();
                    //Aumentamos el stock de producto por almacen
                    $this->_detprodalm->id_almacen= $_POST['id_almacen_destino'];
                    $this->_detprodalm->id_producto = $_POST['id_producto'][$i];
                    $this->_detprodalm->cantidadub = $_POST['cantidadub'][$i];
                    $this->_detprodalm->id_motivomovimiento = 1;
                    $this->_detprodalm->aumenta = 1;
                    $this->_detprodalm->act_stock();
                }
            }else{
                $this->_detprodalm->id_motivomovimiento = $_POST['id_motivomovimiento'];
                $this->_detprodalm->aumenta = $_POST['id_tipomovimiento'];
                $this->_detprodalm->id_almacen= $_POST['id_almacen'];
                for($i=0;$i<count($_POST['id_producto']);$i++){
                    $this->_detprodalm->id_producto = $_POST['id_producto'][$i];
                    $this->_detprodalm->cantidadub = $_POST['cantidadub'][$i];
                    $this->_detprodalm->act_stock();
                }
            }
            $this->redireccionar('movimientoproducto');
        }
        $this->_vista->datos_tipomovimiento = $this->_tipomovimiento->selecciona();
        $this->_vista->datos_motivomovimiento = array();
        $this->_vista->datos_almacenes = $this->_almacenes->selecciona();
        $this->_vista->titulo = 'Registrar Movimiento Producto';
        $this->_vista->action = BASE_URL . 'movimientoproducto/nuevo';
        $this->_vista->setJs(array('funciones_form'));
        $this->_vista->renderizar('form');
    }

}

?>
