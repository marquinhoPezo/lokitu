<?php

class motivomovimiento extends Main{

    public $idmotivomovimiento;
    public $descripcion;
    public $id_tipomovimiento;
    public $tipomovimiento;

    public function selecciona() {
        if(is_null($this->idmotivomovimiento)){
            $this->idmotivomovimiento=0;
        }
         if(is_null($this->descripcion)){
            $this->descripcion='';
        }
         if(is_null($this->tipomovimiento)){
            $this->tipomovimiento='';
        }
        $datos = array($this->idmotivomovimiento, $this->descripcion, $this->tipomovimiento);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_motivomovimiento", $datos);
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
        $datos = array($this->idmotivomovimiento);
        $r = $this->get_consulta("elim_motivomovimiento", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->descripcion, $this->id_tipomovimiento);
        $r = $this->get_consulta("ins_motivomovimiento", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->idmotivomovimiento, $this->descripcion, $this->id_tipomovimiento);
        $r = $this->get_consulta("act_motivomovimiento", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
