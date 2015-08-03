function cargar_php(pagina,capa){
        $('#'+capa).html("<img src='"+url+"lib/img/loading.gif' />");
        $('#'+capa).load(url+"reportegrafico/"+pagina,function(){
            $('#'+capa).show("slow");
        });
    }
