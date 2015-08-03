$(function() {    
    $( "#id_sucursal" ).focus(); 
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#nombre").required();
        bval = bval && $("#direccion").required();
        bval = bval && $("#telefono").required();
        bval = bval && $("#ciudad").required();
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    });
});