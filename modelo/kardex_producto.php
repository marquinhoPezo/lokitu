<?php

class kardex_producto extends Main{

    public $id_kardex_producto;
    public $id_producto;
    public $tipo;
    public $cantidad;
    public $glosa;
    public $fecha;
    public $id_almacen;
    public $almacen;
    public $saldo;
    public $id_sucursal;
    public $producto;

    public function selecciona() {
        if (is_null($this->id_kardex_producto)) {
            $this->id_kardex_producto = 0;
        }
        if (is_null($this->id_producto)) {
            $this->id_producto = 0;
        }
        if (is_null($this->tipo)) {
            $this->tipo = '';
        }
        if (is_null($this->almacen)) {
            $this->almacen = '';
        }
        if (is_null($this->producto)) {
            $this->producto = '';
        }
        if(session::get('idperfil')!=1){
            $this->id_sucursal = session::get('idsucursal');
        }else{
            $this->id_sucursal = 0;
        }
        $datos = array($this->id_kardex_producto, $this->id_producto, $this->tipo, $this->almacen, $this->producto, $this->id_sucursal);
        $r = $this->get_consulta("sel_kardexprod", $datos);
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
        $datos = array($this->id_kardex_producto);
        $r = $this->get_consulta("elim_kardexprod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function inserta() {
        $datos = array($this->id_producto, $this->tipo, $this->id_almacen);
//        print_r($datos);exit;
        $r = $this->get_consulta("ins_kardexprod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->id_kardex_producto, $this->id_producto, $this->tipo, $this->id_almacen);
        $r = $this->get_consulta("act_kardexprod", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

}

?>
