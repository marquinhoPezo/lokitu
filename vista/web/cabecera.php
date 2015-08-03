<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Agricola de la Selva</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" >
    <meta name="viewport" content="width=device-width">
    
    <link rel="shortcut icon" href="<?php echo BASE_URL?>lib/img/favicon.ico" type="image/x-icon" />
    
    <link id="callCss" rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/current/bootstrap.min.css" type="text/css" media="screen"/>
    <link href="<?php echo BASE_URL ?>lib/themes/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo BASE_URL ?>lib/themes/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<?php echo BASE_URL ?>lib/themes/css/base.css" rel="stylesheet" type="text/css">
        
<!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>jquery.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>jquery.min.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>modernizr-2.6.2.min.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>validaciones.js"></script>
        <script type="text/javascript">
        var showStaticMenuBar = false;
        $(window).scroll(function() {
            if(showStaticMenuBar == false){
                if($(window).scrollTop() >= 40){
                    $("#cont_header").hide();
                    $("#cont_header2").show();
                    showStaticMenuBar=true;
                }
            }else{
                if($(window).scrollTop() <= 40){
                    $("#cont_header").show();
                    $("#cont_header2").hide();
                    showStaticMenuBar=false;
                }   
            }
        }

        );
            var url = <?php echo BASE_URL ?>;
            jQuery(function (){jQuery(".slide_likebox").hover(function(){jQuery(".slide_likebox").stop(true, false).animate({right:"0"},"medium")},
                function(){jQuery(".slide_likebox").stop(true, false).animate({right:"-250"},"medium");},500);return false;});
            jQuery(function (){
                jQuery(".slide_likebox2").hover(function(){
                    jQuery(".slide_likebox2").stop(true, false).animate({right:"0"},"medium").css('z-index','1005');
                },
                function(){
                    jQuery(".slide_likebox2").stop(true, false).animate({right:"-250"},"medium").css('z-index','1000');
                },500);return false;
            });
        </script>
        <link rel="stylesheet" href="<?php echo $_params['ruta_css']; ?>fanbox.css" type="text/css" media="screen">
        <div id='facebook_box' class="slide_likebox">
            <img src='<?php echo BASE_URL ?>lib/img/fb_tab.png' class="img_fanbox"/>
            <div class="div_fanbox" style='background: #3c5a98;'>
                <span class="fanbox_fb">
                    <div class='likeboxwrap'>
                        <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FAgricolaDeLaSelva&amp;width=238&amp;colorscheme=light&amp;connections=12&amp;stream=false&amp;header=false&amp;height=350" scrolling="no" frameborder="0" id="frame_fb">
                        </iframe>
                    </div>
                </span>
            </div>
        </div>
        <div id='twitter_box' class="slide_likebox2">
            <img src='<?php echo BASE_URL ?>lib/img/tw_tab.png'  class="img_fanbox"/>
            <div class="div_fanbox" style='background: #00a0e8;'>
                <span>
                    <div class='likeboxwrap'>
                        <div id="twitterfanbox">
<a class="twitter-timeline" href="https://twitter.com/AgricoDeLaSelva" data-widget-id="359699072938020864">Tweets por @AgricoDeLaSelva</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                        </div>      
                    </div>
                </span>
            </div>
        </div>

</head>
<body>
<section id="headerSection">
	<div class="container">
		<div class="navbar">
			<div class="" id="cont_header">
				<button type="button" class="btn btn-navbar active" data-toggle="collapse" data-target=".nc1">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
                                <div id="logo_menu">
                                    <img src="<?php echo BASE_URL ?>lib/themes/images/logo2.png" style="width: 100px" alt="" />
                                </div>
				<div class="nav-collapse collapse nc1" id="menu_web">
                                    <img id="img-titulo" src="<?php echo BASE_URL ?>lib/img/banner_conexion.png" alt="" /><br/><br/>
                                        <input type="text" class="input-large buscar_producto" placeholder="Buscar Producto..." style="-webkit-box-shadow: 0 5px 55px rgba(0, 0, 0, 0.5);-moz-box-shadow: 0 5px 5px rgba(0, 0, 0, 0.5);box-shadow: 0 5px 5px rgba(0, 0, 0, 0.5);padding: 10px 6px; margin-top: 1px; margin-left: 7%; width: 150px;" />
					<ul class="nav pull-right" id="ul_nav">
						<li class="active li_index"><a href="<?php echo BASE_URL ?>">Inicio</a></li>
						<li class="li_nosotros"><a href="<?php echo BASE_URL ?>web/nosotros">Nosotros</a></li>  
						<li class="li_productos"><a href="<?php echo BASE_URL ?>web/productos">Catalogo</a></li>
						<li class="li_galeria"><a href="<?php echo BASE_URL ?>web/galeria">Galeria</a></li>
						<li class="li_contactenos"><a href="<?php echo BASE_URL ?>web/contactenos">Contáctenos</a></li>
                                                <?php if(session::get('autenticado')){ ?>
						<li class="lg_menu">
                                                    <a href="<?php echo BASE_URL ?>index">Sistema</a>
                                                </li>
                                                <?php }else{ ?>
                                                <li class="lg_menu">
                                                    <a href="javascript:void(0)" onclick="$('#usuario').focus()" data-toggle="modal" data-target="#myModal">Iniciar Sesión</a>
                                                </li>
                                                <?php } ?>
                                        </ul>
				</div>
			</div>
			<div class="hide" id="cont_header2" style="padding-bottom: 0.5%;">
				<button type="button" class="btn btn-navbar active" data-toggle="collapse" data-target=".nc2">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<div class="nav-collapse collapse nc2" id="menu_web2">
                                    <img src="<?php echo BASE_URL ?>lib/img/banner_conexion.png" alt="" style="padding-top: 0.5%" width="200px" />
                                        <input type="text" class="input-large buscar_producto" placeholder="Buscar Producto..." style="-webkit-box-shadow: 0 5px 55px rgba(0, 0, 0, 0.5);-moz-box-shadow: 0 5px 5px rgba(0, 0, 0, 0.5);box-shadow: 0 5px 5px rgba(0, 0, 0, 0.5);padding: 10px 6px; margin-top: 1px; margin-left: 5px; width: 120px; margin-bottom: 0;" />
					<ul class="nav pull-right" id="ul_nav">
						<li class="active li_index"><a href="<?php echo BASE_URL ?>">Inicio</a></li>
						<li class="li_nosotros"><a href="<?php echo BASE_URL ?>web/nosotros">Nosotros</a></li>  
						<li class="li_productos"><a href="<?php echo BASE_URL ?>web/productos">Catalogo</a></li>
						<li class="li_galeria"><a href="<?php echo BASE_URL ?>web/galeria">Galeria</a></li>
						<li class="li_contactenos"><a href="<?php echo BASE_URL ?>web/contactenos">Contáctenos</a></li>
                                                <?php if(session::get('autenticado')){ ?>
						<li><a href="<?php echo BASE_URL ?>index">Sistema</a></li>
                                                <?php }else{ ?>
						<li><a href="javascript:void(0)" data-toggle="modal" data-target="#myModal">Iniciar Sesión</a></li>
                                                <?php } ?>
                                        </ul>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="container navbar-inner" id="div_contenido_body">
    <section id="sec_contenido">