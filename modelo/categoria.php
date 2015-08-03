<?php

class categoria extends Main{

    public $id_categoria;
    public $descripcion;

    public function selecciona() {
        if(is_null($this->id_categoria)){
            $this->id_categoria=0;
        }
        if(is_null($this->descripcion)){
            $this->descripcion='';
        }
        $datos = array($this->id_categoria, $this->descripcion);
        $r = $this->get_consulta("sel_categoria", $datos);
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
        };
    }

    public function elimina() {
        $datos = array($this->id_categoria);
        $r = $this->get_consulta("elim_categoria", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->descripcion);
        $r = $this->get_consulta("ins_categoria", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->id_categoria, $this->descripcion);
        $r = $this->get_consulta("act_categoria", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
