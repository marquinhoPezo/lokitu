$(function() {    
    $( "#fechanac" ).datepicker({yearRange: '-65:-10',dateFormat: 'dd-mm-yy',changeMonth:true,changeYear:true,defaultDate: '1-1-1990'});
    
    $("#id_almacen").change(function(){
        limpiar();
        $("#subtotal,#total,#igv").val('0.00');
        $("#tblDetalle").html("<th>Producto</th>"+
            "<th>Unid. Med.</th>"+
            "<th>Cantidad</th>"+
            "<th>PUxUM (S/.)</th>"+
            "<th>Importe (S/.)</th>"+
            "<th>Acciones</th>");
    });
    
    $("#id_tipopago").change(function(){
        limpiar();
        $("#subtotal,#total,#igv").val('0.00');
        $("#tblDetalle").html("<th>Producto</th>"+
            "<th>Unid. Med.</th>"+
            "<th>Cantidad</th>"+
            "<th>PUxUM (S/.)</th>"+
            "<th>Importe (S/.)</th>"+
            "<th>Acciones</th>");
    });
    
    $("#tipo_cliente").change(function(){
        if($(this).val()=='NATURAL'){
            $("#frm_cliente_natural").show();
            $("#reg_clientenat").show();
            $("#frm_cliente_juridico").hide();
            $("#reg_clientejur").hide();
        }else{
            $("#frm_cliente_natural").hide();
            $("#reg_clientenat").hide();
            $("#frm_cliente_juridico").show();
            $("#reg_clientejur").show();
        }
    });
    $( "#reg_clientenat" ).click(function(){
        bval = true;        
        bval = bval && $( "#dni" ).required(); 
        bval = bval && $( "#nombre" ).required();   
        bval = bval && $( "#apellidos" ).required();
        bval = bval && $( "#direccion" ).required();
        bval = bval && $( "#email" ).required();
        bval = bval && $( "#fechanac" ).required();
        bval = bval && $( "#profesion" ).required();
        bval = bval && $( "#estado_civil" ).required();
        bval = bval && $( "#provincias" ).required();
        bval = bval && $( "#ciudades" ).required();
        if ( bval ) {
            $("#cliente").val("Cargando...");
            $.post(url+'venta/inserta_cli','nombres='+$("#nombre").val()+
                '&apellidos='+$("#apellidos").val()+'&documento='+$("#dni").val()+
                '&fecha_nacimiento='+$("#fechanac").val()+'&telefono='+$("#telefononat").val()+
                '&email='+$("#email").val()+'&estado_civil='+$("#estado_civil").val()+
                '&profesion='+$("#profesion").val()+'&ubigeo='+$("#ciudades").val()+
                '&direccion='+$("#direccion").val()+'&tipo_cliente='+$("#tipo_cliente").val(),function(datos){
                $("#id_cliente").val(datos.x_idcliente);
                $("#cliente").val($("#nombre").val()+' '+$("#apellidos").val());
                $("#nombre,#apellidos,#dni,#fechanac,#telefononat,#email,#estado_civil,#profesion,#ciudades,#direccion").val(''); 
                $("#aceptacredito").val(0);
                $("#maximocredito").val('200');
            },'json');
            $('#modalNuevoCliente').modal('hide');
        }
        return false;
    });  
    
    $( "#reg_clientejur" ).click(function(){
        bval = true;           
        bval = bval && $( "#ruc" ).required(); 
        bval = bval && $( "#razonsocial" ).required();
        bval = bval && $( "#direccionrs" ).required();
        bval = bval && $( "#provinciasjur" ).required();
        bval = bval && $( "#ciudadesjur" ).required();
        if ( bval ) {
            $("#cliente").val("Cargando...");
            $.post(url+'venta/inserta_cli','nombres='+$("#razonsocial").val()+'&documento='+$("#ruc").val()+
                '&telefono='+$("#telefonors").val()+'&email='+$("#emailrs").val()+
                '&ubigeo='+$("#ciudadesjur").val()+
                '&direccion='+$("#direccionrs").val()+'&tipo_cliente='+$("#tipo_cliente").val(),function(datos){
                $("#id_cliente").val(datos.x_idcliente);
                $("#cliente").val($("#razonsocial").val());
                $("#razonsocial,#ruc,#telefonors,#emailrs,#ciudadesjur,#direccionrs").val(''); 
                $("#aceptacredito").val(0);
                $("#maximocredito").val('200');
            },'json');
            $('#modalNuevoCliente').modal('hide');
        }
        return false;
    }); 
    $("#regiones").change(function(){
        if(!$("#regiones").val()){
            $("#provincias").html('<option>Cargando...</option>');
            $("#ciudades").html('<option>Cargando...</option>');
        }else{
            $("#provincias").html('<option>Cargando...</option>');
            $("#ciudades").html('<option>Cargando...</option>');
            $.post(url+'cliente/get_provincias','idregion='+$("#regiones").val(),function(datos){
            $("#provincias").html('<option></option>');
            $("#ciudades").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    $("#provincias").append('<option value="'+ datos[i].IDUBIGEO + '">' + datos[i].DESCRIPCION+ '</option>');
                }
            },'json');
        }
    });
    
    $("#regionesjur").change(function(){
        if(!$("#regionesjur").val()){
            $("#provinciasjur").html('<option></option>');
            $("#ciudadesjur").html('<option></option>');
        }else{
            $("#provinciasjur").html('<option>Cargando...</option>');
            $("#ciudadesjur").html('<option>Cargando...</option>');
            $.post(url+'cliente/get_provincias','idregion='+$("#regionesjur").val(),function(datos){
                $("#provinciasjur").html('<option></option>');
                $("#ciudadesjur").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    $("#provinciasjur").append('<option value="'+ datos[i].IDUBIGEO + '">' + datos[i].DESCRIPCION+ '</option>');
                }
            },'json');
        }
    });
    
    $("#provincias").change(function(){
        if(!$("#provincias").val()){
            $("#ciudades").html('<option></option>');
        }else{
            $("#ciudades").html('<option>Cargando...</option>');
            $.post(url+'cliente/get_ciudades','idprovincia='+$("#provincias").val(),function(datos){
                $("#ciudades").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    if(i!=0){
                        $("#ciudades").append('<option value="'+ datos[i].IDUBIGEO + '">' + datos[i].DESCRIPCION+ '</option>');
                    }
                }       
            },'json');
        }
    });
    
    $("#provinciasjur").change(function(){
        if(!$("#provinciasjur").val()){
            $("#ciudadesjur").html('<option></option>');
        }else{
            $("#ciudadesjur").html('<option>Cargando...</option>');
            $.post(url+'cliente/get_ciudades','idprovincia='+$("#provinciasjur").val(),function(datos){
                $("#ciudadesjur").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    if(i!=0){
                        $("#ciudadesjur").append('<option value="'+ datos[i].IDUBIGEO + '">' + datos[i].DESCRIPCION+ '</option>');
                    }
                }       
            },'json');
        }
    });
    
    //valida existencia de cliente
    $("#dni").blur(function(){
        if($(this).val()!='' && $(this).val().length==8){
            $.post(url+'cliente/buscador','cadena='+$("#dni").val()+'&filtro=2',function(datos){

                if(datos.length>0){
                    if(confirm('Ya existe un cliente con este Nro de DNI...\nDesea editar sus datos?')){
                        window.location = url+'cliente/editar/'+datos[0].IDCLIENTE
                    }else{
                        $('#modalNuevoCliente').modal('hide');
                    }
                }   
            },'json');
        }
    });
    
    $("#ruc").blur(function(){
        if($(this).val()!='' && $(this).val().length==11){
            $.post(url+'cliente/buscador','cadena='+$("#ruc").val()+'&filtro=2',function(datos){

                if(datos.length>0){
                    if(confirm('Ya existe un cliente con este Nro de RUC...\nDesea editar sus datos?')){
                        window.location = url+'cliente/editar/'+datos[0].IDCLIENTE
                    }else{
                        $('#modalNuevoCliente').modal('hide');
                    }
                }   
            },'json');
        }
    });
    $("#id_tipopago").change(function(){
        if($(this).val()==2){
            $("#celda_credito").show();
        }else{
            $("#celda_credito").hide();
        }
    });
    $("#id_tipocomprobante").focus();
    $("#id_tipocomprobante").change(function(){
        $.post(url+'venta/getCorrelativo','id_tipocomprobante='+$("#id_tipocomprobante").val(),function(datos){
            $("#nrodoc").val(datos);
        });
    });
    $("#subtotal,#total,#igv").val('0.00');
    $("#chbx_igv").click(function(){
        if($("#chbx_igv").is(':checked')){
            $.post(url+'param/getParam','id_param=IGV',function(datos){
                $("#igv").val(datos[0].VALOR);
                setTotal(0, 1);
            },'json');
        }else{
            $("#igv").val('0.00');
        }
        setTotal(0, 1);
    });
    $("input:text[readonly=readonly]").css('cursor','pointer');
    limpiar();
    $("#fechaventa, #fecha_vencimiento").datepicker({dateFormat:'yy-mm-dd',changeMonth:true,changeYear:true});
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#cliente").required();
        bval = bval && $("#id_tipocomprobante").required();
        bval = bval && $("#id_almacen").required();
        bval = bval && $("#id_tipopago").required();
        if(bval && $("#id_tipopago").val()==2){
            bval = bval && $("#fecha_vencimiento").required();
            bval = bval && $("#intervalo_dias").required();
            var aceptacredito = $("#aceptacredito").val();
            if(bval && aceptacredito == '1'){
                var total = parseFloat($("#total").val());
                var maximocredito = parseFloat($("#maximocredito").val());
                if(bval && total > maximocredito){
                    bootbox.alert("No puede otorgarle un crédito mayor de S/. "+maximocredito);
                    bval = false;
                }
            } else{
                bootbox.alert("Límite de crédito superado");
                bval = false;
            }
        }
        if (bval) {
            if( $(".row_tmp").length ) {
                bootbox.confirm("¿Está seguro que desea guardar la venta?", function(result) {
                    if(result){
                        $("#frm").submit();
                    }
                });
            }else{
                bootbox.alert("Agregue los productos al detalle");
            }
        }
        return false;
    });
    $("#selectProducto").click(function(){
        buscarProducto();
        $("#buscarProducto").focus();
        $("#VtnBuscarProducto").show();
    });
    $("#producto").click(function(){
        buscarProducto();
        $("#buscarProducto").focus();
        $("#VtnBuscarProducto").show();
        $("#buscarProducto").focus();
    });
    $("#AbrirVtnBuscarProducto").click(function(){
        buscarProducto();
        $("#buscarProducto").focus();
        $("#VtnBuscarProducto").show();
        $("#buscarProducto").focus();
    });
    $("#cliente").click(function(){
        buscarCliente();
        $("#buscarCliente").focus();
        $("#VtnBuscarCliente").show();
        $("#buscarCliente").focus();
    });
    $("#AbrirVtnBuscarCliente").click(function(){
        buscarCliente();
        $("#buscarCliente").focus();
        $("#VtnBuscarCliente").show();
        $("#buscarCliente").focus();
    });
    
    $("#buscarProducto").keypress(function(event){
        if(event.which == 13){
            event.preventDefault();
            buscarProducto();
        } 
    });
        
    $("#btn_buscarProducto").click(function(){
        buscarProducto();
        $("#buscarProducto").focus();
    });
    
    $("#buscarCliente").keypress(function(event){
        if(event.which == 13){
            event.preventDefault();
            buscarCliente();
        } 
    });
        
    $("#btn_buscarCliente").click(function(){
        buscarCliente();
        $("#buscarCliente").focus();
    });
    
    $("#cantidadum").keyup(function(){
        setImporte();
    });
    $("#id_unidadmedida").change(function(){
            $("#preciounitario").val('cargando...');
            $("#addDetalle").attr('disabled',true);
            $.post(url+"producto/getUnidadMedida",{
                codigo : $("#id_producto").val(),
                id_unidadmedida : $("#id_unidadmedida").val()
            },function(response){
                $("#preciounitario").val(response[0].PRECIOV);
                $("#addDetalle").attr('disabled',false);
                setImporte();
            },'json');
        //        setImporte();
        //        var precioub = parseFloat($("#precioub").val());
        //        var cantidadub = parseInt($("#id_unidadmedida option:selected").attr('count'));
        //        var preciounitario = cantidadub * precioub;
        //        preciounitario=Math.round(preciounitario*100)/100 
        //        $("#preciounitario").val(preciounitario.toFixed(2));
    });
    $("#preciounitario").keyup(function(){
        setImporte();
        var preciounitario = $("#preciounitario").val();
        preciounitario = parseFloat(preciounitario);
        if (isNaN(preciounitario)) {
            preciounitario = 0;
        }
        var cantidadub = $("#id_unidadmedida option:selected").attr('count');
        cantidadub = parseInt(cantidadub);
        if (isNaN(cantidadub)) {
            cantidadub = 0;
        }
        var precioub = preciounitario / cantidadub;
        $("#precioub").val(precioub.toFixed(6));
    });
    $("#preciounitario").blur(function(){
        var preciounitario = parseFloat($(this).val());
        if (isNaN(preciounitario)) {
            preciounitario = 0;
        }
        $(this).val(preciounitario.toFixed(2));
    });
    
    $("#addDetalle").click(function(){
        bval = true;   
        bval = bval && $("#producto").required();
        bval = bval && $("#id_unidadmedida").required();
        bval = bval && $("#cantidadum").required();
        bval = bval && $("#preciounitario").required();
        
        if (bval) {
            if( $(".id_prod[value="+$("#id_producto").val()+"]").length ) {
                bootbox.alert("Este producto ya fue agregado");
                return false;
            }
            if(parseInt($("#cantidadub").val())>parseInt($("#stockactual").val())){
                bootbox.alert("No hay suficiente stock");
                return false;
            }
            var html = '<tr class="row_tmp">';
            html += '<td>';
            html += '   <input type="hidden" name="id_producto[]" class="id_prod" value="' + $("#id_producto").val() + '" />'+$("#producto").val();
            html += '</td>';
            html += '<td>';
            html += '   <input type="hidden" name="id_unidadmedida[]" value="' + $("#id_unidadmedida option:selected").val() + '" />'+$("#id_unidadmedida option:selected").html();
            html += '</td>';
            html += '<td>';
            html += '   <input type="hidden" name="cantidadum[]" value="' + $("#cantidadum").val() + '" />'+$("#cantidadum").val();
            html += '   <input type="hidden" name="stockactual[]" value="' + $("#stockactual").val() + '" />';
            html += '   <input type="hidden" name="cantidadub[]" value="' + $("#cantidadub").val() + '" />';
            html += '</td>';
            html += '<td>';
            html += '   <input type="hidden" name="precioub[]" value="' + $("#precioub").val() + '" />';
            html += '   <input type="hidden" name="preciounitario[]" value="' + $("#preciounitario").val() + '" />'+$("#preciounitario").val();
            html += '</td>';
            html += '<td>';
            html += '   <input type="hidden" name="importe[]" class="importe" value="' + $("#importe").val() + '" />'+$("#importe").val();
            html += '</td>';
            html += '<td>';
            html += '   <a class="btn btn-danger delete"><i class="icon-trash icon-white"></i></a>';
            html += '</td>';
            html += '</tr>';

            $("#tblDetalle").append(html);
            setTotal($("#importe").val(),1);
            limpiar();
        }
    });
    
    $(".delete").live('click',function(){
        var i = $(this).parent().parent().index();
        var importe = $("#tblDetalle tr:eq("+i+") td .importe").val();
        $("#tblDetalle tr:eq("+i+")").remove();
        setTotal(importe,0);
    });
});

