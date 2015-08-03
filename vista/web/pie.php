</section>
<!-- Footer
  ================================================== -->
<section id="footerSection">
<div class="container-fluid">
    <footer class="footer well well-small">
	<div class="row-fluid">
	
            <div class="span2"></div>
	
	<div class="span4">
			<h4>Visitanos</h4>
                        <address style="margin: 0">
				Jr. Antonio Raymondi #285<br>
				Tarapoto - San Martin
			</address>
        </div>
	<div class="span4">
            <br/>
			Telefono: <i class="icon-phone-sign"></i> &nbsp; 964 584817 <br>
			Email: <a href="contactenos.php" title="contact"><i class="icon-envelope-alt"></i> info@agrovet.com</a>
        </div>
            <div class="span2"></div>
    </div>
	</footer>
    </div><!-- /container -->
</section>
</div>
<!-- Modal -->
<div class="modal fade hide" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">
		Inicio de Sesion
		</h4>
      </div>
      <div class="modal-body">
            <form action="<?php echo BASE_URL?>login" method="post" id="mc-form">
		<div class="row-fluid">
		<div class="span6">
		<img src="<?php echo BASE_URL ?>lib/themes/images/logo.jpg" width="200"/></div>
		<div class="span6" style="padding-top: 30px">
		<div class="form-group">
			<label for="usuario">Usuario</label>
			<input class="form-control" class="field" type="text" name="usuario" id="usuario" placeholder="Ingrese usuario...">
		  </div>
		  <div class="form-group">
			<label for="clave">Clave</label>
			<input class="form-control" type="password" name="clave" id="clave" placeholder="Ingrese clave...">
		  </div>
		  <div class="form-group">
                        <label><img src="<?php echo BASE_URL ?>vista/web/captcha.php" width="100" height="30"></label>
			<input name="tmptxt" type="text"><br>
                        <input name="action" type="hidden" value="checkdata">
		  </div>
		  <button type="submit" class="btn btn-success">Ingresar</button>
		  <button type="reset" onclick="$('#usuario').focus()" class="btn">Limpiar</button>
		  </div>
		</div>
		  
            </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
    <div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel2"></h3>
        </div>
        <div class="modal-body text-justify">
            <div id="bodymodal2">
                <div class="text-center">
                    <img src="<?php echo BASE_URL ?>lib/img/loading.gif" />
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Ok</button>
        </div>
    </div>
<a href="#" class="btn" style="position: fixed; bottom: 38px; right: 10px; display: none; " id="toTop"> <i class="icon-arrow-up"></i> Ir arriba</a>
<!-- Javascript
    ================================================== -->
<script>
$(function(){
    function producto(id){
            $("#myModalLabel2").html('');
            $("#bodymodal2").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
            html='';titulo='';
           $.post(url+'web/verp','id='+id,function(datos){
                titulo = datos[0].TITULO;
                imagen = datos[0].IMAGEN;
                html += "<br><br><div class='text-center'><img src='"+url+"lib/img/productos/"+imagen.toLowerCase()+"' /></div>";
                rep = datos[0].CUERPO.replace(/\s*[\r\n][\r\n \t]*/g, "<br><br>");
                html += '<br><br><article>'+rep+'</article>';
                $("#myModalLabel2").html(titulo);
                $("#bodymodal2").html(html);
           },'json');
       }
    $(".buscar_producto").keypress(function(event){
       if(event.which == 13){
            var producto = $(this).val();
            if(producto == ''){
                alert("Debe ingresar el nombre del producto");
            }else{
                $("#pageTitle").html('Productos');
                $("#div_carousel,#myMap").hide();
                $("#bodySection").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
                $.post(url+'web/buscador','producto='+producto,function(datos){                    
                    cont = 0;
                    cont2 = 0;
                    html = '';
                    if(datos.length > 0){
                        for(var i=0; i<datos.length; i++){
                            if(cont == 0){
                                html += '<div class="row-fluid">';
                            }
                            html += '<div class="span3">'+
                                '<br/>'+
                                '<div class="imagen_p"><img src="'+url+'lib/img/productos/'+datos[i].IMAGEN+'" /></div>'+
                                '<div class="titulo_p">'+datos[i].TITULO+'</div>'+
                                '<a href="#myModal2" role="button" data-toggle="modal" onclick="producto(\''+datos[i].ID+'\')" class="btn btn-default btn-block">'+
                                    'Mas Detalles'+
                                '</a>'+
                                '<br/>'+
                            '</div>';
                            cont++;
                            cont2++;
                            if(cont == 4 || cont2 == (datos.length)){
                                html += '</div>';
                                cont = 0;
                            }
                        }
                    }else{
                        html += '<h4>No hay productos con esta descripcion</h4>';
                    }
                    $("#bodySection").html(html);
                },'json');
            }
       } 
    });
});
</script>
	<script src="<?php echo BASE_URL ?>lib/js/bootstrap.min.js"></script>
	<script src="<?php echo BASE_URL ?>lib/themes/js/bootstrap-tooltip.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/bootstrap-popover.js"></script>
	<script src="<?php echo BASE_URL ?>lib/themes/js/business_ltd_1.0.js"></script>
        
</body>
</html>