<script src="<?php echo $_params['ruta_js']; ?>bootbox.min.js"></script>
<link href="<?php echo $_params['ruta_css']; ?>jquery-ui.custom.css" rel="stylesheet" />
<div class="navbar-inner">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                value="<?php if(isset ($this->datos[0]['ID_EMPLEADO']))echo $this->datos[0]['ID_EMPLEADO']?>"/>
    <table align="center" cellpadding="10">
        <tr>
            <td><label>Nombres:</label></td>
            <td><input type="text" name="nombre" onkeypress="return soloLetras(event)"
               id="nombre" value="<?php if(isset ($this->datos[0]['NOMBRE']))echo $this->datos[0]['NOMBRE']?>"/></td>
            <td><label>Apellidos:</label></td>
            <td><input type="text" name="apellido" onkeypress="return soloLetras(event)"
               id="apellido" value="<?php if(isset ($this->datos[0]['APELLIDO']))echo $this->datos[0]['APELLIDO']?>"/></td>
        </tr>
        <tr>
            <td><label>Direccion:</label></td>
            <td><input type="text" name="direccion"
               id="direccion" value="<?php if(isset ($this->datos[0]['DIRECCION']))echo $this->datos[0]['DIRECCION']?>"/></td>
            <td><label>Telefono:</label></td>
            <td><input type="text" name="telefono" id="telefono" onkeypress="return numeroTelefonico(event)"
               value="<?php if(isset ($this->datos[0]['TELEFONO']))echo $this->datos[0]['TELEFONO']?>"/></td>
        </tr>
        <tr>
            <td><label>DNI:</label></td>
            <td><input type="text" name="dni" id="dni" maxlength="8" onkeypress="return soloNumeros(event)" min="8"
               value="<?php if(isset ($this->datos[0]['DNI']))echo $this->datos[0]['DNI']?>"/></td>
            <td><label>Fecha de Nacimiento:</label></td>
            <td><input type="text" name="fechanacimiento" id="fechanacimiento" readonly="readonly" style="cursor: pointer"
               value="<?php if(isset ($this->datos[0]['FECHANACIMIENTO']))echo $this->datos[0]['FECHANACIMIENTO']?>"/></td>
        </tr>
        <tr>
            <td><label>Sucursal</label></td>
            <td>
                <select name="id_sucursal" id="id_sucursal">
                    <option value="0"></option>
                    <?php for($i=0;$i<count($this->datos_sucursal);$i++){ ?>
                        <?php if( $this->datos[0]['ID_SUCURSAL'] == $this->datos_sucursal[$i]['ID_SUCURSAL'] ){ ?>
                    <option value="<?php echo $this->datos_sucursal[$i]['ID_SUCURSAL'] ?>" selected="selected"><?php echo utf8_encode($this->datos_sucursal[$i]['NOMBRE']) ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->datos_sucursal[$i]['ID_SUCURSAL'] ?>"><?php echo utf8_encode($this->datos_sucursal[$i]['NOMBRE']) ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </td>
            <td><label>Perfil:</label></td>
            <td>
                <select id="id_perfil" name="id_perfil">
                    <option value="0"></option>
                    <?php for($i=0;$i<count($this->datos_perfil);$i++){ ?>
                        <?php if( $this->datos[0]['ID_PERFIL'] == $this->datos_perfil[$i]['ID_PERFIL'] ){ ?>
                    <option value="<?php echo $this->datos_perfil[$i]['ID_PERFIL'] ?>" selected="selected"><?php echo $this->datos_perfil[$i]['DESCRIPCION'] ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->datos_perfil[$i]['ID_PERFIL'] ?>"><?php echo $this->datos_perfil[$i]['DESCRIPCION'] ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>Usuario:</label></td>
            <td><input type="text" name="usuario" id="usuario" 
               value="<?php if(isset ($this->datos[0]['USUARIO']))echo $this->datos[0]['USUARIO']?>"/></td>
            <td><label>Clave:</label></td>
            <td><input type="password" name="clave" id="clave" 
               value="<?php if(isset ($this->datos[0]['CLAVE']))echo $this->datos[0]['CLAVE']?>"/></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <p><button type="button" class="btn btn-primary" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>empleado" class="btn btn-info">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>