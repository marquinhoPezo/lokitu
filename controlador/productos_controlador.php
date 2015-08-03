<?php

class productos_controlador extends controller {
    
    private $_productos;
    
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_productos = $this->cargar_modelo('productos');
        $this->_subcategoria=  $this->cargar_modelo('subcategoria');
        $this->_categoria = $this->cargar_modelo('categoria');
    }

    public function index() {
        $this->_vista->titulo = 'Catalago de Productos';
        $this->_vista->datos = $this->_productos->selecciona();
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->setJs(array('funcion'));
        $this->_vista->renderizar('index');
    }
    
    public function nuevo(){
        $imagen = "";   
        if ($_POST['guardar'] == 1) {
            $this->get_Libreria('upload' . DS . 'class.upload');
            $dir_dest = ROOT . 'lib' . DS . 'img' . DS . 'productos' . DS;
            $handle = new Upload($_FILES['archivo'], 'es_ES');
            if ($handle->uploaded) {
                $handle->file_new_name_body = 'upl_' . uniqid();
                $handle->image_resize = true;
                $handle->image_x = 200;
                $handle->image_y = 150;
                $handle->Process($dir_dest);
                $imagen = $handle->file_dst_name;
            }else {
                die('Error al Subir Imagen');
                $this->redireccionar('productos');
            }
            if ($_POST['tipo'] == 'chk1'){
                $this->_productos->tipo = 1;
            }else{
                $this->_productos->tipo = 0;
            }
            $this->_productos->titulo = $_POST['titulonot'];
            $this->_productos->cuerpo = $_POST['cuerpo'];
            $this->_productos->imagen = $imagen;
            $this->_productos->id_subcategoria = $_POST['id_subcategoria'];
            $this->_productos->inserta();   
            echo "<script>alert('Informacion Guardada')</script>";
            $this->redireccionar('productos');
        }
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_vista->datos_subcategoria = array();
        $this->_vista->titulo = 'Registrar Producto para el Catalogo';
        $this->_vista->setJs(array('funcionesform'));
        $this->_vista->renderizar('form');
    }
    
    public function editar($id){
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('productos');
        }
        $this->_productos->id = $this->filtrarInt($id);
        $datos = $this->_productos->selecciona();
//        echo '<pre>';print_r($datos);exit;
        $this->_vista->datos = $datos;
        $imagen="";
        if ($_POST['guardar'] == 1) {
            if($_POST['modificar_imagen'] == 1){
                $this->get_Libreria('upload' . DS . 'class.upload');
                $dir_dest = ROOT . 'lib' . DS . 'img' . DS . 'noticias' . DS;
                $handle = new Upload($_FILES['archivo'], 'es_ES');
                if ($handle->uploaded) {
                    $handle->file_new_name_body = 'upl_' . uniqid();
                    $handle->image_resize = true;
                    $handle->image_x = 200;
                    $handle->image_y = 150;
                    $handle->Process($dir_dest);
                    $imagen = $handle->file_dst_name;
                }else {
                    die('Error al Subir Imagen');
                }
            }else{
                $imagen = $_POST['imagen_existe'];
            }
            $this->_productos->id = $_POST['codigo'];
            if ($_POST['tipo'] == 'chk1'){
                $this->_productos->tipo = 1;
            }else{
                $this->_productos->tipo = 0;
            }
            $this->_productos->titulo = $_POST['titulonot'];
            $this->_productos->cuerpo = $_POST['cuerpo'];
            $this->_productos->imagen = $imagen;
            $this->_productos->id_subcategoria = $_POST['id_subcategoria'];
            $this->_productos->actualiza();
            echo "<script>alert('Informacion Guardada')</script>";
            $this->redireccionar('productos');
        }
        $this->_vista->datos_categoria = $this->_categoria->selecciona();
        $this->_subcategoria->id_categoria = $datos[0]['ID_CATEGORIA'];
        $this->_vista->datos_subcategoria = $this->_subcategoria->selecciona();
        $this->_vista->titulo = 'Actualizar Producto para el Catalogo';
        $this->_vista->setJs(array('funcionesform'));
        $this->_vista->renderizar('form');
    }
    
    public function buscar(){
        if($_POST['filtro']==0){
            $this->_productos->titulo=$_POST['cadena'];
        }
        echo json_encode($this->_productos->selecciona());
    }
    
    public function ver(){
        $this->_productos->id=$_POST['id'];
       echo json_encode($this->_productos->selecciona());
    }
        
    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('productos');
        }
        $this->_productos->id= $this->filtrarInt($id);
        $this->_productos->elimina();
        echo "<script>alert('Informacion Eliminada')</script>";
        $this->redireccionar('productos');
    }
    
}
?>