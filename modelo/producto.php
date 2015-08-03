<?php

class producto extends Main{
    
    public $id_producto;
    public $id_marca;
    public $id_subcategoria;
    public $descripcion;
    public $id_unidadmedida;
    public $marca;
    public $subcategoria;
    public $cantidadub;
    public $id_almacen;

    public function selecciona() {
        if (is_null($this->id_producto)) {
            $this->id_producto = 0;
        }
        if (is_null($this->descripcion)) {
            $this->descripcion = '';
        }
        if (is_null($this->marca)) {
            $this->marca = '';
        }
        if (is_null($this->subcategoria)) {
            $this->subcategoria = '';
        }
        $datos = array($this->id_producto, $this->descripcion, $this->marca, $this->subcategoria);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_producto", $datos);
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
    
    public function seleccionaProdxAlmacen() {
        if (is_null($this->descripcion)) {
            $this->descripcion = '';
        }
        if (is_null($this->marca)) {
            $this->marca = '';
        }
        if (is_null($this->subcategoria)) {
            $this->subcategoria = '';
        }
        $datos = array($this->descripcion, $this->marca, $this->subcategoria, $this->id_almacen);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_prodxalm", $datos);
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
        $datos = array($this->id_marca, $this->id_subcategoria, $this->descripcion, $this->id_unidadmedida);
//        print_r($datos);exit;
        $r = $this->get_consulta("ins_producto", $datos);
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
        $datos = array($this->id_producto, $this->id_marca, $this->id_subcategoria, $this->descripcion, $this->id_unidadmedida);
        $r = $this->get_consulta("act_producto", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
    
    public function act_stock() {
        $datos = array($this->id_producto, $this->cantidadub);
        $r = $this->get_consulta("act_stock", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->id_producto);
        $r = $this->get_consulta("elim_producto", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
    
    public function selecciona_android() {

        $datos = array(0);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_producto_android", $datos);
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
    //get_producto
}

?>
