$(function() {    
    $( "#descripcion" ).focus();   
    $( "#save" ).click(function(){
        bval = true;   
        bval = bval && $("#descripcion").required();
        bval = bval && $("#id_sucursal").required();
        bval = bval && $("#ubicacion").required();
        
        if (bval) 
        {
            $("#frm").submit();
        }
        return false;
    }); 
});