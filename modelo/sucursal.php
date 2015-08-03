<?php

class sucursal extends Main{

    public $id_sucursal;
    public $nombre;
    public $direccion;
    public $telefono;
    public $ciudad;

    public function selecciona() {
        if(is_null($this->id_sucursal)){
            $this->id_sucursal=0;
        }
        if(is_null($this->nombre)){
            $this->nombre='';
        }
        $datos = array($this->id_sucursal,$this->nombre);
        $r = $this->get_consulta("sel_sucursal", $datos);
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
        $datos = array($this->id_sucursal);
        $r = $this->get_consulta("elim_sucursal", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->nombre, $this->direccion, $this->telefono, $this->ciudad);
        $r = $this->get_consulta("ins_sucursal", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->id_sucursal, $this->nombre, $this->direccion, $this->telefono, $this->ciudad);
        $r = $this->get_consulta("act_sucursal", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
