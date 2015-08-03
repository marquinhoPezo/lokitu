<?php 
//esta funcion corta el largo de la info de la foto.
//Funcion agregada.
function cortar_string ($string, $largo) { 
   $marca = "<!--corte-->"; 
   if (strlen($string) > $largo) { 
       $string = wordwrap($string, $largo, $marca); 
       $string = explode($marca, $string); 
       $string = $string[0].'...'; 
   } 
   return $string; 

} 
//Esta Función Extrae los datos de una Foto
function photo_fb($idfoto){
	$str_graph = file_get_contents('http://graph.facebook.com/'.$idfoto);
	$datos = json_decode($str_graph,true);
		$fotoret = array('thumb'=>$datos['picture'],
			  'src'=>$datos['source'],
			  );

	return $fotoret;
}
//Esta Función Extrae los albums de una fanpage.
function fb_albums($idfanpage = 'ninguno'){

	$idfanpage == 'ninguno' ? $idfanpage = 'AgricolaDeLaSelva' : $idfanpage = $idfanpage;
	$str_graph = file_get_contents('http://graph.facebook.com/'.$idfanpage.'/albums');
	$datos = json_decode($str_graph,true);
	$albums = $datos["data"];
	
	foreach($albums as $index => $valor){
		$previo = photo_fb($valor['cover_photo']);
		
		$fotoret[$index] = array('thumb'=> $previo['thumb'],
				'ida'=>$valor['id'],
				'nombre'=> str_replace('"','',$valor['name']), 
				'fblink'=>$valor['link'],
				'total'=>$valor['count']);
	}
	return $fotoret;

function fotosJungla($id){
    foreach($listafotos as $index => $valor){
            $galeria = file_get_contents("https://graph.facebook.com/".$id."/photos?limit=100");
            $galeria = json_decode($galeria);
            $fotos = $galeria->data;
            $divfotos .=
                '<ul class="scroll-pane">
                <p>'. $valor['total'].' fotos publicadas</p>';
                    foreach($fotos as $idfoto => $foto){
                        $divfotos .= '<span><a rel="sexylightbox[kmx]" title="Foto '.($idfoto+1).' de la galería" href="'.$foto->source.'"><img class="imgfb" title="Foto '.($idfoto+1).' de la galería" src="'.$foto->picture.'" /></a></span>';
                    }
            $divfotos .='<br>
                </ul>';
    }
    return $divfotos;
}
}
?>