<?php

class detproductounidmedida extends Main{
    
    public $id_unidadmedida;
    public $id_producto;
    public $preciovcont;
    public $preciovcre;

    public function selecciona() {
        if (is_null($this->id_unidadmedida)) {
            $this->id_unidadmedida = 0;
        }
        if (is_null($this->id_producto)) {
            $this->id_producto = 0;
        }
        $datos = array($this->id_unidadmedida, $this->id_producto);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_detprodum", $datos);
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
        $datos = array($this->id_unidadmedida, $this->id_producto, $this->preciovcont, $this->preciovcre);
//        print_r($datos);exit;
        $r = $this->get_consulta("ins_detprodum", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
    
    public function actualiza() {
        $datos = array($this->id_unidadmedida, $this->id_producto, $this->preciovcont, $this->preciovcre);
//        print_r($datos);exit;
        $r = $this->get_consulta("act_detprodum", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->id_unidadmedida, $this->id_producto);
        $r = $this->get_consulta("elim_detprodum", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
