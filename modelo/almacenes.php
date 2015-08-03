<?php

class almacenes extends Main{

    public $idalmacen;
    public $descripcion;
    public $ubicacion;
    public $id_sucursal;
    public $sucursal;

    public function selecciona() {
        if (is_null($this->idalmacen)) {
            $this->idalmacen = 0;
        }
        if (is_null($this->descripcion)) {
            $this->descripcion = '';
        }
        if (is_null($this->ubicacion)) {
            $this->ubicacion = '';
        }
        if (is_null($this->sucursal)) {
            $this->sucursal = '';
        }
        if (is_null($this->id_sucursal)) {
            $this->id_sucursal = 0;
        }
        $datos = array($this->idalmacen, $this->descripcion, $this->ubicacion, $this->sucursal, $this->id_sucursal);
        $r = $this->get_consulta("sel_almacen", $datos);
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
        $datos = array($this->idalmacen);
        $r = $this->get_consulta("elim_almacen", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->descripcion, $this->ubicacion, $this->id_sucursal);
//        print_r($datos);exit;
        $r = $this->get_consulta("ins_almacen", $datos);
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

    public function actualiza() {
        $datos = array($this->idalmacen, $this->descripcion, $this->ubicacion, $this->id_sucursal);
        $r = $this->get_consulta("act_almacen", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
