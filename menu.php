<?php

Class menu {

//cargarmenu("0"); // Donde 0 es el Idpadre principal
    protected $_id;
    protected $_datos;
    protected $_id_modulopadre;
    private $_c = 0;

    public function __construct($datos, $id_modulopadre) {
        $this->_datos = $datos;
        $this->_id_modulopadre = $id_modulopadre;
        $this->unemenu();
    }

    function unemenu() {
        echo "<div id='sidebar' class='fixed'>";
        echo "<ul class='nav nav-list'>";
        $this->cargarmenu();
        echo "<li><a href='" . BASE_URL . "'><i class='icon-desktop'></i><span>Web</span></a></li>";
        echo "</ul>";
        echo '<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>';
        echo "</div>";
    }

    function cargarmenu() {
        if(isset($this->_datos) && count($this->_datos)){
            for($i=0; $i< count($this->_datos); $i++){
                if($this->_c==0){
                    $descripcion= ucwords(strtolower($this->_datos[$i]['XMODULOS']));
                    if($this->_datos[$i]['IDMODULO']==$this->_id_modulopadre){
                            echo "<li class='active'><a href='javascript:void' class='dropdown-toggle'><i class='".strtolower($this->_datos[$i]['ICONO'])."'></i><span>$descripcion</span><b class='arrow icon-angle-down'></b></a><ul class='submenu'>";
                    }else{
                        echo "<li><a href='javascript:void' class='dropdown-toggle'><i class='".strtolower($this->_datos[$i]['ICONO'])."'></i><span>$descripcion</span><b class='arrow icon-angle-down'></b></a><ul class='submenu'>";
                    }
                    $this->_c = 1;
                }
                if (strtoupper($descripcion) == $this->_datos[$i]['XMODULOS']){
                    $url = BASE_URL . strtolower($this->_datos[$i]['URL']);
                    echo "<li><a href='$url' class='mh_".strtolower($this->_datos[$i]['URL'])."'>" . ucwords(strtolower($this->_datos[$i]['MODULOS_HIJOS'])) . "</a></li>";
                } else {
                    echo "</ul></li>";
                    $this->_c = 0;
                    $i = $i -1;
                }
            }
            echo "</ul></li>";
        }
    }
}
?>
<!--FIn menu-->