function setImporte(){
    var cantidad = $("#cantidadum").val();
    cantidad = parseInt(cantidad);
    if (isNaN(cantidad)) {
        cantidad = 0;
    }
    var cantidadub = cantidad * parseInt($("#id_unidadmedida option:selected").attr('count'));
    $("#cantidadub").val(cantidadub);
    var precio = $("#preciounitario").val();
    precio = parseFloat(precio);
    if (isNaN(precio)) {
        precio = 0;
    }
    var importe;
    importe = cantidad * precio;
    $("#importe").val(importe.toFixed(2));
}

function setTotal(importe,aumenta){
    var subtotal = $("#subtotal").val();
    subtotal = parseFloat(subtotal);
    if (isNaN(subtotal)) {
        subtotal = 0;
    }
    var igv = $("#igv").val();
    igv = parseFloat(igv);
    if (isNaN(igv)) {
        igv = 0;
    }
    if(aumenta){
        subtotal = subtotal + parseFloat(importe);
    }else{
        subtotal = subtotal - parseFloat(importe);
    }
    $("#subtotal").val(subtotal.toFixed(2));
    var total = subtotal + subtotal * igv;
    $("#total").val(total.toFixed(2));
}
function buscarProducto(){
    var bval = true;
    bval = bval && $("#id_almacen").required();
    bval = bval && $("#id_tipopago").required();
    if (bval) {
        $("#modalProducto").modal('show');
        $.post(url+'venta/buscarProdxAlmacen','cadena='+$("#buscarProducto").val()+'&filtro='+$("#filtroProducto").val()+'&id_almacen='+$("#id_almacen").val(),function(datos){
            HTML = '<table id="tableProducto" class="table table-striped table-bordered table-hover sortable">'+
            '<thead>'+
            '<tr>'+
            '<th>Item</th>'+
            '<th>Producto</th>'+
            '<th>Marca</th>'+
            '<th>Precio V.</th>'+
            '<th>Unid. Med.</th>'+
            '<th>Stock</th>'+
            '<th>Acciones</th>'+
            '</tr>'+
            '</thead>'+
            '<tbody>';

            for(var i=0;i<datos.length;i++){
                var idproducto = datos[i].ID_PRODUCTO;
                var descripcion = datos[i].DESCRIPCION;
                var stockminimo = datos[i].STOCKMINIMO;
                var preciov = datos[i].PRECIOVCONT;
                if($("#id_tipopago").val()==2){
                    preciov = datos[i].PRECIOVCRE;
                }
                var id_unidadmedida = datos[i].ID_UNIDADMEDIDA;
                var stock = datos[i].STOCK;
                HTML = HTML + '<tr>';
                HTML = HTML + '<td>'+(i+1)+'</td>';
                HTML = HTML + '<td>'+descripcion+'</td>';
                HTML = HTML + '<td>'+datos[i].MMARCA+'</td>';
                HTML = HTML + '<td>'+preciov+'</td>';
                HTML = HTML + '<td>'+datos[i].UUNIDADMEDIDA+'</td>';
                HTML = HTML + '<td>'+stock+'</td>';
                HTML = HTML + '<td><a style="margin-right:4px" href="javascript:void(0)" onclick="sel_producto(\''+idproducto+'\',\''+descripcion+'\',\''+stock+'\',\''+preciov+'\',\''+stockminimo+'\',\''+id_unidadmedida+'\')" class="btn btn-success btn-minier"><i class="icon-ok icon-white"></i> </a>';
                HTML = HTML + '</td>';
                HTML = HTML + '</tr>';
            }
            HTML = HTML + '</tbody></table>'
            $("#grillaProducto").html(HTML);
            $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
        },'json');
    }
}

