<div class="navbar-inner">
<form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
            value="<?php if(isset ($this->datos[0]['ID_ALMACEN']))echo $this->datos[0]['ID_ALMACEN']?>"/>
    <table align="center" cellpadding="10" >
        <tr>
            <td><label>Descripcion:</label></td>
            <td><input type="text" name="descripcion"
                       id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/></td>
        </tr>
        <tr>
            <td><label>Sucursal</label></td>
            <td>
                <select name="id_sucursal" id="id_sucursal">
                    <option value="0"></option>
                    <?php for($i=0;$i<count($this->datos_sucursal);$i++){ ?>
                        <?php if( $this->datos[0]['ID_SUCURSAL'] == $this->datos_sucursal[$i]['ID_SUCURSAL'] ){ ?>
                    <option value="<?php echo $this->datos_sucursal[$i]['ID_SUCURSAL'] ?>" selected="selected"><?php echo utf8_encode($this->datos_sucursal[$i]['NOMBRE']) ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->datos_sucursal[$i]['ID_SUCURSAL'] ?>"><?php echo utf8_encode($this->datos_sucursal[$i]['NOMBRE']) ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>Ubicacion:</label></td>
            <td><input type="text" name="ubicacion"
                       id="ubicacion" value="<?php if(isset ($this->datos[0]['UBICACION']))echo $this->datos[0]['UBICACION']?>"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <p><button type="submit" class="btn btn-primary" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>almacenes" class="btn btn-info">Cancelar</a></p>
        </tr>
    </table>
</form>