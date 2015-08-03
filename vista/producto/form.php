<div class="navbar-inner">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                value="<?php if(isset ($this->datos[0]['ID_PRODUCTO']))echo $this->datos[0]['ID_PRODUCTO']?>"/>
    <table align="center" cellpadding="10">
        <tr>
            <td><label>Marca:</label></td>
            <td>
                <select name="id_marca" id="id_marca">
                    <?php for($i=0;$i<count($this->datos_marca);$i++){ ?>
                        <option value="0"></option>
                        <?php if( $this->datos[0]['ID_MARCA'] == $this->datos_marca[$i]['ID_MARCA'] ){ ?>
                    <option value="<?php echo $this->datos_marca[$i]['ID_MARCA'] ?>" selected="selected"><?php echo utf8_encode($this->datos_marca[$i]['DESCRIPCION']) ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->datos_marca[$i]['ID_MARCA'] ?>"><?php echo utf8_encode($this->datos_marca[$i]['DESCRIPCION']) ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </td>
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
            <td><label>SubCategoria</label></td>
            <td>
                <select name="id_subcategoria" id="id_subcategoria">
                    <option value="0"></option>
                    <?php for($i=0;$i<count($this->datos_subcategoria);$i++){ ?>
                        <?php if( $this->datos[0]['ID_SUBCATEGORIA'] == $this->datos_subcategoria[$i]['ID_SUBCATEGORIA'] ){ ?>
                    <option value="<?php echo $this->datos_subcategoria[$i]['ID_SUBCATEGORIA'] ?>" selected="selected"><?php echo utf8_encode($this->datos_subcategoria[$i]['DESCRIPCION']) ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->datos_subcategoria[$i]['ID_SUBCATEGORIA'] ?>"><?php echo utf8_encode($this->datos_subcategoria[$i]['DESCRIPCION']) ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>Descripcion:</label></td>
            <td><input type="text" name="descripcion" id="descripcion" 
               value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/></td>
        </tr>
        <td><label>Unidad de Medida</label></td>
        <td>
            <select name="id_unidadmedida" id="id_unidadmedida">
                <option value="0"></option>
                <?php for($i=0;$i<count($this->datos_unidadmedida);$i++){ ?>
                    <?php if( $this->datos[0]['ID_UNIDADMEDIDA'] == $this->datos_unidadmedida[$i]['ID_UNIDADMEDIDA'] ){ ?>
                <option value="<?php echo $this->datos_unidadmedida[$i]['ID_UNIDADMEDIDA'] ?>" selected="selected"><?php echo utf8_encode($this->datos_unidadmedida[$i]['DESCRIPCION']) ?></option>
                    <?php } else { ?>
                <option value="<?php echo $this->datos_unidadmedida[$i]['ID_UNIDADMEDIDA'] ?>"><?php echo utf8_encode($this->datos_unidadmedida[$i]['DESCRIPCION']) ?></option>
                    <?php } ?>
                <?php } ?>
            </select>
        </td>
        <tr>
            <td colspan="2" align="center">
                <p><button type="submit" class="btn btn-primary" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>producto" class="btn btn-info">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>