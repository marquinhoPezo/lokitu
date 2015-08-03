<?php

class marca extends Main{

    public $idmarca;
    public $descripcion;

    public function selecciona() {
        if(is_null($this->idmarca)){
            $this->idmarca=0;
        }
        if(is_null($this->descripcion)){
            $this->descripcion='';
        }
        $datos = array($this->idmarca, $this->descripcion);
        $r = $this->get_consulta("sel_marca", $datos);
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
        $datos = array($this->idmarca);
        $r = $this->get_consulta("elim_marca", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->descripcion);
        $r = $this->get_consulta("ins_marca", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->idmarca, $this->descripcion);
        $r = $this->get_consulta("act_marca", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
