<?php

class subcategoria extends Main{

    public $id_subcategoria;
    public $descripcion;
    public $id_categoria;
    public $categoria;

    public function selecciona() {
        if(is_null($this->id_subcategoria)){
            $this->id_subcategoria=0;
        }
         if(is_null($this->descripcion)){
            $this->descripcion='';
        }
         if(is_null($this->categoria)){
            $this->categoria='';
        }
         if(is_null($this->id_categoria)){
            $this->id_categoria=0;
        }
        $datos = array($this->id_subcategoria, $this->descripcion, $this->categoria, $this->id_categoria);
        $r = $this->get_consulta("sel_subcategoria", $datos);
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

    public function elimina() {
        $datos = array($this->id_subcategoria);
        $r = $this->get_consulta("elim_subcategoria", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->descripcion, $this->id_categoria);
        $r = $this->get_consulta("ins_subcategoria", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->id_subcategoria, $this->descripcion, $this->id_categoria);
        $r = $this->get_consulta("act_subcategoria", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
