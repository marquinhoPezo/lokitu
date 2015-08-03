<!--Header Ends================================================ -->
<!-- Page banner -->
<section id="bannerSection" style="background:url(<?php echo BASE_URL ?>lib/themes/images/bg.jpg) no-repeat center center #000;">
	<div>	
		<h1 id="pageTitle">Nosotros
		</h1>
	</div>
</section> 
<!-- Page banner end -->
<section id="bodySection">		
	<div id="wrapper">
		<div>	
		<div class="row-fluid" id="informacion">
			<div class="span4">
				<div class="thumbnail">
					<h3>Quienes Somos</h3>
                                        <img src="<?php echo BASE_URL ?>lib/themes/images/nosotros.jpg" alt="" /><br/>
                                <article class="container-fluid">
                                <?php 
                                $var = $this->datos[0]['CONOCENOS'];
                                $var = str_replace("\r","<div style='height:20px'></div>",$var);
                                echo ucwords(strtolower($var))?>
                                </article>
				</div>
                            <br/>
			<div class="thumbnail">
				<h3>Mision</h3>
                                <article class="text-justify">
                                    <img src="<?php echo BASE_URL ?>lib/img/mision.png" class="pull-right" />
                                <?php 
                                $var = $this->datos[0]['MISION'];
                                $var = str_replace("\r","<div style='height:20px'></div>",$var);
                                echo ucwords(strtolower($var))?>
                                </article>
			</div>
                            <br/>
			<div class="thumbnail">
				<h3>Vision</h3>
                                <article class="text-justify">
                                    <img src="<?php echo BASE_URL ?>lib/img/vision.png" class="pull-left" />
                                <?php 
                                $var = $this->datos[0]['VISION'];
                                $var = str_replace("\r","<div style='height:20px'></div>",$var);
                                echo ucwords(strtolower($var))?>
                                </article>
			</div>
			</div>
			<div class="span8">
				<div class="thumbnail">
					<h3>Reseña Histórica</h3>
                                        <img src="<?php echo BASE_URL ?>lib/themes/images/historia.jpg" alt="" /><br/>
                                <article class="text-justify container-fluid">
                                <?php 
                                $var = $this->datos[0]['HISTORIA'];
                                $var = str_replace("\r","<div style='height:15px'></div>",$var);
                                echo ucwords(strtolower($var))?>
                                </article>
				</div>
			</div>
		<br/>
		</div>
                    <br/>
	</div>
</section>
<script>
$(document).ready(function(){
    $(".li_index").removeClass('active');
    $(".li_nosotros").addClass('active');
});
</script>