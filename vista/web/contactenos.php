<!--Header Ends================================================ -->
<section id="mapSection"> 
    <div><h1 id="pageTitle"></h1></div>
<div id="myMap" style="height:400px">
<!-- please edit in (js code which is available in the foote section) longitude and longitude of your location  -->
</div>	
</section>
<!-- Page banner -->
<!--
<section id="bannerSection" style="background:url(<?php echo BASE_URL ?>lib/themes/images/banner/contact.png) no-repeat center center #000;">
	<div class="container" >	
		<h1 id="pageTitle">Contact <small> :We love to hear from you</small> 
		<span class="pull-right toolTipgroup">
			<a href="#" data-placement="top" data-original-title="Find us on via facebook"><img style="width:45px" src="<?php echo BASE_URL ?>lib/themes/images/facebook.png" alt="facebook" title="facebook"></a>
			<a href="#" data-placement="top" data-original-title="Find us on via twitter"><img style="width:45px" src="<?php echo BASE_URL ?>lib/themes/images/twitter.png" alt="twitter" title="twitter"></a>
			<a href="#" data-placement="top" data-original-title="Find us on via youtube"><img style="width:45px" src="<?php echo BASE_URL ?>lib/themes/images/youtube.png" alt="youtube" title="youtube"></a>
		</span>
		</h1>
	</div>
</section> 
-->
<!-- Page banner end -->

<section id="bodySection"> 						
	<div class="row-fluid">
			<div class="span6">
			<h3>  Ubiquenos</h3>
                        Jr. Antonio Raymondi #285<br/>
                        Tarapoto - San Martin<br/><br/>
                        964 584817 <br/>
                        info@agrovet.com
			</div>
			<div class="span6">
				<h3>  Envienos un correo</h3>
				<form class="form-horizontal">
				<fieldset>
				  <div class="control-group">
				   
					  <input type="text" placeholder="nombre" class="input-xlarge"/>
				   
				  </div>
				   <div class="control-group">
				   
					  <input type="text" placeholder="email" class="input-xlarge"/>
				   
				  </div>
				   <div class="control-group">
				   
					  <input type="text" placeholder="asunto" class="input-xlarge"/>
				  
				  </div>
				  <div class="control-group">
					  <textarea rows="4" id="textarea" class="input-xlarge"></textarea>
				   
				  </div>

					<button class="btn btn-large" type="submit"> <i class="icon-envelope"></i> Enviar</button>

				</fieldset>
			  </form>
			</div>
		</div>
</section>
<script>
$(document).ready(function(){
    $(".li_index").removeClass('active');
    $(".li_contactenos").addClass('active');
});
</script>
<!-- Google map jquery files -->
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script src="<?php echo BASE_URL ?>lib/themes/js/jquery.gmap.js"></script>
	<script>
		// Google map data ==============================================================================
	  $(document).ready(function(){
		$("#myMap").gMap({ controls: false,
						  scrollwheel: false,
			  draggable: true,
		  markers: [{ latitude: -6.489421,
                                longitude: -76.359709,		//your company location longitude
					  icon: { image: "http://www.google.com/mapfiles/marker.png",
							  iconsize: [42, 48],
							  iconanchor: [42,48],
							  infowindowanchor: [14, 0] } },
					],
		  icon: { image: "http://www.google.com/mapfiles/marker.png", 
				  iconsize: [28, 48],
				  iconanchor: [14, 48],
				  infowindowanchor: [14, 0] },
		  latitude: -6.489421,
                                longitude: -76.359709,	
		  zoom: 16, });
	  });
	</script>