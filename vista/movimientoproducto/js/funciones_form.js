$(function() {
    $("#id_tipomovimiento").change(function(){
        $("#tr_producto").hide();
        $("#id_almacen").val(0);
        $("#id_motivomovimiento").html('<option>Cargando...</option>');
        $.post(url+'motivomovimiento/buscador','filtro=1&descripcion='+$("#id_tipomovimiento option:selected").html(),function(datos){
            $("#id_motivomovimiento").html('<option></option>');
            for(var i=0;i<datos.length;i++){
                if(datos[i].ID_MOTIVOMOVIMIENTO != 3 || datos[i].ID_MOTIVOMOVIMIENTO != 4){
                    $("#id_motivomovimiento").append('<option value="'+ datos[i].ID_MOTIVOMOVIMIENTO + '">' + datos[i].DESCRIPCION+ '</option>');
                }
            }       
        },'json');
    });
    $("#id_tipomovimiento").trigger('change');
    
    $("#tr_producto").hide();
    limpiar();
    
    $("#id_motivomovimiento").change(function(){
        $("#id_almacen").val(0);
        $("#tr_producto").hide();
        if($(this).val()==1 || $(this).val()==2){
            $("#tr_almacen").hide();
            $("#tr_almacenes").show();
        }else{
            $("#tr_almacen").show();
            $("#tr_almacenes").hide();
        }
    });
    
    $("#id_almacen").change(function(){
        $("#tr_producto").hide();
        if($(this).val()!=0){
            $("#tr_producto").show();
        }
    });
    
    $("input:text[readonly=readonly]").css('cursor', 'pointer');
    
    $("#id_almacen_origen").change(function() {validaSelAlmacenes();});
    $("#id_almacen_destino").change(function() {validaSelAlmacenes();});
    
    $("#save").click(function() {
        if ($(".row_tmp").length) {
            bootbox.confirm("¿Está seguro que desea realizar el movimiento?", function(result) {
                if (result) {
                    $("#frm").submit();
                }
            });
        } else {
            bootbox.alert("Agregue los productos al detalle");
        }
        return false;
    });
    
    $("#producto").click(function() {
        buscarProducto();
        $("#buscarProducto").focus();
        $("#VtnBuscarProducto").show();
    });
    $("#AbrirVtnBuscarProducto").click(function() {
        buscarProducto();
        $("#buscarProducto").focus();
        $("#VtnBuscarProducto").show();
    });
    
    $("#buscarProducto").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            buscarProducto();
        }
    });
    
    $("#btn_buscarProducto").click(function() {
        buscarProducto();
        $("#buscarProducto").focus();
    });
    
    $("#cantidadum").keyup(function() {
        var cantidad = $("#cantidadum").val();
        cantidad = parseInt(cantidad);
        if (isNaN(cantidad)) {
            cantidad = 0;
        }
        var cantidadub = cantidad * parseInt($("#id_unidadmedida option:selected").attr('count'));
        $("#cantidadub").val(cantidadub);
    });
    
    $("#addDetalle").click(function() {
        bval = true;
        bval = bval && $("#producto").required();
        bval = bval && $("#id_unidadmedida").required();
        bval = bval && $("#cantidadum").required();

        if (bval) {
            if ($(".id_prod[value=" + $("#id_producto").val() + "]").length) {
                bootbox.alert("Este producto ya fue agregado");
                return false;
            }
            if (parseInt($("#cantidadub").val()) > parseInt($("#stockactual").val())) {
                bootbox.alert("No hay suficiente stock");
                return false;
            }
            var html = '<tr class="row_tmp">';
            html += '<td>';
            html += '   <input type="hidden" name="id_producto[]" class="id_prod" value="' + $("#id_producto").val() + '" />' + $("#producto").val();
            html += '</td>';
            html += '<td>';
            html += '   <input type="hidden" name="id_unidadmedida[]" value="' + $("#id_unidadmedida option:selected").val() + '" />' + $("#id_unidadmedida option:selected").html();
            html += '</td>';
            html += '<td>';
            html += '   <input type="hidden" name="cantidadum[]" value="' + $("#cantidadum").val() + '" />' + $("#cantidadum").val();
            html += '   <input type="hidden" name="stockactual[]" value="' + $("#stockactual").val() + '" />';
            html += '   <input type="hidden" name="cantidadub[]" value="' + $("#cantidadub").val() + '" />';
            html += '</td>';
            html += '<td>';
            html += '   <a class="btn btn-danger delete"><i class="icon-trash icon-white"></i></a>';
            html += '</td>';
            html += '</tr>';

            $("#tblDetalle").append(html);
            limpiar();
        }
    });

    $(".delete").live('click', function() {
        var i = $(this).parent().parent().index();
        $("#tblDetalle tr:eq(" + i + ")").remove();
    });
});
function buscarProducto() {
    var id_almacen = 0;
    if($("#id_motivomovimiento").val()==1 || $("#id_motivomovimiento").val()==2){
        id_almacen = $("#id_almacen_origen").val();
    }else{
        id_almacen = $("#id_almacen").val();
    }
    $.post(url + 'producto/buscarProdxAlmacen', 'cadena=' + $("#buscarProducto").val() + '&filtro=' + $("#filtroProducto").val()
            +'&id_almacen='+id_almacen, function(datos) {
        var HTML = '<table id="tableProducto" class="table table-striped table-bordered table-hover sortable">' +
                '<thead>' +
                '<tr>' +
                '<th>Item</th>' +
                '<th>Producto</th>' +
                '<th>Unid. Med.</th>' +
                '<th>Stock</th>' +
                '<th>Acciones</th>' +
                '</tr>' +
                '</thead>' +
                '<tbody>';
        for (var i = 0; i < datos.length; i++) {
            HTML = HTML + '<tr>';
            HTML = HTML + '<td>' + (i + 1) + '</td>';
            HTML = HTML + '<td>' + datos[i].DESCRIPCION + '</td>';
            HTML = HTML + '<td>' + datos[i].UUNIDADMEDIDA + '</td>';
            HTML = HTML + '<td>' + datos[i].STOCK + '</td>';
            var idproducto = datos[i].ID_PRODUCTO;
            var descripcion = datos[i].DESCRIPCION;
            var stock = datos[i].STOCK;
            var id_unidadmedida = datos[i].ID_UNIDADMEDIDA;
            HTML = HTML + '<td><a style="margin-right:4px" href="javascript:void(0)" onclick="sel_producto(\'' + idproducto + '\',\'' + descripcion + '\',\'' + stock + '\',\'' + id_unidadmedida + '\')" class="btn btn-success"><i class="icon-ok icon-white"></i> </a>';
            HTML = HTML + '</td>';
            HTML = HTML + '</tr>';
        }
        HTML = HTML + '</tbody></table>'
        $("#grillaProducto").html(HTML);
        $("#jsfoot").html('<script src="' + url + 'vista/web/js/scriptgrilla.js"></script>');
    }, 'json');
}

