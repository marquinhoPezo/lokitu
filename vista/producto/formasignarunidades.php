<script src="<?php echo $_params['ruta_js']; ?>bootbox.min.js"></script>
<div class="navbar-inner">
    <form id="frm">
        <input type="hidden" readonly="readonly" name="codigo" id="codigo"
               value="<?php if (isset($this->id_producto)) echo $this->id_producto ?>"/>
        <table align="center" cellpadding="10">
            <tr>
                <td><label>Unidad de Medida:</label></td>
                <td>
                    <select name="id_unidadmedida" id="id_unidadmedida">
                        <option value="0"></option>
                        <?php for ($i = 0; $i < count($this->datos_detproductounidmedida); $i++) { ?>
                            <option value="<?php echo $this->datos_detproductounidmedida[$i]['ID_UNIDADMEDIDA'] ?>"><?php echo utf8_encode($this->datos_detproductounidmedida[$i]['DESCRIPCION']) ?></option>
                        <?php } ?>
                    </select>
                </td>
                <td><label>Precio de Venta Contado:</label></td>
                <td>
                    <input type="text" name="preciovcont" id="preciovcont" value="" class="input-small"/>
                </td>
                <td><label>Precio de Venta Credito:</label></td>
                <td>
                    <input type="text" name="preciovcre" id="preciovcre" value="" class="input-small"/>
                </td>
                <td id="celda_aceptar">
                    <a href="javascript:void(0)" class="btn btn-primary" id="asignar" title="Asignar"><i class="icon-plus icon-white"></i></a>
                </td>
            </tr>
        </table>
    </form>
    <div id="grilla">
        <table id="table" class="table table-striped table-bordered table-hover sortable">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Unidad Medida</th>
                    <th>Prec. V. Cont.</th>
                    <th>Prec. V. Cred.</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php $x = 0;
                for ($i = 0; $i < count($this->datos); $i++) { ?>
                    <tr>
                        <td><?php echo++$x ?></td>
                        <td><?php echo $this->datos[$i]['UUNIDADMEDIDA'] ?></td>
                        <td><?php echo $this->datos[$i]['PRECIOVCONT'] ?></td>
                        <td><?php echo $this->datos[$i]['PRECIOVCRE'] ?></td>
                        <td>
                            <a href="#myModal" role="button" data-toggle="modal" onclick="editaprecv('<?php echo $this->datos[$i]['ID_PRODUCTO'] ?>','<?php echo $this->datos[$i]['ID_UNIDADMEDIDA'] ?>','<?php echo $this->datos[$i]['PRECIOVCONT']?>','<?php echo $this->datos[$i]['PRECIOVCRE'] ?>','<?php echo $this->datos[$i]['UUNIDADMEDIDA']?>')" class="btn btn-success btn-minier"><i class="icon-pencil icon-white"></i> Editar Precios</a>
                    <?php if ($this->datos[$i]['EQUIVALENTEUNIDAD'] != '0'): ?>
                            <a href="javascript:void(0)" onclick="elimina('<?php echo $this->datos[$i]['ID_PRODUCTO'] ?>','<?php echo $this->datos[$i]['ID_UNIDADMEDIDA'] ?>')" class="btn btn-danger btn-minier"><i class="icon-remove icon-white"></i> Eliminar</a>
                    <?php endif; ?>
                        </td>
                    </tr>
<?php } ?>
            </tbody>
        </table>
    </div>
    <table align="center" cellpadding="10">
        <tr>
            <td colspan="2" align="center">
                <a href="<?php echo BASE_URL ?>producto" class="btn btn-info">Aceptar</a></p>
            </td>
        </tr>
    </table>

    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body text-justify">
            <input type="hidden" id="id_p"/>
            <input type="hidden" id="id_um"/>
            Prec. Contado:<input type="text" id="pvcont" value="" class="input-small"/>
            Prec. Credito:<input type="text" id="pvcre" value="" class="input-small"/>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" id="ok">Ok</button>
        </div>
    </div>