function buscarCliente(){
    $.post(url+'cliente/buscador','cadena='+$("#buscarCliente").val()+'&filtro='+$("#filtroCliente").val(),function(datos){
        HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
        '<thead>'+
        '<tr>'+
        '<th>Item</th>'+
        '<th>Tipo</th>'+
        '<th>Nombre y Apellidos / Razon Social</th>'+
        '<th>DNI / RUC</th>'+
        '<th>Direccion</th>'+
        '<th>Acciones</th>'+
        '</tr>'+
        '</thead>'+
        '<tbody>';

        for(var i=0;i<datos.length;i++){
            var cliente = $.trim(datos[i].NOMBRES);
            if(datos[i].APELLIDOS!=null){
                cliente += ' '+datos[i].APELLIDOS;
            }
            HTML = HTML + '<tr>';
            HTML = HTML + '<td>'+(i+1)+'</td>';
            HTML = HTML + '<td>'+datos[i].TIPO+'</td>';
            HTML = HTML + '<td>'+cliente+'</td>';
            HTML = HTML + '<td>'+datos[i].DOCUMENTO+'</td>';
            HTML = HTML + '<td>'+datos[i].DIRECCION+'</td>';
            var idcliente = datos[i].IDCLIENTE;
            var maximocredito = datos[i].MAXIMOCREDITO;
            HTML = HTML + '<td><a style="margin-right:4px" href="javascript:void(0)" onclick="sel_cliente(\''+idcliente+'\',\''+cliente+'\',\''+maximocredito+'\')" class="btn btn-success btn-minier"><i class="icon-ok icon-white"></i> </a>';
            HTML = HTML + '</td>';
            HTML = HTML + '</tr>';
        }
        HTML = HTML + '</tbody></table>'
        $("#grillaCliente").html(HTML);
        $("#jsfootCliente").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
    },'json');
}

