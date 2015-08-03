$(function() {
    $("#buscar").focus();

    $("#buscar").keyup(function(event){
       buscar();
    });

    $("#btn_buscar").click(function() {
        buscar();
        $("#buscar").focus();
    });
});

function buscar() {
    $.post(url + 'movimientoproducto/buscador', 'descripcion=' + $("#buscar").val() + '&filtro=' + $("#filtro").val(), function(datos) {
        HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">' +
                '<thead>' +
                '<tr>' +
                '<th>Item</th>' +
                '<th>Producto</th>' +
                '<th>Almacen</th>' +
                '<th>Fecha</th>' +
                '<th>Tipo Movimiento</th>' +
                '<th>Motivo</th>' +
                '<th>Unid. Medid.</th>' +
                '<th>Cantidad</th>' +
                '<th>Saldo</th>' +
                '</tr>' +
                '</thead>' +
                '<tbody>';

        for (var i = 0; i < datos.length; i++) {
            HTML = HTML + '<tr>';
            HTML = HTML + '<td>' + (i + 1) + '</td>';
            HTML = HTML + '<td>' + datos[i].PPRODUCTO + '</td>';
            HTML = HTML + '<td>' + datos[i].AALMACEN + '</td>';
            HTML = HTML + '<td>' + datos[i].FECHA + '</td>';
            HTML = HTML + '<td>' + datos[i].TTIPOMOVIMIENTO + '</td>';
            HTML = HTML + '<td>' + datos[i].MMOTIVOMOVIMIENTO + '</td>';
            HTML = HTML + '<td>' + datos[i].UUNIDADMEDIDA + '</td>';
            HTML = HTML + '<td>' + datos[i].CANTIDAD + '</td>';
            HTML = HTML + '<td>' + datos[i].SALDO + '</td>';
            var editar = url + 'marca/editar/' + datos[i].ID_MARCA;
            var eliminar = url + 'marca/eliminar/' + datos[i].ID_MARCA;
            HTML = HTML + '</tr>';
        }
        HTML = HTML + '</tbody></table>'
        $("#grilla").html(HTML);
        $("#jsfoot").html('<script src="' + url + 'vista/web/js/scriptgrilla.js"></script>');
    }, 'json');
}