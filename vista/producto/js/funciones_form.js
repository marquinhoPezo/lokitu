$(function() {    
    $("#id_categoria").change(function(){
        $("#id_subcategoria").html('<option></option>');
        if($(this).val()!=0){
            $("#id_subcategoria").html('<option>Cargando...</option>');
            $.post(url+'subcategoria/getSubcategoriaAjax','id_categoria='+$(this).val(),function(datos){
                $("#id_subcategoria").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    $("#id_subcategoria").append('<option value="'+ datos[i].ID_SUBCATEGORIA + '">' + datos[i].DESCRIPCION+ '</option>');
                }       
            },'json');
        }
    });
    
    $( "#nombre" ).focus(); 
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#id_categoria").required();
        bval = bval && $("#id_subcategoria").required();
        bval = bval && $("#descripcion").required();
        bval = bval && $("#id_unidadmedida").required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    });
});