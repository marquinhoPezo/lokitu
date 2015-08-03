<script src="<?php echo $_params['ruta_js']; ?>bootbox.min.js"></script>
<div class="navbar-inner">
    <form method="post" action="<?php if (isset($this->action)) echo $this->action ?>" id="frm">
        <input type="hidden" name="guardar" id="guardar" value="1"/>
        <input type="hidden" readonly="readonly" name="codigo" id="codigo"
               value="<?php if (isset($this->datos[0]['ID_MARCA'])) echo $this->datos[0]['ID_MARCA'] ?>"/>
        <table align="center" cellpadding="10" >
            <tr>
                <td>
                    Tipo Movimiento:
                    <select name="id_tipomovimiento" id="id_tipomovimiento">
                        <?php for($i=0;$i<count($this->datos_tipomovimiento);$i++){ ?>
                            <?php if( $this->datos[0]['ID_TIPOMOVIMIENTO'] == $this->datos_tipomovimiento[$i]['ID_TIPOMOVIMIENTO'] ){ ?>
                        <option value="<?php echo $this->datos_tipomovimiento[$i]['ID_TIPOMOVIMIENTO'] ?>" selected="selected"><?php echo utf8_encode($this->datos_tipomovimiento[$i]['DESCRIPCION']) ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_tipomovimiento[$i]['ID_TIPOMOVIMIENTO'] ?>"><?php echo utf8_encode($this->datos_tipomovimiento[$i]['DESCRIPCION']) ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>
                </td>
                <td>
                    Motivo Movimiento:
                    <select name="id_motivomovimiento" id="id_motivomovimiento">
                        <option value="0"></option>
                        <?php for($i=0;$i<count($this->datos_motivomovimiento);$i++){ ?>
                            <?php if($this->datos_motivomovimiento[$i]['ID_MOTIVOMOVIMIENTO'] != 3) {?>
                            <?php if( $this->datos[0]['ID_MOTIVOMOVIMIENTO'] == $this->datos_motivomovimiento[$i]['ID_MOTIVOMOVIMIENTO'] ){ ?>
                        <option value="<?php echo $this->datos_motivomovimiento[$i]['ID_MOTIVOMOVIMIENTO'] ?>" selected="selected"><?php echo utf8_encode($this->datos_motivomovimiento[$i]['DESCRIPCION']) ?></option>
                            <?php } else { ?>
                        <option value="<?php echo $this->datos_motivomovimiento[$i]['ID_MOTIVOMOVIMIENTO'] ?>"><?php echo utf8_encode($this->datos_motivomovimiento[$i]['DESCRIPCION']) ?></option>
                            <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </select>
                </td>
            </tr>
            <tr id="tr_almacen">
                <td>
                    Almacen:
                    <select name="id_almacen" id="id_almacen">
                        <option value="0"></option>
                        <?php for($i=0;$i<count($this->datos_almacenes);$i++){ ?>
                        <option value="<?php echo $this->datos_almacenes[$i]['ID_ALMACEN'] ?>"><?php echo utf8_encode($this->datos_almacenes[$i]['DESCRIPCION']) ?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
            <tr id="tr_almacenes" style="display: none">
                <td>
                    Almacen Origen:
                    <select name="id_almacen_origen" id="id_almacen_origen">
                        <option value="0"></option>
                        <?php for($i=0;$i<count($this->datos_almacenes);$i++){ ?>
                        <option value="<?php echo $this->datos_almacenes[$i]['ID_ALMACEN'] ?>"><?php echo utf8_encode($this->datos_almacenes[$i]['DESCRIPCION']) ?></option>
                        <?php } ?>
                    </select>
                </td>
                <td>
                    Almacen Destino:
                    <select name="id_almacen_destino" id="id_almacen_destino">
                        <option value="0"></option>
                        <?php for($i=0;$i<count($this->datos_almacenes);$i++){ ?>
                        <option value="<?php echo $this->datos_almacenes[$i]['ID_ALMACEN'] ?>"><?php echo utf8_encode($this->datos_almacenes[$i]['DESCRIPCION']) ?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
            <tr style="border-top: solid 1px #999" id="tr_producto">
                <td colspan="2">
                    Producto:
                    <input type="hidden" id="id_producto"/>
                    <input type="hidden" id="stockactual"/>
                    <input type="hidden" id="puntoventa"/>
                    <input type="text" id="producto" readonly="readonly" placeholder="Seleccione Producto" data-toggle="modal" data-target="#modalProducto"/>
                    <button type="button" data-toggle="modal" data-target="#modalProducto" style="margin-top: -10px" class="btn btn-primary" title="Buscar Producto" id="AbrirVtnBuscarProducto"><i class="icon-search icon-white"></i></button>
                    <select id="id_unidadmedida" class="input-medium">
                        <option value="0">Unid. Med.:</option>
                    </select>
                    <input type="text" name="cantidadum" id="cantidadum" placeholder="Cantidad" class="input-small"/>
                    <input type="hidden" name="cantidadub" id="cantidadub" placeholder="Cantidad UB"/>
                    <button style="margin-top: -10px" type="button" class="btn btn-primary" title="Agregar al Detalle" id="addDetalle"><i class="icon-hand-down icon-white"></i></button>
                </td>
            </tr>
        </table>
        <table class="table table-striped table-bordered table-hover table-condensed" id="tblDetalle">
            <th>Producto</th>
            <th>Unid. Med.</th>
            <th>Cantidad</th>
            <th></th>   
        </table>
    </form>
    <div class="row-fluid">
        <div class="span12 text-center">
            <p>
                <button type="button" class="btn btn-primary" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>movimientoproducto" class="btn btn-info">Cancelar</a>
            </p>
        </div>
    </div>

    <div id="modalProducto" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Lista de Productos</h3>
        </div>
        <div class="modal-body">
            <form id="VtnBuscarProducto">
                <div class="navbar-inner text-center">
                    <p>
                        <select class="list" id="filtroProducto">
                            <option value="0">Descripcion</option>
                            <option value="1">Marca</option>
                        </select>
                        <input type="text" class="input-xlarge" id="buscarProducto">
                        <button type="button" class="btn btn-primary" id="btn_buscarProducto"><i class="icon-search icon-white"></i></button>
                    </p>
                    <div id="grillaProducto">
                        <div class="page-header">
                            <img src="<?php echo BASE_URL ?>lib/img/loading.gif" />
                        </div>
                    </div>
                    <div id="controls">
                        <div id="perpage">
                            <select onchange="sorter.size(this.value)">
                                <option value="5">5</option>
                                <option value="10" selected="selected">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                            <span>Entradas por Página</span>
                        </div>
                        <div id="navigation">
                            <img src="<?php echo BASE_URL ?>lib/img/first.gif" width="16" height="16" alt="Primera Página" onclick="sorter.move(-1, true)" />
                            <img src="<?php echo BASE_URL ?>lib/img/previous.gif" width="16" height="16" alt="Página Anterior" onclick="sorter.move(-1)" />
                            <img src="<?php echo BASE_URL ?>lib/img/next.gif" width="16" height="16" alt="Página Siguiente" onclick="sorter.move(1)" />
                            <img src="<?php echo BASE_URL ?>lib/img/last.gif" width="16" height="16" alt="Última Página" onclick="sorter.move(1, true)" />
                        </div>
                        <div id="text">Página <span id="currentpage"></span> de <span id="pagelimit"></span></div>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
        </div>
    </div>
    <!-- Modal -->
    <style>
        #modalProducto{
            width: 800px;
            left: 38%;
        }
    </style>