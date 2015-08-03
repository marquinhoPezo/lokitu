/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function ver(id){
            $("#myModalLabel").html('');
            $("#bodymodal").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
            html='';titulo='';
           $.post(url+'informacion/ver','id=0',function(datos){
               if(id==1){
                   titulo = "<h4>Quienes Somos</h4>";
                   rep = datos[0].CONOCENOS.replace(/\s*[\r\n][\r\n \t]*/g, "<br><br>");
                   html += '<article>'+rep+'</article>';
               }
               if(id==2){
                   titulo = "<h4>Misión</h4>";
                   rep1 = datos[0].MISION.replace(/\s*[\r\n][\r\n \t]*/g, "<br><br>");
                   html += '<article>'+rep1+'</article>';
               }
               if(id==3){
                   titulo += "<h4>Visión</h4>";
                   rep2 = datos[0].VISION.replace(/\s*[\r\n][\r\n \t]*/g, "<br><br>");
                   html += '<article>'+rep2+'</article>';
               }
               if(id==4){
                   titulo += "<h4>Reseña Histórica</h4>";
                   rep3 = datos[0].HISTORIA.replace(/\s*[\r\n][\r\n \t]*/g, "<br><br>");
                   html += '<article>'+rep3+'</article>';
               }
            $("#myModalLabel").html(titulo);
            $("#bodymodal").html(html);
           },'json');
       }
       