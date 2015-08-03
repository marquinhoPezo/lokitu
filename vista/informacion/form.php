<div class="navbar-inner">
<form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <table align="center" cellpadding="10" width="100%" >
        <tr>
            <td>
                <div class="row-fluid text-center">
                    <div class="span3">
                        Quienes Somos<br>
                        <textarea style="height:12em" name="conocenos" rows="0" cols="0" id="conocenos"><?php if(isset ($this->datos[0]['CONOCENOS']))echo $this->datos[0]['CONOCENOS']?></textarea>
                    </div>
                    <div class="span3">
                        Misión<br>
                        <textarea style="height:12em" name="mision" rows="0" cols="0" id="mision"><?php if(isset ($this->datos[0]['MISION']))echo $this->datos[0]['MISION']?></textarea>
                    </div>
                    <div class="span3">
                        Visión<br>
                        <textarea style="height:12em" name="vision" rows="0" cols="0" id="vision"><?php if(isset ($this->datos[0]['VISION']))echo $this->datos[0]['VISION']?></textarea>
                    </div>
                    <div class="span3">
                        Reseña Histórica<br>
                        <textarea style="height:12em" name="historia" rows="0" cols="0" id="historia"><?php if(isset ($this->datos[0]['HISTORIA']))echo $this->datos[0]['HISTORIA']?></textarea>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="text-center">
            <p><button type="button" class="btn btn-primary" id="save">Guardar</button>
            <a href="<?php echo BASE_URL ?>informacion" class="btn btn-info">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>
