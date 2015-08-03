<?php if (isset($this->datos) && count($this->datos)) { ?>
<div class="navbar-inner text-center">
    <p>
        <select class="list" id="filtro">
            <option value="0">Producto</option>
        </select>
        <input type="text" class="input-xlarge" id="buscar">
        <button type="button" class="btn btn-primary" id="btn_buscar"><i class="icon-search icon-white"></i></button>
        <a href="<?php echo BASE_URL?>movimientoproducto/nuevo" class="btn btn-primary">Nuevo</a>
    </p>
    <div id="grilla">
    <table id="table" class="table table-striped table-bordered table-hover sortable">
        <thead>
        <tr>
            <th>Item</th>
            <th>Producto</th>
            <th>Almacen</th>
            <th>Fecha</th>
            <th>Tipo Movimiento</th>
            <th>Motivo</th>
            <th>Unid. Medid.</th>
            <th>Cantidad</th>
            <th>Saldo</th>
            <!--<th>Acciones</th>-->
        </tr>
        </thead>
        <tbody>
        <?php for ($i = 0; $i < count($this->datos); $i++) { ?>
            <tr>
                <td><?php echo $i+1 ?></td>
                <td><?php echo $this->datos[$i]['PPRODUCTO'] ?></td>
                <td><?php echo $this->datos[$i]['AALMACEN'] ?></td>
                <td><?php echo $this->datos[$i]['FECHA'] ?></td>
                <td><?php echo $this->datos[$i]['TTIPOMOVIMIENTO'] ?></td>
                <td><?php echo $this->datos[$i]['MMOTIVOMOVIMIENTO'] ?></td>
                <td><?php echo $this->datos[$i]['UUNIDADMEDIDA'] ?></td>
                <td><?php echo $this->datos[$i]['CANTIDAD'] ?></td>
                <td><?php echo $this->datos[$i]['SALDO'] ?></td>
                <!--<td>-->
                    <!--<a href="javascript:void(0)" onclick="eliminar('<?php //echo BASE_URL?>movimientoproducto/eliminar/<?php //echo $this->datos[$i]['ID_MARCA'] ?>')" class="btn btn-danger"><i class="icon-remove icon-white"></i> Eliminar</a>-->
                <!--</td>-->
            </tr>
        <?php } ?>
        </tbody>
    </table>
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
			<img src="<?php echo BASE_URL ?>lib/img/first.gif" width="16" height="16" alt="Primera Página" onclick="sorter.move(-1,true)" />
			<img src="<?php echo BASE_URL ?>lib/img/previous.gif" width="16" height="16" alt="Página Anterior" onclick="sorter.move(-1)" />
			<img src="<?php echo BASE_URL ?>lib/img/next.gif" width="16" height="16" alt="Página Siguiente" onclick="sorter.move(1)" />
			<img src="<?php echo BASE_URL ?>lib/img/last.gif" width="16" height="16" alt="Última Página" onclick="sorter.move(1,true)" />
		</div>
		<div id="text">Página <span id="currentpage"></span> de <span id="pagelimit"></span></div>
	</div>

    <?php } else { ?>
<div class="navbar-inner text-center" style="padding: 1em;">
        <p>No hay movimientoproducto</p>
        <a href="<?php echo BASE_URL?>movimientoproducto/nuevo" class="btn btn-primary">Nuevo</a>
    <?php } ?>