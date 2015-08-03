<?php

class marcasweb_controlador extends controller {
    
    private $_marcas;
    
    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_marcas = $this->cargar_modelo('marcas');
    }

    public function index() {
        $this->_vista->titulo = 'Marcas Más Reconocidas';
        $this->_vista->datos = $this->_marcas->selecciona();
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->setJs(array('funcion'));
        $this->_vista->renderizar('index');
    }
    
    public function nuevo(){
        $imagen = "";   
        if ($_POST['guardar'] == 1) {
            $this->get_Libreria('upload' . DS . 'class.upload');
            $dir_dest = ROOT . 'lib' . DS . 'img' . DS . 'marcas' . DS;
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
            $this->_marcas->titulo = $_POST['titulonot'];
            $this->_marcas->cuerpo = $_POST['cuerpo'];
            $this->_marcas->imagen = $imagen;
            $this->_marcas->inserta();   
            echo "<script>alert('Informacion Guardada')</script>";
            $this->redireccionar('marcasweb');
        }
        $this->_vista->titulo = 'Registrar Marca Reconocida';
        $this->_vista->setJs(array('funcionesform'));
        $this->_vista->renderizar('form');
    }
    
    public function editar($id){
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('marcasweb');
        }
        $this->_marcas->id = $this->filtrarInt($id);
        $datos = $this->_marcas->selecciona();
//        echo '<pre>';print_r($datos);exit;
        $this->_vista->datos = $datos;
        $imagen="";
        if ($_POST['guardar'] == 1) {
            if($_POST['modificar_imagen'] == 1){
                $this->get_Libreria('upload' . DS . 'class.upload');
                $dir_dest = ROOT . 'lib' . DS . 'img' . DS . 'marcas' . DS;
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
            $this->_marcas->id = $_POST['codigo'];
            $this->_marcas->titulo = $_POST['titulonot'];
            $this->_marcas->cuerpo = $_POST['cuerpo'];
            $this->_marcas->imagen = $imagen;
            $this->_marcas->actualiza();
            echo "<script>alert('Informacion Guardada')</script>";
            $this->redireccionar('marcasweb');
        }
        $this->_vista->titulo = 'Actualizar Marca Reconocida';
        $this->_vista->setJs(array('funcionesform'));
        $this->_vista->renderizar('form');
    }
    
    public function buscar(){
        if($_POST['filtro']==0){
            $this->_marcas->titulo=$_POST['cadena'];
        }
        echo json_encode($this->_marcas->selecciona());
    }
    
    public function ver(){
        $this->_marcas->id=$_POST['id'];
       echo json_encode($this->_marcas->selecciona());
    }
        
    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('marcasweb');
        }
        $this->_marcas->id= $this->filtrarInt($id);
        $this->_marcas->elimina();
        echo "<script>alert('Informacion Eliminada')</script>";
        $this->redireccionar('marcasweb');
    }
    
}
?>