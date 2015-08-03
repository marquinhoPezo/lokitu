<div class="navbar-inner">
<form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm" enctype="multipart/form-data">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" name="codigo" id="codigo"
            value="<?php if(isset ($this->datos[0]['ID']))echo $this->datos[0]['ID'] ?>"/>
    <table align="center" cellpadding="10">
        <tr>
            <td><label>Titulo</label></td>
            <td>
                <input type="text" id="titulonot" name="titulonot" class="input-xlarge"
                value="<?php if(isset ($this->datos[0]['TITULO']))echo $this->datos[0]['TITULO']?>"/>
            </td>
        </tr>
        <tr>
            <td><label>Contenido</label></td>
            <td>
                <textarea id="cuerpo" name="cuerpo" class="input-xlarge" style="height: 10em" ><?php if(isset ($this->datos[0]['CUERPO']))echo $this->datos[0]['CUERPO']?></textarea>
            </td>
        </tr>
        <tr>
            <?php if(isset ($this->datos[0]['IMAGEN'])){?>
            <td><label>Imagen Subida</label></td>
            <td>
            <div id="imagen_subida" style="text-align: center">
                <img width="160px" height="100px" src="<?php echo BASE_URL ?>lib/img/productos/<?php echo strtolower($this->datos[0]['IMAGEN']) ?>" />
                <br><br>
                <a href="javascript:void" onclick="cambiar_imagen()" class="btn btn-info">Cambiar de Imagen</a>
                <input type="hidden" value="123" id="imagen" />
                <input type="hidden" value="<?php echo $this->datos[0]['IMAGEN']?>" id="imagen_existe" name="imagen_existe" />
                <input type="hidden" value="0" id="modificar_imagen" name="modificar_imagen" />
            </div>
            </td>
            <?php }else{?>
            <td><label>Cargar Imagen</label></td>
            <td>
                <input id="archivo" name="archivo" type="file" style="display: none" />
                <div class="input-append">
                    <input id="imagen" class="input-large" type="text" disabled />
                    <a class="btn btn-info" onclick="$('input[id=archivo]').click();">Buscar</a>
                </div>
            </td>
            <?php }?>
        </tr>
        <tr>
            <td><label>Categoria</label></td>
            <td>
                <select name="id_categoria" id="id_categoria" class="input-xlarge">
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
                <select name="id_subcategoria" id="id_subcategoria" class="input-xlarge">
                    <option value=""></option>
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
            <td><label>Producto Más Vendido</label></td>
            <td>
                <?php if($this->datos[0]['TIPO']==1){?>
                <input type="checkbox" checked="checked" name="tipo" id="tipo" value="chk1" style="margin-top: -10px" />
                <?php } else{ ?>
                <input type="checkbox" name="tipo" id="tipo" value="chk1" style="margin-top: -10px" />
                <?php } ?>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <p><button type="submit" class="btn btn-primary" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>productos" class="btn btn-info">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>
<div id="script">
<script>
$('input[id=archivo]').change(function(){
    $('#imagen').val($(this).val());
})
</script>
</div>