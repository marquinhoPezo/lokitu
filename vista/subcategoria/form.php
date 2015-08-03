<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['ID_SUBCATEGORIA']))echo $this->datos[0]['ID_SUBCATEGORIA']?>"/>
            <table align="center" cellpadding="10" >
                <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
                <tr>
                    <td><label>Descripcion</label></td>
                    <td>
                    <input type="text" name="descripcion" onkeypress="return soloLetras(event)"
                            id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/></td>
                </tr>
                <tr>
                    <td><label>Categoria</label></td>
                    <td>
                        <select name="id_categoria" id="id_categoria">
                            <option value="0"></option>
                            <?php for($i=0;$i<count($this->datos_categoria);$i++){ ?>
                                <?php if( $this->datos[0]['ID_CATEGORIA'] == $this->datos_categoria[$i]['ID_CATEGORIA'] ){ ?>
                            <option value="<?php echo $this->datos_categoria[$i]['ID_CATEGORIA'] ?>" selected="selected"><?php echo utf8_encode($this->datos_categoria[$i]['DESCRIPCION']) ?></option>
                                <?php } else { ?>
                            <option value="<?php echo $this->datos_categoria[$i]['ID_CATEGORIA'] ?>"><?php echo utf8_encode($this->datos_categoria[$i]['DESCRIPCION']) ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="button" class="btn btn-primary" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>subcategoria" class="btn btn-info">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>