function sel_producto(id_p,d,s,pc,sm,idub){
    $("#cantidadum").val('');
    $("#cantidadum,#preciounitario").attr('disabled',false);
    getUnidadesProducto(id_p);
    $("#id_producto").val(id_p);
    $("#producto").val(d);
    $("#stockactual").val(s);
    $("#precioub").val(pc);
    $("#stockminimo").val(sm);
    $("#idub").val(idub);
    $("#preciounitario").val(parseFloat(pc).toFixed(2));
    $('#modalProducto').modal('hide');
    $("#id_unidadmedida").focus();
}

function sel_cliente(id_p,d, maximocredito){
    $.post(url+'cliente/getCreditoCliente','idcliente='+id_p,function(datos){
        if(datos.estadopago==2){
            $("#aceptacredito").val(1);
        }else{
            $("#aceptacredito").val(0);
        }
    },'json');
    $("#id_cliente").val(id_p);
    $("#cliente").val(d);
    $("#maximocredito").val(maximocredito);
    $('#modalCliente').modal('hide');
    $("#id_tipopago").focus();
}

function getUnidadesProducto(p_id){
    $("#id_unidadmedida").html('<option>Cargando...</option>');
    $.post(url+'producto/getUnidadesProducto','id_producto='+p_id,function(datos){
        var HTML='';
        for(var i=0;i<datos.length;i++){
            HTML = HTML + "<option value='"+datos[i].ID_UNIDADMEDIDA+"' count='"+datos[i].CANT_UNIDAD+"'>"+datos[i].UUNIDADMEDIDA+"</option>";
        }
        $("#id_unidadmedida").html(HTML).attr('disabled',false);
    },'json');
}

function limpiar(){
    $("#id_producto,#stockactual,#producto,#cantidadum,#cantidadub,#precioub,#preciounitario,#importe").val('');
    $("#cantidadum,#preciounitario,#id_unidadmedida").attr('disabled',true);
    $("#id_unidadmedida").html('<option value="0">Unid. Med.:</option>');
}

function seleccionaDias(fecha_final) {
    var dias = getDias($(fecha_final).val(),$("#fecha_inicial").val());
    if (dias <= 0) {
        bootbox.alert("Escoja una fecha valida");
        $("#fecha_vencimiento").val('');
    }
}