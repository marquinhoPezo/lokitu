<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <table align="center" cellpadding="10" >
                <caption><h3><?php echo $this->titulo ?><span id="msg"></span></h3></caption>
                <tr>
                    <td><label>Codigo</label></td>
                    <td>
                    <input type="text" name="id_sucursal" id="id_sucursal" readonly='readonly'
                           <?php if(isset ($this->datos[0]['ID_SUCURSAL']))echo "value='".$this->datos[0]['ID_SUCURSAL']."'"?> />
                    </td>
                </tr>
                <tr>
                    <td><label>Nombre</label></td>
                    <td>
                    <input type="text" name="nombre" id="nombre" 
                           value="<?php if(isset ($this->datos[0]['NOMBRE']))echo $this->datos[0]['NOMBRE']?>"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Direccion</label></td>
                    <td>
                    <input type="text" name="direccion" id="direccion" 
                           value="<?php if(isset ($this->datos[0]['DIRECCION']))echo $this->datos[0]['DIRECCION']?>"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Telefono</label></td>
                    <td>
                    <input type="text" name="telefono" id="telefono" onkeypress="return numeroTelefonico(event)"
                           value="<?php if(isset ($this->datos[0]['TELEFONO']))echo $this->datos[0]['TELEFONO']?>"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Ciudad</label></td>
                    <td>
                    <input type="text" name="ciudad" id="ciudad" 
                           value="<?php if(isset ($this->datos[0]['CIUDAD']))echo $this->datos[0]['CIUDAD']?>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                    <p><button type="submit" class="btn btn-primary" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>sucursal" class="btn btn-info">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>