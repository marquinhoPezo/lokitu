<!--Header Ends================================================ -->
<!-- Page banner -->
<section id="bannerSection" style="background:url(/agrovet/lib/themes/images/bg.jpg) no-repeat center center #000;">
	<div>	
		<h1 id="pageTitle">Galería
		</h1>
	</div>
</section> 
<style>
    
.imgfb{
    width: 100px;
    height: 100px;
}
.titleContacto{
	font-size:24px;
	color:#F90;
	text-align:left;
        margin-left: 1%;
}
.fotofb{
	width: 154px;
        height: 190px;
        overflow: hidden;
        display:inline-block;
        vertical-align: top;
	padding: 6px;
	margin: 4px;
	font-family:Arial, Helvetica, sans-serif;
	font-size: 11px;
        box-shadow: inset 0px 0px 20px rgba(100,100,100,0.2);
        border: solid 1px #666;
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        -o-border-radius: 5px;
        -ms-border-radius: 5px;

}
.fotofb i{
	width: 150px;
	height: 116px;
	background-color:#FBFBFB;
	border: solid 1px #999;
	background-color: #EEE;
	background-position: center 25%;
	background-repeat: no-repeat;
	display: block;		
	box-shadow: -3px 3px 5px #111;
}
.fotofb i:hover{
	box-shadow: 0px 0px 5px #000;	
}
</style>
<script>
function album(id){
    $.ajax({
        type:"POST",
        url:url+'vista/web/album.php',
        data:{
            idfb:id
        },
        beforeSend:function(){
            $(".thumbnail").html('<div style="width:100%;margin:1em auto;text-align:center"><img src="'+url+'lib/img/loading.gif" /></div>');
        },
        success:function(rpta){
            $(".thumbnail").html(rpta);
        }
    });
}
</script>
<!-- Page banner end -->
<section id="bodySection">		
	<div id="wrapper">
		<div class="row-fluid">
			<div class="span12">
				<div class="thumbnail">
					<h4>Nuestra Galería de Imagenes</h4>
					<p>
                                            <?php
                                                $divfotos = '';
                                                include("fb.php");
                                                $listafotos =  fb_albums('657396727626992');
                                                foreach($listafotos as $index => $valor){
                                                    $divfotos .= '<div class="fotofb"><a href="javascript:album('.$valor['ida'].')">
                                                            <i style="background-image: url('.$valor['thumb'].')"></i></a>
                                                                <p> '. $valor['total'].' fotos publicadas'.'<br/>
                                                                    <label style="font-weight:bold;" title="'.$valor['nombre'].'">'.($valor['nombre']).'</label></p></div>';
                                                }
                                                echo $divfotos;
                                            ?>
                                        </p>
				</div>
			</div>
                </div>
	</div>
</section>
<script>
$(document).ready(function(){
    $(".li_index").removeClass('active');
    $(".li_galeria").addClass('active');
});
</script>