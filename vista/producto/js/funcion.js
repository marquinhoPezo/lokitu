    $(function(){
        $("#buscar").focus();
        function buscar(){
            $.post(url+'producto/buscador','cadena='+$("#buscar").val()+'&filtro='+$("#filtro").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Item</th>'+
                                '<th>Producto</th>'+
                                '<th>Marca</th>'+
                                '<th>Unid. Med.</th>'+
                                '<th>Acciones</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML = HTML + '<tr>';
                    HTML = HTML + '<td>'+(i+1)+'</td>';
                    HTML = HTML + '<td>'+datos[i].DESCRIPCION+'</td>';
                    HTML = HTML + '<td>'+datos[i].MMARCA+'</td>';
                    HTML = HTML + '<td>'+datos[i].UUNIDADMEDIDA+'</td>';
                    var editar=url+'producto/editar/'+datos[i].ID_PRODUCTO; 
                    var eliminar=url+'producto/eliminar/'+datos[i].ID_PRODUCTO;   
                    HTML = HTML + '<td>';
                    if(idperfil==1){
                        HTML = HTML + '<a style="margin-right:4px" href="'+url+'producto/asignarunidades/'+datos[i].ID_PRODUCTO+'" class="btn btn-info btn-minier"><i class="icon-plus icon-white"></i> Asignar Unidades</a>';
                    }
                    HTML = HTML + '<a href="#myModal" style="margin-right:4px" role="button" data-toggle="modal" onclick="ver(\''+datos[i].ID_PRODUCTO+'\')" class="btn btn-warning btn-minier"><i class="icon-eye-open icon-white"></i> Ver</a>';
                    HTML = HTML + '<a style="margin-right:4px" href="javascript:void(0)" onclick="editar(\''+editar+'\')" class="btn btn-success btn-minier"><i class="icon-pencil icon-white"></i> Editar</a>';
                    HTML = HTML + '<a href="javascript:void(0)" onclick="eliminar(\''+eliminar+'\')"class="btn btn-danger btn-minier"><i class="icon-remove icon-white"></i> Eliminar</a>';
                    HTML = HTML + '</td>';
                    HTML = HTML + '</tr>';
                }
                HTML = HTML + '</tbody></table>'
                $("#grilla").html(HTML);
                $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
            },'json');
        }
        $("#buscar").keyup(function(event){
           buscar();
        });
        
        $("#btn_buscar").click(function(){
            buscar();
            $("#buscar").focus();
        });
        
    });
    
    function ver(id){
        titulo='',html='';
        $("#myModalLabel").html('');
        $("#bodymodal").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
           $.post(url+'producto/ver','idproducto='+id,function(datos){
                titulo += 'Datos del Producto';
                html+='<table class="table table-striped table-bordered table-hover sortable">';
                html+= '<tr>';
                html+= '<td>Nombre del Producto:</td>';
                html+= '<td>'+datos[0]['DESCRIPCION']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Precio de Compra:</td>';
                html+= '<td>'+datos[0]['PRECIOC']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Marca:</td>';
                html+= '<td>'+datos[0]['MMARCA']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Subcategoria:</td>';
                html+= '<td>'+datos[0]['SSUBCATEGORIA']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Unidad de Medida:</td>';
                html+= '<td>'+datos[0]['UUNIDADMEDIDA']+'</td>';
                html+= '</tr>';
                html+= '</table>';
                
                $("#myModalLabel").html(titulo);
                $("#bodymodal").html(html);
           },'json');
       }