function sel_producto(id_p, d, s, idub) {
    $("#cantidadum").val('');
    $("#cantidadum,#preciounitario").attr('disabled', false);
    getUnidadesProducto(id_p);
    $("#id_producto").val(id_p);
    $("#producto").val(d);
    $("#stockactual").val(s);
    $("#idub").val(idub);
    $('#modalProducto').modal('hide');
    $("#id_unidadmedida").focus();
}

function getUnidadesProducto(p_id) {
    $("#id_unidadmedida").html('<option>Cargando...</option>');
    $.post(url + 'producto/getUnidadesProducto', 'id_producto=' + p_id, function(datos) {
        var HTML = '';
        for (var i = 0; i < datos.length; i++) {
            HTML = HTML + "<option value='" + datos[i].ID_UNIDADMEDIDA + "' count='" + datos[i].CANT_UNIDAD + "'>" + datos[i].UUNIDADMEDIDA + "</option>";
        }
        $("#id_unidadmedida").html(HTML).attr('disabled', false);
    }, 'json');
}

function limpiar() {
    $("#id_tipomovimiento").val(0);
    $("#id_producto,#stockactual,#producto,#cantidadum,#cantidadub,#precioub,#preciounitario,#importe").val('');
    $("#cantidadum,#preciounitario,#id_unidadmedida").attr('disabled', true);
    $("#id_unidadmedida").html('<option value="0">Unid. Med.:</option>');
}

function validaSelAlmacenes(){
    $("#tr_producto").hide();
    $(".row_tmp").remove();
    var id_almacen_origen = $("#id_almacen_origen").val();
    var id_almacen_destino = $("#id_almacen_destino").val();
    if (id_almacen_origen != 0 && id_almacen_destino != 0) {
        if(id_almacen_origen == id_almacen_destino){
            bootbox.alert("No puede hacer movimientos al mismo almacen");
        } else {
            $("#tr_producto").show();
        }
    }
        
}