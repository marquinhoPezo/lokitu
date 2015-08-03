    $(function(){
        $( "#buscar" ).focus();
        
        function buscar(){
            $.post(url+'sucursal/buscador','nombre='+$("#buscar").val()+'&filtro='+$("#filtro").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered table-hover sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Item</th>'+
                                '<th>Nombre</th>'+
                                '<th>Direccion</th>'+
                                '<th>Telefono</th>'+
                                '<th>Acciones</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML = HTML + '<tr>';
                    HTML = HTML + '<td>'+(i+1)+'</td>';
                    HTML = HTML + '<td>'+datos[i].NOMBRE+'</td>';
                    HTML = HTML + '<td>'+datos[i].DIRECCION+'</td>';
                    HTML = HTML + '<td>'+datos[i].TELEFONO+'</td>';
                    var editar=url+'sucursal/editar/'+datos[i].ID_SUCURSAL; 
                    var eliminar=url+'sucursal/eliminar/'+datos[i].ID_SUCURSAL;   
                    HTML = HTML + '<td><a style="margin-right:4px" href="javascript:void(0)" onclick="editar(\''+editar+'\')" class="btn btn-success"><i class="icon-pencil icon-white"></i> Editar</a>';
                    HTML = HTML + '<a href="javascript:void(0)" onclick="eliminar(\''+eliminar+'\')" class="btn btn-danger"><i class="icon-remove icon-white"></i> Eliminar</a>';
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