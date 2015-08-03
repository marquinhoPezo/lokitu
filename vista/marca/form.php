<div class="navbar-inner">
    <br/>
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['ID_MARCA']))echo $this->datos[0]['ID_MARCA']?>"/>
            <table align="center" cellpadding="10" >
                <tr>
                    <td><label>Descripcion</label></td>
                    <td>
                    <input type="text" name="descripcion"
                            id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="submit" class="btn btn-primary" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>marca" class="btn btn-info">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>