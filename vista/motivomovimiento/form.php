<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['ID_MOTIVOMOVIMIENTO']))echo $this->datos[0]['ID_MOTIVOMOVIMIENTO']?>"/>
            <table align="center" cellpadding="10" >
                <tr>
                    <td><label>Tipo Movimiento</label></td>
                    <td>
                        <select name="id_tipomovimiento" id="id_tipomovimiento">
                            <option value="0"></option>
                            <?php for($i=0;$i<count($this->datos_tipomovimiento);$i++){ ?>
                                <?php if( $this->datos[0]['ID_TIPOMOVIMIENTO'] == $this->datos_tipomovimiento[$i]['ID_TIPOMOVIMIENTO'] ){ ?>
                            <option value="<?php echo $this->datos_tipomovimiento[$i]['ID_TIPOMOVIMIENTO'] ?>" selected="selected"><?php echo utf8_encode($this->datos_tipomovimiento[$i]['DESCRIPCION']) ?></option>
                                <?php } else { ?>
                            <option value="<?php echo $this->datos_tipomovimiento[$i]['ID_TIPOMOVIMIENTO'] ?>"><?php echo utf8_encode($this->datos_tipomovimiento[$i]['DESCRIPCION']) ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Descripcion</label></td>
                    <td>
                    <input type="text" name="descripcion" onkeypress="return soloLetras(event)"
                            id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="button" class="btn btn-primary" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>concepto" class="btn btn-info">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>