/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
    $( "#titulonot" ).focus();
    $( "#save" ).click(function(){
        bval = true;        
        bval = bval && $( "#titulonot" ).required();
        bval = bval && $( "#cuerpo" ).required();
        bval = bval && $( "#imagen" ).required();
        bval = bval && $( "#id_subcategoria" ).required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    }); 
    
    $("#id_categoria").change(function(){
        $("#id_subcategoria").html('<option></option>');
        if($(this).val()!=0){
            $("#id_subcategoria").html('<option>Cargando...</option>');
            $.post(url+'subcategoria/getSubcategoriaAjax','id_categoria='+$(this).val(),function(datos){
                $("#id_subcategoria").html('<option></option>');
                for(var i=0;i<datos.length;i++){
                    if(i!=0){
                        $("#id_subcategoria").append('<option value="'+ datos[i].ID_SUBCATEGORIA + '">' + datos[i].DESCRIPCION+ '</option>');
                    }
                }       
            },'json');
        }
    });
});
function cambiar_imagen(){
    if(confirm("¿Esta seguro que desea cambiar de imagen?")){
        titulo = "input[id=archivo]";
        html = '<input id="archivo" name="archivo" type="file" style="display: none" />';
        html += '<div class="input-append">';
        html += '<input id="imagen" class="input-large" type="text" disabled />';
        html += '<a class="btn btn-info" onclick="$(\''+titulo+'\').click();">Buscar</a></div>';
        html += '<input type="hidden" value="1" id="modificar_imagen" name="modificar_imagen" /></div>';
        $("#imagen_subida").html(html);
        script = "<script>";
        script += "$('input[id=archivo]').change(function(){";
        script += "$('#imagen').val($(this).val());})";
        script += "</script>";
        $("#script").html(script);
    }
}