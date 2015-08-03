<?php

class productos extends Main{
    
    public $id;
    public $titulo;
    public $cuerpo;
    public $imagen;
    public $tipo;
    
    public function selecciona() {
        if(is_null($this->id)){
            $this->id=0;
        }
        if(is_null($this->titulo)){
            $this->titulo='';
        }
        $datos = array($this->id, $this->titulo);
        $r = $this->get_consulta("sel_productos", $datos);
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
    
    public function selecciona_web() {
        if(is_null($this->producto)){
            $this->producto='';
        }
        $datos = array($this->producto);
        $r = $this->get_consulta("sel_productos_web", $datos);
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
    
    public function selecciona_prod() {
        $datos = array($this->id_subcategoria);
        $r = $this->get_consulta("sel_productos_cat", $datos);
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
        $datos = array(0, $this->titulo, $this->cuerpo, $this->imagen, $this->tipo, $this->id_subcategoria);
        $r = $this->get_consulta("insact_prod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
    
    public function actualiza() {
        $datos = array($this->id, $this->titulo, $this->cuerpo, $this->imagen, $this->tipo, $this->id_subcategoria);
        $r = $this->get_consulta("insact_prod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
        
    public function elimina() {
        $datos = array($this->id);
        $r = $this->get_consulta("elim_productos", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
}
?>
