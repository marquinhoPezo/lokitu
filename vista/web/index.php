<!--Header Ends================================================ -->

    <script type="text/javascript">
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
       function marca(id){
            $("#myModalLabel2").html('');
            $("#bodymodal2").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
            html='';titulo='';
           $.post(url+'web/verm','id='+id,function(datos){
                titulo = datos[0].TITULO;
                imagen = datos[0].IMAGEN;
                html += "<br><br><div class='text-center'><img src='"+url+"lib/img/marcas/"+imagen.toLowerCase()+"' /></div>";
                rep = datos[0].CUERPO.replace(/\s*[\r\n][\r\n \t]*/g, "<br><br>");
                html += '<br><br><article>'+rep+'</article>';
                $("#myModalLabel2").html(titulo);
                $("#bodymodal2").html(html);
           },'json');
       }
    </script>
<link rel="stylesheet" href="<?php echo BASE_URL ?>lib/css/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php echo BASE_URL ?>lib/css/nivo-slider.css" type="text/css" media="screen" />

<section id="carouselSection" style="margin: 0 auto;">
    <div><h1 id="pageTitle"></h1></div>
    <div id="div_carousel" style="width: 70%; margin: 0 auto; padding-top: 1%;">
    <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="<?php echo BASE_URL ?>lib/themes/images/carousel/1.jpg" data-thumb="<?php echo BASE_URL ?>lib/themes/images/carousel/1.jpg" alt="" title="<h1>Agricola de la Selva</h1>" />
                <img src="<?php echo BASE_URL ?>lib/themes/images/carousel/2.jpg" data-thumb="<?php echo BASE_URL ?>lib/themes/images/carousel/2.jpg" alt="" title="Agricola de la Selva" />
                <img src="<?php echo BASE_URL ?>lib/themes/images/carousel/3.jpg" data-thumb="<?php echo BASE_URL ?>lib/themes/images/carousel/3.jpg" alt="" title="Agricola de la Selva" />
                <img src="<?php echo BASE_URL ?>lib/themes/images/carousel/4.jpg" data-thumb="<?php echo BASE_URL ?>lib/themes/images/carousel/4.jpg" alt="" title="Agricola de la Selva" />
                <img src="<?php echo BASE_URL ?>lib/themes/images/carousel/5.jpg" data-thumb="<?php echo BASE_URL ?>lib/themes/images/carousel/5.jpg" alt="" title="Agricola de la Selva" />
                <img src="<?php echo BASE_URL ?>lib/themes/images/carousel/6.jpg" data-thumb="<?php echo BASE_URL ?>lib/themes/images/carousel/6.jpg" alt="" title="Agricola de la Selva" />
            </div>
        </div>
    </div>

</section>
<br/>
<section id="bodySection">
<h3 class="title"><span>Nuestros Productos Más Vendidos</span></h3>
<div id="myCarouselOne" class="carousel slide">
	<!-- Dot Indicators -->
	<div class="carousel-inner">
	
                <?php if (isset($this->datos) && count($this->datos)) { 
                    $cont = 0; $item = 0; $val = 0;
                    for ($i = 0; $i < count($this->datos); $i++) {
                        if($this->datos[$i]['TIPO'] == 1){
                            $val++;
                        }
                    }
                    $val = (int)($val/4); 
                    $val = $val*4;
                    $cont_final = 0;
                    for ($i = 0; $i < count($this->datos); $i++) {
                        if($this->datos[$i]['TIPO'] == 1){
                            if($cont == 4){
                                $cont = 0;
                            }
                            if($item == 0){
                                echo '<div class="item active"><div class="row-fluid">';
                            }else{
                                if($cont == 0){
                                    echo '<div class="item"><div class="row-fluid">';
                                }
                            }
                    ?>
			<div class="span3">
				<div class="well well-small">
                                    <a class="displayStyle" href="javascript:void(0)"><img src="<?php echo BASE_URL ?>lib/img/productos/<?php echo strtolower($this->datos[$i]['IMAGEN']) ?>" alt="#"/></a>
					<h5><?php echo $this->datos[$i]['TITULO'] ?></h5>			
                                        <button type="button" data-toggle="modal" data-target="#myModal2" onclick="producto('<?php echo $this->datos[$i]['ID'] ?>')" class="btn btn-success"><i class="icon-eye-open icon-white"></i> Más Detalles</button>			
				</div>
			</div>
                        <?php 
                            $cont ++;
                            $item = 1;
                        if($cont == 4){
                            echo '</div></div>';
                            }
                        $cont_final++;
                        }
                        if($cont_final == $val){
                            break;
                        }
                        } 
                            }  ?>
	</div>
		<a class="left carousel-control" href="#myCarouselOne" data-slide="prev">‹</a>
		<a class="right carousel-control" href="#myCarouselOne" data-slide="next">›</a>
</div>
<br/>
<h3 class="title"><span>Nuestras Marcas</span></h3>
<div id="myCarouselTwo" class="carousel slide">
	<!-- Dot Indicators -->
	<div class="carousel-inner">
	
                <?php if (isset($this->marcas) && count($this->marcas)) { 
                    $cont = 0; $item = 0; $val = 0;
                    for ($i = 0; $i < count($this->marcas); $i++) {
                        $val++;
                    }
                    $val = (int)($val/4); 
                    $val = $val*4;
                    $cont_final = 0;
                    for ($i = 0; $i < count($this->marcas); $i++) {
                            if($cont == 4){
                                $cont = 0;
                            }
                            if($item == 0){
                                echo '<div class="item active"><div class="row-fluid">';
                            }else{
                                if($cont == 0){
                                    echo '<div class="item"><div class="row-fluid">';
                                }
                            }
                    ?>
			<div class="span3">
				<div class="well well-small">
                                    <a class="displayStyle" href="javascript:void(0)"><img src="<?php echo BASE_URL ?>lib/img/marcas/<?php echo strtolower($this->marcas[$i]['IMAGEN']) ?>" alt="#"/></a>
					<h5><?php echo $this->marcas[$i]['TITULO'] ?></h5>			
                                        <button type="button" data-toggle="modal" data-target="#myModal2" onclick="marca('<?php echo $this->marcas[$i]['ID'] ?>')" class="btn btn-success"><i class="icon-eye-open icon-white"></i> Más Detalles</button>	
				</div>
			</div>
                        <?php 
                            $cont ++;
                            $item = 1;
                        if($cont == 4){
                            echo '</div></div>';
                            }
                        $cont_final++;
                        if($cont_final == $val){
                            break;
                        }
                        } 
                            }  ?>
	</div>
		<a class="left carousel-control" href="#myCarouselTwo" data-slide="prev">‹</a>
		<a class="right carousel-control" href="#myCarouseltwo" data-slide="next">›</a>
</div>

</section>


<!-- body block end======================================== -->
        <!-- Load the CloudCarousel JavaScript file -->
        
        <script type="text/javascript" src="<?php echo BASE_URL ?>lib/js/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
