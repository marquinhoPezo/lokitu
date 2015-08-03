<?php

class detcompraproducto extends Main{
    
    public $id_compra;
    public $id_producto;
    public $cantidadum;
    public $preciounitario;
    public $id_unidadmedida;
    public $cantidadub;
    public $precioub;
    public $stockactual;

    public function selecciona() {
        if (is_null($this->id_compra)) {
            $this->id_compra = 0;
        }
        if (is_null($this->id_producto)) {
            $this->id_producto = 0;
        }
        $datos = array($this->id_compra, $this->id_producto);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_detcompprod", $datos);
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
        $datos = array($this->id_compra, $this->id_producto, $this->cantidadum, $this->preciounitario, $this->id_unidadmedida,
            $this->cantidadub, $this->precioub, $this->stockactual);
//        print_r($datos);exit;
        $r = $this->get_consulta("ins_detcompprod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function elimina() {
        $datos = array($this->id_compra, $this->id_producto);
        $r = $this->get_consulta("elim_detcompprod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
