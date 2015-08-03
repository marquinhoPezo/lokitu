<?php

class detprodalm extends Main{

    public $id_almacen;
    public $id_producto;
    public $stock;
    public $cantidadub;
    public $id_motivomovimiento;
    public $aumenta;

    public function selecciona() {
        if(is_null($this->id_almacen)){
            $this->id_almacen=0;
        }
        if(is_null($this->id_producto)){
            $this->id_producto=0;
        }
        $datos = array($this->id_almacen, $this->id_producto);
        $r = $this->get_consulta("sel_detprodalm", $datos);
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
        $datos = array($this->id_almacen, $this->id_producto);
        $r = $this->get_consulta("elim_detprodalm", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->id_almacen, $this->id_producto, $this->stock);
//        print_r($datos);exit;
        $r = $this->get_consulta("ins_detprodalm", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function act_stock() {
        $datos = array($this->id_almacen, $this->id_producto, $this->cantidadub, $this->id_motivomovimiento, $this->aumenta);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("act_stockprodalm", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
