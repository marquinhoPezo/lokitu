<?php

class marcas extends Main{
    
    public $id;
    public $titulo;
    public $cuerpo;
    public $imagen;
    
    public function selecciona() {
        if(is_null($this->id)){
            $this->id=0;
        }
        if(is_null($this->titulo)){
            $this->titulo='';
        }
        $datos = array($this->id, $this->titulo);
        $r = $this->get_consulta("sel_marcas", $datos);
        if ($r[1] == '') {
            $stmt = $r[0];
        } else {
            die($r[1]);
        }
        $r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);
            return $stmt->fetchall();
        }
    }

    public function inserta() {
        $datos = array(0, $this->titulo, $this->cuerpo, $this->imagen);
        $r = $this->get_consulta("insact_marcaweb", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
    
    public function actualiza() {
        $datos = array($this->id, $this->titulo, $this->cuerpo, $this->imagen);
        $r = $this->get_consulta("insact_marcaweb", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
        
    public function elimina() {
        $datos = array($this->id);
        $r = $this->get_consulta("elim_marcas", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
}
?>
