--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.0
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-11-23 21:58:04

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 236 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2615 (class 0 OID 0)
-- Dependencies: 236
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 249 (class 1255 OID 873796)
-- Name: act_almacen(integer, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_almacen(p_id_almacen integer, p_descripcion character varying, p_ubicacion character varying, p_id_sucursal integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE almacen SET descripcion = p_descripcion, ubicacion = p_ubicacion, id_sucursal = p_id_sucursal
WHERE id_almacen = p_id_almacen;

END;

$$;


ALTER FUNCTION public.act_almacen(p_id_almacen integer, p_descripcion character varying, p_ubicacion character varying, p_id_sucursal integer) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 873797)
-- Name: act_categoria(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_categoria(p_id_categoria integer, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE categoria SET descripcion = p_descripcion
WHERE id_categoria = p_id_categoria;

END;

$$;


ALTER FUNCTION public.act_categoria(p_id_categoria integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 873798)
-- Name: act_compra(integer, integer, integer, date, numeric, character varying, numeric, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_compra(p_id_compra integer, p_id_proveedor integer, p_id_tipopago integer, p_fechacompra date, p_monto numeric, p_nrodoc character varying, p_igv numeric, p_estadopago character) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE compra SET id_proveedor = p_id_proveedor,id_tipopago=p_id_tipopago,fechacompra=p_fechacompra,monto=p_monto,nrodoc=p_nrodoc,igv=p_igv,estadopago=p_estadopago
WHERE id_compra = p_id_compra;

END;

$$;


ALTER FUNCTION public.act_compra(p_id_compra integer, p_id_proveedor integer, p_id_tipopago integer, p_fechacompra date, p_monto numeric, p_nrodoc character varying, p_igv numeric, p_estadopago character) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 873799)
-- Name: act_concepto(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_concepto(p_id_concepto integer, p_descripcion character varying, p_id_tipoconcepto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE concepto SET descripcion = p_descripcion,id_tipoconcepto=p_id_tipoconcepto
WHERE id_concepto = p_id_concepto;

END;

$$;


ALTER FUNCTION public.act_concepto(p_id_concepto integer, p_descripcion character varying, p_id_tipoconcepto integer) OWNER TO postgres;

--
-- TOC entry 253 (class 1255 OID 873800)
-- Name: act_correlativo(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_correlativo(p_id_seriecomprobante integer, p_correlativo integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE seriecomprobante SET correlativo = p_correlativo
WHERE id_seriecomprobante = p_id_seriecomprobante;

END;

$$;


ALTER FUNCTION public.act_correlativo(p_id_seriecomprobante integer, p_correlativo integer) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 873801)
-- Name: act_cronogcobro(integer, integer, numeric, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_cronogcobro(p_id_cronogcobro integer, p_id_venta integer, p_monto numeric, p_nrocuota integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE cronogcobro SET id_venta = p_id_venta,monto_cobrado=p_monto,nrocuota=p_nrocuota
WHERE id_cronogcobro = p_id_cronogcobro;

END;

$$;


ALTER FUNCTION public.act_cronogcobro(p_id_cronogcobro integer, p_id_venta integer, p_monto numeric, p_nrocuota integer) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 873802)
-- Name: act_cronogpago(integer, integer, numeric, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_cronogpago(p_id_cronogpago integer, p_id_compra integer, p_monto numeric, p_nrocuota integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE cronogpago SET id_compra = p_id_compra,nrocuota=p_nrocuota,monto_pagado=p_monto
WHERE id_cronogpago = p_id_cronogpago;

END;

$$;


ALTER FUNCTION public.act_cronogpago(p_id_cronogpago integer, p_id_compra integer, p_monto numeric, p_nrocuota integer) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 873803)
-- Name: act_detamcobro(integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_detamcobro(p_id_movimiento integer, p_id_cronogcobro integer, p_monto numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE detamortizacioncobro SET monto=p_monto
WHERE id_movimiento = p_id_movimiento AND id_cronogcobro=p_id_cronogcobro;

END;

$$;


ALTER FUNCTION public.act_detamcobro(p_id_movimiento integer, p_id_cronogcobro integer, p_monto numeric) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 873804)
-- Name: act_detampago(integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_detampago(p_id_cronogpago integer, p_id_movimiento integer, p_monto numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE detamortizacionpago SET monto=p_monto
WHERE id_cronogpago=p_id_cronogpago and id_movimiento = p_id_movimiento;

END;

$$;


ALTER FUNCTION public.act_detampago(p_id_cronogpago integer, p_id_movimiento integer, p_monto numeric) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 873805)
-- Name: act_detprodum(integer, integer, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_detprodum(p_id_unidadmedida integer, p_id_producto integer, p_preciovcont numeric, p_preciovcre numeric) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
BEGIN
 UPDATE detproductounidmedida set preciovcont = p_preciovcont , preciovcre = p_preciovcre
 WHERE id_unidadmedida=p_id_unidadmedida and id_producto=p_id_producto;
end;
$$;


ALTER FUNCTION public.act_detprodum(p_id_unidadmedida integer, p_id_producto integer, p_preciovcont numeric, p_preciovcre numeric) OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 873806)
-- Name: act_empleado(integer, character varying, character varying, character varying, integer, character, date, character varying, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_empleado(p_id_empleado integer, p_nombre character varying, p_apellido character varying, p_direccion character varying, p_telefono integer, p_dni character, p_fechanacimiento date, p_usuario character varying, p_clave character varying, p_id_perfil integer, p_id_sucursal integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE empleado SET nombre = p_nombre, apellido = p_apellido,direccion=p_direccion,telefono=p_telefono,dni=p_dni,fechanacimiento=p_fechanacimiento,
	usuario=p_usuario,clave=p_clave,id_perfil=p_id_perfil, id_sucursal = p_id_sucursal
WHERE id_empleado = p_id_empleado;

END;

$$;


ALTER FUNCTION public.act_empleado(p_id_empleado integer, p_nombre character varying, p_apellido character varying, p_direccion character varying, p_telefono integer, p_dni character, p_fechanacimiento date, p_usuario character varying, p_clave character varying, p_id_perfil integer, p_id_sucursal integer) OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 873807)
-- Name: act_estadocv(integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_estadocv(xid integer, xcv integer, xestadopago character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (xcv = 1)
	then
	UPDATE compra SET estadopago = xestadopago
	WHERE id_compra = xid;
END IF;
IF (xcv = 2)
	then
	UPDATE venta SET estadopago = xestadopago
	WHERE id_venta = xid;
	END IF;
END;

$$;


ALTER FUNCTION public.act_estadocv(xid integer, xcv integer, xestadopago character varying) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 873808)
-- Name: act_formapago(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_formapago(p_id_formapago integer, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE formapago SET descripcion = p_descripcion
WHERE id_formapago = p_id_formapago;

END;

$$;


ALTER FUNCTION public.act_formapago(p_id_formapago integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 873809)
-- Name: act_marca(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_marca(p_id_marca integer, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE marca SET descripcion = p_descripcion
WHERE id_marca = p_id_marca;

END;

$$;


ALTER FUNCTION public.act_marca(p_id_marca integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 377 (class 1255 OID 876158)
-- Name: act_motivomovimiento(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_motivomovimiento(p_id_motivomovimiento integer, p_descripcion character varying, p_id_tipomovimiento integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE motivomovimiento SET descripcion = p_descripcion,id_tipomovimiento=p_id_tipomovimiento
WHERE id_motivomovimiento = p_id_motivomovimiento;

END;

$$;


ALTER FUNCTION public.act_motivomovimiento(p_id_motivomovimiento integer, p_descripcion character varying, p_id_tipomovimiento integer) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 873810)
-- Name: act_movimiento(integer, integer, integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_movimiento(p_id_movimiento integer, p_id_caja integer, p_id_concepto integer, p_id_formapago integer, p_monto numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE movimiento SET id_caja = p_id_caja,id_concepto=p_id_concepto,id_formapago=p_id_formapago,monto=p_monto
WHERE id_movimiento = p_id_movimiento;

END;

$$;


ALTER FUNCTION public.act_movimiento(p_id_movimiento integer, p_id_caja integer, p_id_concepto integer, p_id_formapago integer, p_monto numeric) OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 876230)
-- Name: act_movimiento(integer, integer, integer, integer, numeric, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_movimiento(p_id_movimiento integer, p_id_caja integer, p_id_concepto integer, p_id_formapago integer, p_monto numeric, p_fecha timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE movimiento SET id_caja = p_id_caja,id_concepto=p_id_concepto,id_formapago=p_id_formapago,monto=p_monto,fecha=p_fecha
WHERE id_movimiento = p_id_movimiento;

END;

$$;


ALTER FUNCTION public.act_movimiento(p_id_movimiento integer, p_id_caja integer, p_id_concepto integer, p_id_formapago integer, p_monto numeric, p_fecha timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 873811)
-- Name: act_param(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_param(p_id_param character varying, p_valor character varying, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE param SET valor = p_valor, descripcion = p_descripcion
WHERE id_param = p_id_param;

END;

$$;


ALTER FUNCTION public.act_param(p_id_param character varying, p_valor character varying, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 873812)
-- Name: act_producto(integer, integer, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_producto(p_id_producto integer, p_id_marca integer, p_id_subcategoria integer, p_descripcion character varying, p_id_unidadmedida integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE producto SET id_marca = p_id_marca,id_subcategoria=p_id_subcategoria,descripcion=p_descripcion,id_unidadmedida=p_id_unidadmedida
WHERE id_producto = p_id_producto;

END;

$$;


ALTER FUNCTION public.act_producto(p_id_producto integer, p_id_marca integer, p_id_subcategoria integer, p_descripcion character varying, p_id_unidadmedida integer) OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 873813)
-- Name: act_proveedor(integer, character varying, character varying, character varying, character varying, character varying, character, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_proveedor(p_id_proveedor integer, p_nombre character varying, p_direccion character varying, p_razonsocial character varying, p_email character varying, p_ciudad character varying, p_ruc character, p_telefmovil character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE proveedor SET nombre = p_nombre,direccion=p_direccion,razonsocial=p_razonsocial,email=p_email,ciudad=p_ciudad,ruc=p_ruc,telefmovil=p_telefmovil
WHERE id_proveedor = p_id_proveedor;

END;

$$;


ALTER FUNCTION public.act_proveedor(p_id_proveedor integer, p_nombre character varying, p_direccion character varying, p_razonsocial character varying, p_email character varying, p_ciudad character varying, p_ruc character, p_telefmovil character varying) OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 873814)
-- Name: act_saldocaja(numeric, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_saldocaja(xsaldo numeric, xaumenta smallint) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare 
	xid integer;
BEGIN
xid := (SELECT MAX(id_caja) FROM caja);
IF (xaumenta = 1)
	then
		UPDATE caja
		SET saldo_ci = saldo_ci + xsaldo
		WHERE id_caja=xid;
ELSE
		UPDATE caja
		SET saldo_ci = saldo_ci - xsaldo
		WHERE id_caja=xid;
	END if;

end;
$$;


ALTER FUNCTION public.act_saldocaja(xsaldo numeric, xaumenta smallint) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 873815)
-- Name: act_seriecomprb(integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_seriecomprb(p_id_seriecomprobante integer, p_serie integer, p_id_tipocomprobante integer, p_maxcorrelativo integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE seriecomprobante SET serie = p_serie,id_tipocomprobante=p_id_tipocomprobante,maxcorrelativo=p_maxcorrelativo
WHERE id_seriecomprobante = p_id_seriecomprobante;

END;

$$;


ALTER FUNCTION public.act_seriecomprb(p_id_seriecomprobante integer, p_serie integer, p_id_tipocomprobante integer, p_maxcorrelativo integer) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 876169)
-- Name: act_stockprodalm(integer, integer, numeric, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_stockprodalm(p_id_almacen integer, p_id_producto integer, p_cantidadub numeric, p_id_motivomovimiento integer, p_aumenta integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare p_stock numeric;
BEGIN
IF(p_aumenta = 1)
	THEN
		p_stock := (SELECT stock FROM detprodalm WHERE id_almacen=p_id_almacen and id_producto = p_id_producto) + p_cantidadub;	
	ELSE
		p_stock := (SELECT stock FROM detprodalm WHERE id_almacen=p_id_almacen and id_producto = p_id_producto) - p_cantidadub;
	END if;

	UPDATE detprodalm SET stock = p_stock
	WHERE id_almacen=p_id_almacen and id_producto = p_id_producto;

	INSERT INTO kardex_producto (id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento)
	VALUES (p_id_producto, p_cantidadub, now(), p_id_almacen, p_stock, p_id_motivomovimiento);
END;

$$;


ALTER FUNCTION public.act_stockprodalm(p_id_almacen integer, p_id_producto integer, p_cantidadub numeric, p_id_motivomovimiento integer, p_aumenta integer) OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 873817)
-- Name: act_subcategoria(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_subcategoria(p_id_subcategoria integer, p_descripcion character varying, p_id_categoria integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE subcategoria SET descripcion = p_descripcion,id_categoria=p_id_categoria
WHERE id_subcategoria = p_id_subcategoria;

END;

$$;


ALTER FUNCTION public.act_subcategoria(p_id_subcategoria integer, p_descripcion character varying, p_id_categoria integer) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 873818)
-- Name: act_sucursal(integer, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_sucursal(p_id_sucursal integer, p_nombre character varying, p_direccion character varying, p_telefono character varying, p_ciudad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE sucursal SET nombre = p_nombre, direccion = p_direccion, telefono = p_telefono, ciudad = p_ciudad
WHERE id_sucursal = p_id_sucursal;

END;

$$;


ALTER FUNCTION public.act_sucursal(p_id_sucursal integer, p_nombre character varying, p_direccion character varying, p_telefono character varying, p_ciudad character varying) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 873819)
-- Name: act_tipocliente(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_tipocliente(p_id_tipocliente integer, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE tipocliente SET descripcion = p_descripcion
WHERE id_tipocliente = p_id_tipocliente;

END;

$$;


ALTER FUNCTION public.act_tipocliente(p_id_tipocliente integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 873820)
-- Name: act_tipoconcept(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_tipoconcept(p_id_tipoconcepto integer, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE tipoconcepto SET descripcion = p_descripcion
WHERE id_tipoconcepto = p_id_tipoconcepto;

END;

$$;


ALTER FUNCTION public.act_tipoconcept(p_id_tipoconcepto integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 873821)
-- Name: act_tipopago(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_tipopago(p_id_tipopago integer, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE tipopago SET descripcion = p_descripcion
WHERE id_tipopago = p_id_tipopago;

END;

$$;


ALTER FUNCTION public.act_tipopago(p_id_tipopago integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 873822)
-- Name: act_unidadmedid(integer, character varying, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_unidadmedid(p_id_unidadmedida integer, p_descripcion character varying, p_prefijo character varying, p_cant_unidad integer, p_equivalenteunidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE unidadmedida SET descripcion = p_descripcion,prefijo=p_prefijo,cant_unidad=p_cant_unidad,equivalenteunidad=p_equivalenteunidad
WHERE id_unidadmedida = p_id_unidadmedida;

END;

$$;


ALTER FUNCTION public.act_unidadmedid(p_id_unidadmedida integer, p_descripcion character varying, p_prefijo character varying, p_cant_unidad integer, p_equivalenteunidad integer) OWNER TO postgres;

--
-- TOC entry 275 (class 1255 OID 873823)
-- Name: elim_almacen(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_almacen(p_id_almacen integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE almacen SET estado = 0
WHERE id_almacen = p_id_almacen;

END;

$$;


ALTER FUNCTION public.elim_almacen(p_id_almacen integer) OWNER TO postgres;

--
-- TOC entry 276 (class 1255 OID 873824)
-- Name: elim_categoria(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_categoria(p_id_categoria integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE categoria SET estado = 0
WHERE id_categoria = p_id_categoria;

END;

$$;


ALTER FUNCTION public.elim_categoria(p_id_categoria integer) OWNER TO postgres;

--
-- TOC entry 277 (class 1255 OID 873825)
-- Name: elim_compra(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_compra(p_id_compra integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE compra SET estado = 0
WHERE id_compra = p_id_compra;

END;

$$;


ALTER FUNCTION public.elim_compra(p_id_compra integer) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 873826)
-- Name: elim_concepto(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_concepto(p_id_concepto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE concepto SET estado = 0
WHERE id_concepto = p_id_concepto;

END;

$$;


ALTER FUNCTION public.elim_concepto(p_id_concepto integer) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 873827)
-- Name: elim_detcompprod(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_detcompprod(p_id_compra integer, p_id_producto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

DELETE FROM detcompraproducto
WHERE id_compra= p_id_compra AND id_producto =p_id_producto ;

END;

$$;


ALTER FUNCTION public.elim_detcompprod(p_id_compra integer, p_id_producto integer) OWNER TO postgres;

--
-- TOC entry 280 (class 1255 OID 873828)
-- Name: elim_detprodum(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_detprodum(p_id_unidadmedida integer, p_id_producto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

DELETE FROM detproductounidmedida 
WHERE id_unidadmedida = p_id_unidadmedida AND id_producto=p_id_producto;

END;

$$;


ALTER FUNCTION public.elim_detprodum(p_id_unidadmedida integer, p_id_producto integer) OWNER TO postgres;

--
-- TOC entry 281 (class 1255 OID 873829)
-- Name: elim_detventa(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_detventa(p_id_venta integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

DELETE FROM detventa
WHERE id_venta= p_id_venta ;

END;

$$;


ALTER FUNCTION public.elim_detventa(p_id_venta integer) OWNER TO postgres;

--
-- TOC entry 282 (class 1255 OID 873830)
-- Name: elim_empleado(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_empleado(p_id_empleado integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE empleado SET estado = 0
WHERE id_empleado = p_id_empleado;

END;

$$;


ALTER FUNCTION public.elim_empleado(p_id_empleado integer) OWNER TO postgres;

--
-- TOC entry 283 (class 1255 OID 873831)
-- Name: elim_formapago(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_formapago(p_id_formapago integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE formapago SET estado = 0
WHERE id_formapago = p_id_formapago;

END;

$$;


ALTER FUNCTION public.elim_formapago(p_id_formapago integer) OWNER TO postgres;

--
-- TOC entry 284 (class 1255 OID 873832)
-- Name: elim_marca(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_marca(p_id_marca integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE marca SET estado = 0
WHERE id_marca = p_id_marca;

END;

$$;


ALTER FUNCTION public.elim_marca(p_id_marca integer) OWNER TO postgres;

--
-- TOC entry 375 (class 1255 OID 876104)
-- Name: elim_marcas(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_marcas(xid integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
begin
update marcas 
set estado=0
WHERE id = xid;

return '';   
end
;
$$;


ALTER FUNCTION public.elim_marcas(xid integer) OWNER TO postgres;

--
-- TOC entry 379 (class 1255 OID 876160)
-- Name: elim_motivomovimiento(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_motivomovimiento(p_id_motivomovimiento integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE motivomovimiento SET estado = 0
WHERE id_motivomovimiento = p_id_motivomovimiento;

END;

$$;


ALTER FUNCTION public.elim_motivomovimiento(p_id_motivomovimiento integer) OWNER TO postgres;

--
-- TOC entry 285 (class 1255 OID 873833)
-- Name: elim_movimiento(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_movimiento(p_id_movimiento integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE movimiento SET estado = 0
WHERE id_movimiento = p_id_movimiento;

END;

$$;


ALTER FUNCTION public.elim_movimiento(p_id_movimiento integer) OWNER TO postgres;

--
-- TOC entry 286 (class 1255 OID 873834)
-- Name: elim_param(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_param(p_id_param character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE param SET estado = 0
WHERE id_param = p_id_param;

END;

$$;


ALTER FUNCTION public.elim_param(p_id_param character varying) OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 873835)
-- Name: elim_producto(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_producto(p_id_producto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE producto SET estado = 0
WHERE id_producto = p_id_producto;

END;

$$;


ALTER FUNCTION public.elim_producto(p_id_producto integer) OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 873836)
-- Name: elim_productos(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_productos(xid integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
begin
update productos 
set estado=0
WHERE id = xid;

return '';   
end
;
$$;


ALTER FUNCTION public.elim_productos(xid integer) OWNER TO postgres;

--
-- TOC entry 289 (class 1255 OID 873837)
-- Name: elim_proveedor(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_proveedor(p_id_proveedor integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE proveedor SET estado = 0
WHERE id_proveedor = p_id_proveedor;

END;

$$;


ALTER FUNCTION public.elim_proveedor(p_id_proveedor integer) OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 873838)
-- Name: elim_sercomprob(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_sercomprob(p_id_seriecomprobante integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE seriecomprobante SET estado = 0
WHERE id_seriecomprobante = p_id_seriecomprobante;

END;

$$;


ALTER FUNCTION public.elim_sercomprob(p_id_seriecomprobante integer) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 873839)
-- Name: elim_subcategoria(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_subcategoria(p_id_subcategoria integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE subcategoria SET estado = 0
WHERE id_subcategoria = p_id_subcategoria;

END;

$$;


ALTER FUNCTION public.elim_subcategoria(p_id_subcategoria integer) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 873840)
-- Name: elim_sucursal(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_sucursal(p_id_sucursal integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE sucursal SET estado = 0
WHERE id_sucursal = p_id_sucursal;

END;

$$;


ALTER FUNCTION public.elim_sucursal(p_id_sucursal integer) OWNER TO postgres;

--
-- TOC entry 293 (class 1255 OID 873841)
-- Name: elim_tipcliente(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_tipcliente(p_id_tipocliente integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE tipocliente SET estado = 0
WHERE id_tipocliente = p_id_tipocliente;

END;

$$;


ALTER FUNCTION public.elim_tipcliente(p_id_tipocliente integer) OWNER TO postgres;

--
-- TOC entry 294 (class 1255 OID 873842)
-- Name: elim_tipopago(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_tipopago(p_id_tipopago integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE tipopago SET estado = 0
WHERE id_tipopago = p_id_tipopago;

END;

$$;


ALTER FUNCTION public.elim_tipopago(p_id_tipopago integer) OWNER TO postgres;

--
-- TOC entry 295 (class 1255 OID 873843)
-- Name: elim_unidmedida(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_unidmedida(p_id_unidadmedida integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE unidadmedida SET estado = 0
WHERE id_unidadmedida = p_id_unidadmedida;

END;

$$;


ALTER FUNCTION public.elim_unidmedida(p_id_unidadmedida integer) OWNER TO postgres;

--
-- TOC entry 296 (class 1255 OID 873844)
-- Name: elim_venta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION elim_venta(p_id_venta integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE venta SET estado = 0
WHERE id_venta = p_id_venta;

END;

$$;


ALTER FUNCTION public.elim_venta(p_id_venta integer) OWNER TO postgres;

--
-- TOC entry 370 (class 1255 OID 874961)
-- Name: ins_act_cliente(integer, character varying, character varying, character varying, timestamp without time zone, smallint, character varying, character varying, character varying, integer, integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_act_cliente(xidcliente integer, xnombres character varying, xapellidos character varying, xdocumento character varying, xfecha_nacimiento timestamp without time zone, xsexo smallint, xtelefono character varying, xemail character varying, xestado_civil character varying, xidprofesion integer, xidubigeo integer, xdireccion character varying, xtipo character varying, OUT x_idcliente integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
declare 
	xid integer;
begin
IF (xidcliente=0)
	then
		IF NOT EXISTS (SELECT idcliente FROM cliente)
			THEN
				INSERT into cliente VALUES (
				1,
				xnombres,
				xapellidos,
				xdocumento,
				xfecha_nacimiento,
				xsexo,
				xtelefono,
				xemail,
				xestado_civil,
				xidprofesion,
				xidubigeo,
				xdireccion,
				xtipo,
				1,
				200);
				RETURN QUERY
				select 1;
				RETURN;
		ELSE
				xid := (SELECT MAX(idcliente) FROM cliente)+1;
				INSERT into cliente(
				idcliente,
				nombres,
				apellidos,
				documento,
				fecha_nacimiento,
				sexo,
				telefono,
				email,
				estado_civil,
				idprofesion,
				idubigeo,
				direccion,
				tipo,
				estado,
				maximocredito)
				VALUES (
				xid,
				xnombres,
				xapellidos,
				xdocumento,
				xfecha_nacimiento,
				xsexo,
				xtelefono,
				xemail,
				xestado_civil,
				xidprofesion,
				xidubigeo,
				xdireccion,
				xtipo,
				1,
				200);
				RETURN QUERY
				select xid;
				RETURN;
			END if;
ELSE
		UPDATE cliente SET 
			nombres=xnombres,
			apellidos=xapellidos,
			documento=xdocumento,
			fecha_nacimiento=xfecha_nacimiento,
			sexo=xsexo,
			telefono=xtelefono,
			email=xemail,
			estado_civil=xestado_civil,
			idprofesion=xidprofesion,
			idubigeo=xidubigeo,
			direccion=xdireccion,
			tipo=xtipo
		WHERE idcliente=xidcliente;
	END if;
end;
$$;


ALTER FUNCTION public.ins_act_cliente(xidcliente integer, xnombres character varying, xapellidos character varying, xdocumento character varying, xfecha_nacimiento timestamp without time zone, xsexo smallint, xtelefono character varying, xemail character varying, xestado_civil character varying, xidprofesion integer, xidubigeo integer, xdireccion character varying, xtipo character varying, OUT x_idcliente integer) OWNER TO postgres;

--
-- TOC entry 297 (class 1255 OID 873846)
-- Name: ins_almacen(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_almacen(p_descripcion character varying, p_ubicacion character varying, p_id_sucursal integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$

BEGIN

INSERT INTO almacen (descripcion, ubicacion, estado, id_sucursal)
VALUES (p_descripcion, p_ubicacion, 1, p_id_sucursal);
RETURN QUERY
	select max(id_almacen) as ins_almacen from almacen where estado = 1;
RETURN;
END;

$$;


ALTER FUNCTION public.ins_almacen(p_descripcion character varying, p_ubicacion character varying, p_id_sucursal integer) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 873847)
-- Name: ins_categoria(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_categoria(p_descripcion character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO categoria (descripcion,estado)
VALUES (p_descripcion,1);
RETURN QUERY
	select max(id_categoria) as id_categoria FROM categoria;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_categoria(p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 299 (class 1255 OID 873848)
-- Name: ins_compra(integer, integer, date, numeric, character varying, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_compra(p_id_proveedor integer, p_id_tipopago integer, p_fechacompra date, p_monto numeric, p_nrodoc character varying, p_igv numeric) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO compra (id_proveedor,id_tipopago,fechacompra,monto,nrodoc,estado,igv,estadopago)
VALUES ( p_id_proveedor,p_id_tipopago,p_fechacompra,p_monto,p_nrodoc,1,p_igv,0);
RETURN QUERY
	select max(id_compra) as id_compra FROM compra;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_compra(p_id_proveedor integer, p_id_tipopago integer, p_fechacompra date, p_monto numeric, p_nrodoc character varying, p_igv numeric) OWNER TO postgres;

--
-- TOC entry 300 (class 1255 OID 873849)
-- Name: ins_concepto(character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_concepto(p_descripcion character varying, p_id_tipoconcepto integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO concepto (descripcion,estado,id_tipoconcepto)
VALUES (p_descripcion,1,p_id_tipoconcepto);
RETURN QUERY
	select max(id_concepto) as id_concepto FROM concepto;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_concepto(p_descripcion character varying, p_id_tipoconcepto integer) OWNER TO postgres;

--
-- TOC entry 301 (class 1255 OID 873850)
-- Name: ins_cronogcobro(integer, date, numeric, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_cronogcobro(p_id_venta integer, p_fecha date, p_monto_cuota numeric, p_nrocuota integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO cronogcobro (id_venta,fecha,monto_cuota,nrocuota,monto_cobrado)
VALUES (p_id_venta,p_fecha,p_monto_cuota,p_nrocuota,0.00);
RETURN QUERY
	select max(id_cronogcobro) as id_cronogcobro FROM cronogcobro;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_cronogcobro(p_id_venta integer, p_fecha date, p_monto_cuota numeric, p_nrocuota integer) OWNER TO postgres;

--
-- TOC entry 302 (class 1255 OID 873851)
-- Name: ins_cronogpago(integer, date, numeric, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_cronogpago(p_id_compra integer, p_fecha date, p_monto_cuota numeric, p_nrocuota integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO cronogpago (id_compra,fecha,monto_cuota,nrocuota,monto_pagado)
VALUES (p_id_compra,p_fecha,p_monto_cuota,p_nrocuota,0.00);
RETURN QUERY
	select max(id_cronogpago) as id_cronogpago FROM cronogpago;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_cronogpago(p_id_compra integer, p_fecha date, p_monto_cuota numeric, p_nrocuota integer) OWNER TO postgres;

--
-- TOC entry 303 (class 1255 OID 873852)
-- Name: ins_detamapago(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_detamapago(p_id_cronogpago integer, p_id_movimiento integer, p_monto integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO detamortizacionpago(id_cronogpago,id_movimiento,monto)
VALUES (p_id_cronogpago,p_id_movimiento,p_monto);
end;
$$;


ALTER FUNCTION public.ins_detamapago(p_id_cronogpago integer, p_id_movimiento integer, p_monto integer) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 873853)
-- Name: ins_detamcobro(integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_detamcobro(p_id_movimiento integer, p_id_cronogcobro integer, p_monto numeric) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO detamortizacioncobro (id_movimiento,id_cronogcobro,monto)
VALUES (p_id_movimiento,p_id_cronogcobro,p_monto);
end;
$$;


ALTER FUNCTION public.ins_detamcobro(p_id_movimiento integer, p_id_cronogcobro integer, p_monto numeric) OWNER TO postgres;

--
-- TOC entry 386 (class 1255 OID 876173)
-- Name: ins_detcompprod(integer, integer, integer, numeric, integer, integer, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_detcompprod(p_id_compra integer, p_id_producto integer, p_cantidadum integer, p_preciounitario numeric, p_id_unidadmedida integer, p_cantidadub integer, p_precioub numeric, p_stockactual numeric) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
declare p_stock numeric;
begin
INSERT INTO detcompraproducto (id_compra,id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub)
VALUES (p_id_compra, p_id_producto, p_cantidadum, p_preciounitario, p_id_unidadmedida, p_cantidadub, p_precioub);

UPDATE producto SET precioc = p_precioub
WHERE id_producto = p_id_producto;

p_stock := (SELECT stock FROM detprodalm WHERE id_almacen=1 and id_producto = p_id_producto) + p_cantidadub;

UPDATE detprodalm SET stock = p_stock
WHERE id_almacen=1 and id_producto = p_id_producto;

INSERT INTO kardex_producto (id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento)
VALUES (p_id_producto, p_cantidadub, now(), 1, p_stock, 4);


end;
$$;


ALTER FUNCTION public.ins_detcompprod(p_id_compra integer, p_id_producto integer, p_cantidadum integer, p_preciounitario numeric, p_id_unidadmedida integer, p_cantidadub integer, p_precioub numeric, p_stockactual numeric) OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 873855)
-- Name: ins_detprodalm(integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_detprodalm(p_id_almacen integer, p_id_producto integer, p_stock numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

INSERT INTO detprodalm (id_almacen, id_producto, stock)
VALUES (p_id_almacen, p_id_producto, p_stock);

END;

$$;


ALTER FUNCTION public.ins_detprodalm(p_id_almacen integer, p_id_producto integer, p_stock numeric) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 873856)
-- Name: ins_detprodum(integer, integer, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_detprodum(p_id_unidadmedida integer, p_id_producto integer, p_preciovcont numeric, p_preciovcre numeric) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO detproductounidmedida (id_unidadmedida,id_producto,preciovcont,preciovcre)
VALUES (p_id_unidadmedida,p_id_producto,p_preciovcont,p_preciovcre);
end;
$$;


ALTER FUNCTION public.ins_detprodum(p_id_unidadmedida integer, p_id_producto integer, p_preciovcont numeric, p_preciovcre numeric) OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 873857)
-- Name: ins_detventa(integer, integer, integer, numeric, integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_detventa(p_id_venta integer, p_id_producto integer, p_cantidadum integer, p_preciounitario numeric, p_id_unidadmedida integer, p_cantidadub integer, p_precioub numeric) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO detventa(id_venta,  id_producto, cantidadum,preciounitario,id_unidadmedida,cantidadub,precioub)
VALUES (p_id_venta,  p_id_producto, p_cantidadum,p_preciounitario,p_id_unidadmedida,p_cantidadub,p_precioub);

end;
$$;


ALTER FUNCTION public.ins_detventa(p_id_venta integer, p_id_producto integer, p_cantidadum integer, p_preciounitario numeric, p_id_unidadmedida integer, p_cantidadub integer, p_precioub numeric) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 873858)
-- Name: ins_empleado(character varying, character varying, character varying, character varying, character, date, character varying, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_empleado(p_nombre character varying, p_apellido character varying, p_direccion character varying, p_telefono character varying, p_dni character, p_fechanacimiento date, p_usuario character varying, p_clave character varying, p_id_perfil integer, p_id_sucursal integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO empleado ( nombre,apellido,direccion ,dni,fechanacimiento,estado, usuario ,clave, id_perfil,telefono,id_sucursal)
VALUES ( p_nombre,p_apellido,p_direccion ,p_dni,p_fechanacimiento,1, p_usuario ,p_clave, p_id_perfil,p_telefono,p_id_sucursal);
RETURN QUERY
select max(id_empleado) as id_empleado FROM empleado;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_empleado(p_nombre character varying, p_apellido character varying, p_direccion character varying, p_telefono character varying, p_dni character, p_fechanacimiento date, p_usuario character varying, p_clave character varying, p_id_perfil integer, p_id_sucursal integer) OWNER TO postgres;

--
-- TOC entry 309 (class 1255 OID 873859)
-- Name: ins_formapago(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_formapago(p_descripcion character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO formapago (descripcion,estado)
VALUES (p_descripcion,1);
RETURN QUERY
	select max(id_formapago) as id_formapago FROM formapago;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_formapago(p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 310 (class 1255 OID 873860)
-- Name: ins_marca(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_marca(p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

INSERT INTO marca (descripcion, estado )
VALUES (p_descripcion, 1);

END;

$$;


ALTER FUNCTION public.ins_marca(p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 378 (class 1255 OID 876159)
-- Name: ins_motivomovimiento(character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_motivomovimiento(p_descripcion character varying, p_id_tipomovimiento integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO motivomovimiento (descripcion,estado,id_tipomovimiento)
VALUES (p_descripcion,1,p_id_tipomovimiento);
end;
$$;


ALTER FUNCTION public.ins_motivomovimiento(p_descripcion character varying, p_id_tipomovimiento integer) OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 873861)
-- Name: ins_movimiento(integer, integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_movimiento(xidcaja integer, xidconcepto integer, xidformapago integer, xmonto numeric, OUT x_idmovimiento integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO movimiento (id_caja,id_concepto,id_formapago,monto,estado)
VALUES (xidcaja, xidconcepto, xidformapago, xmonto, 1);
RETURN QUERY
	select max(id_movimiento) as id_movimiento FROM movimiento;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_movimiento(xidcaja integer, xidconcepto integer, xidformapago integer, xmonto numeric, OUT x_idmovimiento integer) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 876231)
-- Name: ins_movimiento(integer, integer, integer, numeric, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_movimiento(xidcaja integer, xidconcepto integer, xidformapago integer, xmonto numeric, xfecha timestamp without time zone, OUT x_idmovimiento integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO movimiento (id_caja,id_concepto,id_formapago,monto,estado,fecha)
VALUES (xidcaja, xidconcepto, xidformapago, xmonto, 1, xfecha);
RETURN QUERY
	select max(id_movimiento) as id_movimiento FROM movimiento;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_movimiento(xidcaja integer, xidconcepto integer, xidformapago integer, xmonto numeric, xfecha timestamp without time zone, OUT x_idmovimiento integer) OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 873862)
-- Name: ins_param(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_param(p_id_param character varying, p_valor character varying, p_descripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

INSERT INTO param (id_param, valor, descripcion, estado )
VALUES (p_id_param, p_valor, p_descripcion, 1);

END;

$$;


ALTER FUNCTION public.ins_param(p_id_param character varying, p_valor character varying, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 873863)
-- Name: ins_producto(integer, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_producto(p_id_marca integer, p_id_subcategoria integer, p_descripcion character varying, p_id_unidadmedida integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO producto (id_marca,id_subcategoria,descripcion,estado,precioc,id_unidadmedida)
VALUES (p_id_marca,p_id_subcategoria,p_descripcion,1,0.00, p_id_unidadmedida );
RETURN QUERY
	select max(id_producto) as id_producto FROM producto;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_producto(p_id_marca integer, p_id_subcategoria integer, p_descripcion character varying, p_id_unidadmedida integer) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 873864)
-- Name: ins_proveedor(character varying, character varying, character varying, character varying, character varying, character, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_proveedor(p_nombre character varying, p_direccion character varying, p_razonsocial character varying, p_email character varying, p_ciudad character varying, p_ruc character, p_telefmovil character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO proveedor ( nombre, direccion,razonsocial,email,ciudad,estado,ruc,telefmovil)
VALUES ( p_nombre, p_direccion,p_razonsocial,p_email,p_ciudad,1,p_ruc,p_telefmovil);
RETURN QUERY
	select max(id_proveedor) as id_proveedor FROM proveedor;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_proveedor(p_nombre character varying, p_direccion character varying, p_razonsocial character varying, p_email character varying, p_ciudad character varying, p_ruc character, p_telefmovil character varying) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 873865)
-- Name: ins_seriecomprb(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_seriecomprb(p_serie integer, p_id_tipocomprobante integer, p_maximocorrelativo integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO seriecomprobante (serie,correlativo,id_tipocomprobante,maxcorrelativo ,estado)
VALUES (p_serie,0,p_id_tipocomprobante,p_maximocorrelativo, 1 );
RETURN QUERY
	select max(id_seriecomprobante) as id_seriecomprobante FROM seriecomprobante;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_seriecomprb(p_serie integer, p_id_tipocomprobante integer, p_maximocorrelativo integer) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 873866)
-- Name: ins_subcategoria(character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_subcategoria(p_descripcion character varying, p_id_categoria integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO subcategoria (descripcion,estado,id_categoria)
VALUES (p_descripcion,1,p_id_categoria);
RETURN QUERY
	select max(id_subcategoria) as id_subcategoria FROM subcategoria;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_subcategoria(p_descripcion character varying, p_id_categoria integer) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 873867)
-- Name: ins_sucursal(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_sucursal(p_nombre character varying, p_direccion character varying, p_telefono character varying, p_ciudad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

INSERT INTO sucursal (nombre, direccion, telefono, ciudad, estado )
VALUES (p_nombre, p_direccion, p_telefono, p_ciudad, 1);

END;

$$;


ALTER FUNCTION public.ins_sucursal(p_nombre character varying, p_direccion character varying, p_telefono character varying, p_ciudad character varying) OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 873868)
-- Name: ins_tipocliente(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_tipocliente(p_descripcion character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO tipocliente (descripcion,estado)
VALUES (descripcion,1);
RETURN QUERY
	select max(id_tipocliente) as id_tipocliente FROM tipocliente;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_tipocliente(p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 873869)
-- Name: ins_tipopago(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_tipopago(p_descripcion character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO tipopago (descripcion,estado)
VALUES (descripcion,1);
RETURN QUERY
	select max(id_tipopago) as id_tipopago FROM tipopago;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_tipopago(p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 320 (class 1255 OID 873870)
-- Name: ins_unidadmedida(character varying, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_unidadmedida(p_descripcion character varying, p_prefijo character varying, p_cant_unidad integer, p_equivalenteunidad integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO unidadmedida (descripcion,prefijo,estado,cant_unidad,equivalenteunidad)
VALUES (p_descripcion,p_prefijo,1,p_cant_unidad,p_equivalenteunidad);
RETURN QUERY
select max(id_unidadmedida) as id_unidadmedida FROM unidadmedida;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_unidadmedida(p_descripcion character varying, p_prefijo character varying, p_cant_unidad integer, p_equivalenteunidad integer) OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 873871)
-- Name: ins_venta(integer, integer, integer, timestamp without time zone, numeric, numeric, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_venta(p_id_cliente integer, p_id_empleado integer, p_id_tipopago integer, p_fechaventa timestamp without time zone, p_subtotal numeric, p_igv numeric, p_id_tipocomprobante integer, p_nrodoc character varying, p_id_almacen integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO venta ( idcliente,id_empleado,id_tipopago,fechaventa,estado,subtotal,igv,id_tipocomprobante,nrodoc,estadopago, id_almacen)
VALUES ( p_id_cliente,p_id_empleado,p_id_tipopago,p_fechaventa,1,p_subtotal,p_igv,p_id_tipocomprobante,p_nrodoc,0, p_id_almacen);
RETURN QUERY
	select max(id_venta) as ins_venta FROM venta;
RETURN;
end;
$$;


ALTER FUNCTION public.ins_venta(p_id_cliente integer, p_id_empleado integer, p_id_tipopago integer, p_fechaventa timestamp without time zone, p_subtotal numeric, p_igv numeric, p_id_tipocomprobante integer, p_nrodoc character varying, p_id_almacen integer) OWNER TO postgres;

--
-- TOC entry 373 (class 1255 OID 873872)
-- Name: insact_caja(integer, integer, timestamp without time zone, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insact_caja(xidcaja integer, xidempleado integer, xfecha timestamp without time zone, xestado integer, p_id_sucursal integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare 
	xid integer;
	xsaldo decimal(18,2);
begin
IF (xidcaja=0)
	THEN
		IF NOT EXISTS (SELECT id_caja FROM caja WHERE id_sucursal = p_id_sucursal)
			then
				INSERT into caja (
				id_empleado,
				fecha_hora_ap,
				saldo_ap,
				fecha_hora_ci,
				saldo_ci,
				estado,
				id_sucursal)
				VALUES (
				xidempleado,
				xfecha,
				400,
				'1990-01-01 00:00:00',
				400,
				xestado, 
				p_id_sucursal);
		ELSE
				xsaldo :=(SELECT saldo_ci FROM caja WHERE id_sucursal = p_id_sucursal ORDER BY id_caja DESC LIMIT 1);
				INSERT into caja(
				id_empleado,
				fecha_hora_ap,
				saldo_ap,
				fecha_hora_ci,
				saldo_ci,
				estado,
				id_sucursal)
				VALUES (
				xidempleado,
				xfecha,
				xsaldo,
				'1990-01-01 00:00:00',
				xsaldo,
				1,
				p_id_sucursal);
			END if;
ELSE
		xid := (SELECT MAX(id_caja) FROM caja WHERE id_sucursal = p_id_sucursal);
		xsaldo :=(SELECT saldo_ap FROM caja WHERE id_caja=xid);
		UPDATE caja SET 
			fecha_hora_ci=xfecha,
			estado=xestado
		WHERE id_caja=xid and id_sucursal = p_id_sucursal;
	END if;
end;
$$;


ALTER FUNCTION public.insact_caja(xidcaja integer, xidempleado integer, xfecha timestamp without time zone, xestado integer, p_id_sucursal integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 232 (class 1259 OID 876094)
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE marcas (
    id integer NOT NULL,
    titulo character varying(100),
    cuerpo text,
    imagen character varying(50),
    estado integer
);


ALTER TABLE public.marcas OWNER TO postgres;

--
-- TOC entry 374 (class 1255 OID 876103)
-- Name: insact_marcaweb(integer, character varying, text, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insact_marcaweb(xidmarca integer, xtitulo character varying, xcuerpo text, ximagen character varying) RETURNS SETOF marcas
    LANGUAGE plpgsql
    AS $$
declare xid integer;
begin
IF (xidmarca=0)
	THEN
		IF NOT EXISTS (SELECT id FROM marcas)
		THEN
				INSERT into marcas VALUES (
				1,
				xtitulo,
				xcuerpo,
				ximagen,
				1);
		ELSE
				xid := (SELECT MAX(id) FROM marcas)+1;
				INSERT into marcas(
				id,
				titulo,
				cuerpo,
				imagen,
				estado)
				VALUES (
				xid,
				xtitulo,
				xcuerpo,
				ximagen,
				1);
			END if;
ELSE
		UPDATE marcas SET 
			titulo=xtitulo,
			cuerpo=xcuerpo,
			imagen=ximagen
		WHERE id=xidmarca;
	END if;
end;
$$;


ALTER FUNCTION public.insact_marcaweb(xidmarca integer, xtitulo character varying, xcuerpo text, ximagen character varying) OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 873873)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productos (
    id integer NOT NULL,
    titulo character varying(300) DEFAULT NULL::character varying,
    cuerpo text,
    imagen character varying(50) DEFAULT NULL::character varying,
    tipo smallint,
    estado smallint,
    id_subcategoria integer
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 366 (class 1255 OID 874955)
-- Name: insact_prod(integer, character varying, text, character varying, smallint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insact_prod(xidprod integer, xtitulo character varying, xcuerpo text, ximagen character varying, xtipo smallint, xidsubcat integer) RETURNS SETOF productos
    LANGUAGE plpgsql
    AS $$
declare xid integer;
begin
IF (xidprod=0)
	THEN
		IF NOT EXISTS (SELECT id FROM productos)
		THEN
				INSERT into productos VALUES (
				1,
				xtitulo,
				xcuerpo,
				ximagen,
				xtipo,
				1,
				xidsubcat);
		ELSE
				xid := (SELECT MAX(id) FROM productos)+1;
				INSERT into productos(
				id,
				titulo,
				cuerpo,
				imagen,
				tipo,
				estado,
				id_subcategoria)
				VALUES (
				xid,
				xtitulo,
				xcuerpo,
				ximagen,
				xtipo,
				1,
				xidsubcat);
			END if;
ELSE
		UPDATE productos SET 
			titulo=xtitulo,
			cuerpo=xcuerpo,
			imagen=ximagen,
			tipo=xtipo,
			id_subcategoria=xidsubcat
		WHERE id=xidprod;
	END if;
end;
$$;


ALTER FUNCTION public.insact_prod(xidprod integer, xtitulo character varying, xcuerpo text, ximagen character varying, xtipo smallint, xidsubcat integer) OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 873882)
-- Name: pa_act_informacion(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_act_informacion(xconocenos text, xmision text, xvision text) RETURNS void
    LANGUAGE plpgsql
    AS $$
 begin
UPDATE informacion SET 
	mision=xmision,
	vision=xvision,
	conocenos=xconocenos
WHERE id=1;
end;
$$;


ALTER FUNCTION public.pa_act_informacion(xconocenos text, xmision text, xvision text) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 873883)
-- Name: pa_elimina_modulos(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_elimina_modulos(xid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
UPDATE modulos SET estado = 0
WHERE idmodulo = xid;
end
;
$$;


ALTER FUNCTION public.pa_elimina_modulos(xid integer) OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 873884)
-- Name: pa_elimina_perfil(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_elimina_perfil(xid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
UPDATE perfil SET estado = 0
WHERE id_perfil = xid;
end;
$$;


ALTER FUNCTION public.pa_elimina_perfil(xid integer) OWNER TO postgres;

--
-- TOC entry 325 (class 1255 OID 873885)
-- Name: pa_elimina_permisos(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_elimina_permisos(xid_perfil integer, xidmodulo integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare xmensaje character varying;
begin

	UPDATE permisos set estado=0
	WHERE id_perfil=xid_perfil AND idmodulo=xidmodulo;

return '';
end
;
$$;


ALTER FUNCTION public.pa_elimina_permisos(xid_perfil integer, xidmodulo integer) OWNER TO postgres;

--
-- TOC entry 326 (class 1255 OID 873886)
-- Name: pa_inserta_actualiza_modulos(integer, character varying, character varying, smallint, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_inserta_actualiza_modulos(xidmodulo integer, xdescripcion character varying, xurl character varying, xestado smallint, xidmodulo_padre integer, xicono character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare 
	xid integer;
begin
IF (xidmodulo=0)
	THEN
		IF NOT EXISTS (SELECT idmodulo FROM modulos)
			THEN
				INSERT into modulos VALUES (
				1,
				xdescripcion,
				xurl,
				xestado,
				xidmodulo_padre,
				xicono);
		ELSE
				xid := (SELECT MAX(idmodulo) FROM modulos)+1;
				INSERT into modulos(
				idmodulo,
				descripcion,
				url,
				estado,
				idmodulo_padre,
				icono)
				VALUES (
				xid,
				xdescripcion,
				xurl,
				xestado,
				xidmodulo_padre,
				xicono);
			END if;
ELSE
		UPDATE modulos SET 
			descripcion=xdescripcion,
			url=xurl,
			estado=xestado,
			idmodulo_padre= xidmodulo_padre,
			icono=xicono
		WHERE idmodulo=xidmodulo;
	END if;
end;
$$;


ALTER FUNCTION public.pa_inserta_actualiza_modulos(xidmodulo integer, xdescripcion character varying, xurl character varying, xestado smallint, xidmodulo_padre integer, xicono character varying) OWNER TO postgres;

--
-- TOC entry 327 (class 1255 OID 873887)
-- Name: pa_inserta_actualiza_perfil(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_inserta_actualiza_perfil(xid_perfil integer, xdescripcion character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare 
	xid integer;
begin
IF (xid_perfil=0)
	THEN
		IF NOT EXISTS (SELECT id_perfil FROM perfil)
			THEN
				INSERT into perfil VALUES (
				1,
				xdescripcion, 1);
		ELSE
				xid := (SELECT MAX(id_perfil) FROM perfil)+1;
				INSERT into perfil(
				id_perfil,
				descripcion, estado)
				VALUES (
				xid,
				xdescripcion, 1);
			END if;
ELSE
		UPDATE perfil SET 
			descripcion=xdescripcion
		WHERE id_perfil=xid_perfil;
end if;
end;
$$;


ALTER FUNCTION public.pa_inserta_actualiza_perfil(xid_perfil integer, xdescripcion character varying) OWNER TO postgres;

--
-- TOC entry 328 (class 1255 OID 873888)
-- Name: pa_inserta_actualiza_permisos(integer, integer, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_inserta_actualiza_permisos(xid_perfil integer, xidmodulo integer, xestado smallint) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare 
	xid integer;
begin
	IF NOT EXISTS (select * from permisos where id_perfil=xid_perfil and idmodulo=xidmodulo)
		THEN
		INSERT into permisos(id_perfil, idmodulo, estado) VALUES(xid_perfil,xidmodulo, xestado);	
	ELSE
		UPDATE permisos SET 
				estado=xestado
		WHERE id_perfil=xid_perfil and idmodulo=xidmodulo;
		END if;
end;
$$;


ALTER FUNCTION public.pa_inserta_actualiza_permisos(xid_perfil integer, xidmodulo integer, xestado smallint) OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 873889)
-- Name: informacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE informacion (
    id integer NOT NULL,
    mision text,
    vision text,
    conocenos text
);


ALTER TABLE public.informacion OWNER TO postgres;

--
-- TOC entry 329 (class 1255 OID 873895)
-- Name: pa_sel_informacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_sel_informacion() RETURNS SETOF informacion
    LANGUAGE plpgsql
    AS $$

BEGIN
IF EXISTS(SELECT * FROM informacion WHERE id=1)
	THEN
	return query
	SELECT * FROM informacion WHERE id=1;
		return;
ELSE
	RAISE EXCEPTION 'Nonexistent ID --> %', xid;
return;
	
END if;
END;
$$;


ALTER FUNCTION public.pa_sel_informacion() OWNER TO postgres;

--
-- TOC entry 330 (class 1255 OID 873896)
-- Name: pa_selecciona_login(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_selecciona_login(xusuario character varying, xclave character varying, OUT id_empleado integer, OUT nombre character varying, OUT apellido character varying, OUT direccion character varying, OUT dni character, OUT fechanacimiento date, OUT estado integer, OUT usuario character varying, OUT clave character varying, OUT id_perfil integer, OUT telefono character varying, OUT id_sucursal integer, OUT descripcion character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (xclave='')
	THEN 
	 return query
		SELECT *, '' FROM empleado WHERE usuario=xusuario;
		return; 
		ELSE
		return query
		SELECT e.*, p.descripcion FROM empleado as e inner join perfil as p on e.id_perfil=p.id_perfil
		WHERE e.usuario=xusuario AND e.clave = xclave;
		return;
	END if;
end
;
$$;


ALTER FUNCTION public.pa_selecciona_login(xusuario character varying, xclave character varying, OUT id_empleado integer, OUT nombre character varying, OUT apellido character varying, OUT direccion character varying, OUT dni character, OUT fechanacimiento date, OUT estado integer, OUT usuario character varying, OUT clave character varying, OUT id_perfil integer, OUT telefono character varying, OUT id_sucursal integer, OUT descripcion character varying) OWNER TO postgres;

--
-- TOC entry 331 (class 1255 OID 873897)
-- Name: pa_selecciona_modulos(integer, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_selecciona_modulos(xid integer, xdescripcion character varying, xmodulo_padre character varying, xid_perfil integer, OUT idmodulo integer, OUT descripcion character varying, OUT m_url character varying, OUT estado smallint, OUT idmodulo_padre integer, OUT icono character varying, OUT xmodulos character varying, OUT modulos_hijos character varying, OUT url character varying, OUT modulo_padre character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF (xid = 0 and xdescripcion='' and xmodulo_padre='')
THEN
return query
	SELECT	M.* , M.descripcion, M.descripcion, M.url,
	P.descripcion
	FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
	WHERE M.idmodulo<>0 and M.estado<>0;
	return;
END IF;
IF (xid = 0 and xdescripcion<>'' and xmodulo_padre='')
	THEN
	return query
	SELECT	M.* , M.descripcion, M.descripcion, M.url,
	P.descripcion
	FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
	WHERE M.idmodulo<>0 and M.descripcion LIKE '%'||xdescripcion||'%' and M.estado<>0;
	return;
	END IF;

IF (xid = 0 and xdescripcion='' and xmodulo_padre<>'')
	THEN
	return query
	SELECT	M.* , M.descripcion, M.descripcion, M.url,
	P.descripcion
	FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
	WHERE M.idmodulo<>0 and P.descripcion LIKE '%'||xmodulo_padre||'%' and M.estado<>0;
	return;
	END IF;
	
IF(xid=9999 and xdescripcion='' and xmodulo_padre='')
	THEN
	return query
		select m.*, m.descripcion, mo.descripcion , mo.url,
		mo.descripcion
		from modulos as m inner join modulos as mo on(m.idmodulo=mo.idmodulo_padre)
		inner join permisos as per on  (per.idmodulo=mo.idmodulo)
		where m.idmodulo<>0 and per.id_perfil=xid_perfil and per.estado=1 and m.estado=1 and mo.estado = 1
		order by m.idmodulo;
		return;
ELSE
		IF EXISTS(SELECT modulos.* FROM modulos WHERE modulos.idmodulo=xid)
			THEN
			return query
				SELECT	M.* , M.descripcion , M.descripcion , M.url,
				P.descripcion
				FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
				WHERE M.idmodulo=xid AND M.idmodulo<>0 and M.estado<>0;
			 return;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.pa_selecciona_modulos(xid integer, xdescripcion character varying, xmodulo_padre character varying, xid_perfil integer, OUT idmodulo integer, OUT descripcion character varying, OUT m_url character varying, OUT estado smallint, OUT idmodulo_padre integer, OUT icono character varying, OUT xmodulos character varying, OUT modulos_hijos character varying, OUT url character varying, OUT modulo_padre character varying) OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 873898)
-- Name: modulos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE modulos (
    idmodulo integer NOT NULL,
    descripcion character varying(50) DEFAULT NULL::character varying,
    url character varying(200) DEFAULT NULL::character varying,
    estado smallint,
    idmodulo_padre integer NOT NULL,
    icono character varying(100)
);


ALTER TABLE public.modulos OWNER TO postgres;

--
-- TOC entry 332 (class 1255 OID 873903)
-- Name: pa_selecciona_modulos_p(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_selecciona_modulos_p(xid integer) RETURNS SETOF modulos
    LANGUAGE plpgsql
    AS $$
begin
IF (xid = 0)
THEN
return query
SELECT * FROM modulos WHERE idmodulo_padre = 0;
return;
ELSE
IF EXISTS(SELECT * FROM modulos WHERE idmodulo=xid)
then
return query
SELECT * FROM modulos WHERE idmodulo_padre = 0 AND idmodulo=xid;
return;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.pa_selecciona_modulos_p(xid integer) OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 873904)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil (
    id_perfil integer NOT NULL,
    descripcion character varying(50) DEFAULT NULL::character varying,
    estado smallint
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 333 (class 1255 OID 873908)
-- Name: pa_selecciona_perfil(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_selecciona_perfil(xid integer, xdescripcion character varying) RETURNS SETOF perfil
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (xid = 0 and xdescripcion='')
		THEN 
	 return query
		SELECT * FROM perfil
		where id_perfil<>0 and estado<>0;
		RETURN;
	END if;
IF (xid = 0 and xdescripcion<>'')
		THEN 
	 return query
		SELECT * FROM perfil
		where id_perfil<>0 and descripcion LIKE '%'||xdescripcion||'%' and estado<>0;
		return;
	END if;
IF (xid <> 0 and xdescripcion='')
		THEN 
		IF EXISTS(SELECT * FROM perfil WHERE id_perfil=xid)
				THEN 
	 return query
				SELECT * FROM perfil WHERE id_perfil=xid and estado<>0;
				return; 
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.pa_selecciona_perfil(xid integer, xdescripcion character varying) OWNER TO postgres;

--
-- TOC entry 334 (class 1255 OID 873909)
-- Name: pa_selecciona_permisos(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pa_selecciona_permisos(xid_perfil integer, xidmodulo integer, OUT id_perfil integer, OUT idmodulo integer, OUT estado smallint, OUT pperfil character varying, OUT mmodulo character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (xid_perfil = 0 AND xidmodulo=0)
		THEN 
	 return query
		SELECT p.*, per.descripcion, m.descripcion
		FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo);
	END if;
IF (xid_perfil <> 0 AND xidmodulo=0)
		THEN 
	 return query
				SELECT p.*,per.descripcion, m.descripcion 
				FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo)
						WHERE p.id_perfil=xid_perfil AND p.estado=1;	
		return; 
		ELSE
		IF EXISTS(SELECT permisos.* FROM permisos WHERE permisos.id_perfil=xid_perfil AND permisos.idmodulo=xidmodulo)
				THEN 
	 return query
				SELECT p.*, per.descripcion, m.descripcion
		FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo)
						WHERE p.id_perfil=xid_perfil AND p.idmodulo=xidmodulo;
			return; 
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.pa_selecciona_permisos(xid_perfil integer, xidmodulo integer, OUT id_perfil integer, OUT idmodulo integer, OUT estado smallint, OUT pperfil character varying, OUT mmodulo character varying) OWNER TO postgres;

--
-- TOC entry 335 (class 1255 OID 873910)
-- Name: rep_productos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rep_productos(OUT xproducto character varying, OUT valor numeric) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

return query
	select p.descripcion, dv.preciounitario*sum(dv.cantidadum)
	from producto as p inner join detventa as dv on p.id_producto=dv.id_producto 
	group by p.descripcion,  dv.preciounitario
	limit 5;
	return;

END;

$$;


ALTER FUNCTION public.rep_productos(OUT xproducto character varying, OUT valor numeric) OWNER TO postgres;

--
-- TOC entry 369 (class 1255 OID 876174)
-- Name: rep_stock_almacen(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rep_stock_almacen(p_id_almacen integer, OUT id_almacen integer, OUT id_producto integer, OUT stock numeric, OUT aalmacen character varying, OUT pproducto character varying, OUT ssubcategoria character varying, OUT ccategoria character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
return query
SELECT pa.* , a.descripcion, p.descripcion, sc.descripcion, cat.descripcion
FROM detprodalm pa 
	inner join producto p on pa.id_producto = p.id_producto
	inner join almacen a on pa.id_almacen=a.id_almacen
	inner join subcategoria sc on sc.id_subcategoria=p.id_subcategoria
	inner join categoria cat on cat.id_categoria=sc.id_categoria 
WHERE a.estado = 1 and p.estado = 1 and a.id_almacen = p_id_almacen and pa.stock <> 0
ORDER BY a.id_almacen;
end
;
$$;


ALTER FUNCTION public.rep_stock_almacen(p_id_almacen integer, OUT id_almacen integer, OUT id_producto integer, OUT stock numeric, OUT aalmacen character varying, OUT pproducto character varying, OUT ssubcategoria character varying, OUT ccategoria character varying) OWNER TO postgres;

--
-- TOC entry 336 (class 1255 OID 873911)
-- Name: rep_ventas(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rep_ventas(xanio integer, OUT cantidad numeric) RETURNS SETOF numeric
    LANGUAGE plpgsql
    AS $$
BEGIN
return query

select COALESCE(resumen.total,0) from (SELECT SUM((venta.subtotal*venta.igv)+venta.subtotal) as total, date_part('Month',venta.fechaventa) as mes 
from detventa inner join venta on (detventa.id_venta=venta.id_venta) 
where detventa.id_venta<>0 and date_part('Year',fechaventa)=xanio
group by date_part('Month',venta.fechaventa) ) resumen
right outer join 
(select 1 as mes union all select 2 union all select 3 union all select 4 as mes union all select 5 union all select 6 union all
select 7 as mes union all select 8 union all select 9 union all select 10 as mes union all select 11 union all select 12 ) meses
on meses.mes = resumen.mes;
return;
end
;
$$;


ALTER FUNCTION public.rep_ventas(xanio integer, OUT cantidad numeric) OWNER TO postgres;

--
-- TOC entry 337 (class 1255 OID 873912)
-- Name: sel_almacen(integer, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_almacen(p_id_almacen integer, p_descripcion character varying, p_ubicacion character varying, p_sucursal character varying, p_id_sucursal integer, OUT id_almacen integer, OUT descripcion character varying, OUT ubicacion character varying, OUT estado integer, OUT id_sucursal integer, OUT nombre character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_almacen = 0 AND p_descripcion = '' AND p_ubicacion = '' AND p_sucursal = '' AND p_id_sucursal = 0)
	THEN
	return query
		SELECT a.*, s.nombre FROM almacen a inner join sucursal s on a.id_sucursal = s.id_sucursal 
		WHERE a.id_almacen<>0 and a.estado = 1 and s.estado = 1;
	return;
END if;
IF (p_id_almacen = 0 AND p_descripcion <> '' AND p_ubicacion = '' AND p_sucursal = '' AND p_id_sucursal = 0)
	THEN
	return query
		SELECT a.*, s.nombre FROM almacen a inner join sucursal s on a.id_sucursal = s.id_sucursal 
		WHERE a.id_almacen<>0 and a.estado = 1 and s.estado = 1 and a.descripcion  LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_almacen = 0 AND p_descripcion = '' AND p_ubicacion <> '' AND p_sucursal = '' AND p_id_sucursal = 0)
	THEN
	return query
		SELECT a.*, s.nombre FROM almacen a inner join sucursal s on a.id_sucursal = s.id_sucursal 
		WHERE a.id_almacen<>0 and a.estado = 1 and s.estado = 1 and a.ubicacion  LIKE '%'||p_ubicacion|| '%';
	return;
END if;
IF (p_id_almacen = 0 AND p_descripcion = '' AND p_ubicacion = '' AND p_sucursal <> '' AND p_id_sucursal = 0)
	THEN
	return query
		SELECT a.*, s.nombre FROM almacen a inner join sucursal s on a.id_sucursal = s.id_sucursal 
		WHERE a.id_almacen<>0 and a.estado = 1 and s.estado = 1 and s.nombre  LIKE '%'||p_sucursal|| '%';
	return;
END if;
IF (p_id_almacen = 0 AND p_descripcion = '' AND p_ubicacion = '' AND p_sucursal = '' AND p_id_sucursal <> 0)
	THEN
	return query
		SELECT a.*, s.nombre FROM almacen a inner join sucursal s on a.id_sucursal = s.id_sucursal 
		WHERE a.id_almacen<>0 and a.estado = 1 and s.estado = 1 and a.id_sucursal = p_id_sucursal;
	return;
END if;
IF (p_id_almacen <> 0 AND p_descripcion = '' AND p_ubicacion = '' AND p_sucursal = '' AND p_id_sucursal = 0)
	THEN
	return query
		SELECT a.*, s.nombre FROM almacen a inner join sucursal s on a.id_sucursal = s.id_sucursal 
		WHERE a.id_almacen<>0 and a.estado = 1 and s.estado = 1 and a.id_almacen = p_id_almacen;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_almacen(p_id_almacen integer, p_descripcion character varying, p_ubicacion character varying, p_sucursal character varying, p_id_sucursal integer, OUT id_almacen integer, OUT descripcion character varying, OUT ubicacion character varying, OUT estado integer, OUT id_sucursal integer, OUT nombre character varying) OWNER TO postgres;

--
-- TOC entry 338 (class 1255 OID 873913)
-- Name: sel_caja(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_caja(xid integer, xempleado character varying, p_id_sucursal integer, OUT id_caja integer, OUT id_empleado integer, OUT fecha_hora_ap timestamp without time zone, OUT saldo_ap numeric, OUT fecha_hora_ci timestamp without time zone, OUT saldo_ci numeric, OUT estado integer, OUT id_sucursal integer, OUT a_fecha text, OUT c_fecha text, OUT empleado_n character varying, OUT empleado_a character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF (xid = 0 and xempleado='')
	THEN
		return query 
		SELECT c.*, to_char(c.fecha_hora_ap,'dd-MM-yyyy / HH24:mi:ss'), to_char(c.fecha_hora_ci,'dd-MM-yyyy / HH24:mi:ss') , e.nombre, e.apellido
		FROM caja as c inner join empleado as e on(c.id_empleado=e.id_empleado)
		WHERE c.id_sucursal = p_id_sucursal
		ORDER BY c.id_caja DESC;
		return;
	END if;
IF (xid = 0 and xempleado<>'')
	THEN
		return query 
		SELECT c.*, to_char(c.fecha_hora_ap,'dd-MM-yyyy / HH24:mi:ss'), to_char(c.fecha_hora_ci,'dd-MM-yyyy / HH24:mi:ss') , e.nombre, e.apellido
		FROM caja as c inner join empleado as e on(c.id_empleado=e.id_empleado)
		where e.nombre like '%'||xempleado||'%' or e.apellido like '%'||xempleado||'%' and c.id_sucursal = p_id_sucursal
		ORDER BY c.id_caja DESC;
		return;
	
	END	 if;
IF (xid <>0 and xempleado='')
	THEN
		IF EXISTS(SELECT * FROM caja WHERE caja.id_caja=xid)
			THEN
		return query 
		SELECT c.*, to_char(c.fecha_hora_ap,'dd-MM-yyyy / HH24:mi:ss'), to_char(c.fecha_hora_ci,'dd-MM-yyyy / HH24:mi:ss') , e.nombre, e.apellido
		FROM caja as c inner join empleado as e on(c.id_empleado=e.id_empleado)
		 WHERE c.id_caja=xid and c.id_sucursal = p_id_sucursal;
		return;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;

end
;
$$;


ALTER FUNCTION public.sel_caja(xid integer, xempleado character varying, p_id_sucursal integer, OUT id_caja integer, OUT id_empleado integer, OUT fecha_hora_ap timestamp without time zone, OUT saldo_ap numeric, OUT fecha_hora_ci timestamp without time zone, OUT saldo_ci numeric, OUT estado integer, OUT id_sucursal integer, OUT a_fecha text, OUT c_fecha text, OUT empleado_n character varying, OUT empleado_a character varying) OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 873914)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    id_categoria integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 339 (class 1255 OID 873917)
-- Name: sel_categoria(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_categoria(p_id_categoria integer, p_descripcion character varying) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_categoria = 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM categoria where id_categoria<>0 and estado = 1;
	return;
END if;
IF (p_id_categoria = 0 AND p_descripcion <> '')
	THEN
	return query
		SELECT * FROM categoria where id_categoria<>0 and estado = 1 and descripcion  LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_categoria <> 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM categoria where id_categoria<>0 and estado = 1 and id_categoria = p_id_categoria;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_categoria(p_id_categoria integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 372 (class 1255 OID 874965)
-- Name: sel_cliente(integer, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_cliente(xid integer, xnombresrs character varying, xdniruc character varying, xdniyruc character varying, OUT idcliente integer, OUT nombres character varying, OUT apellidos character varying, OUT documento character varying, OUT xfecha_nacimiento timestamp without time zone, OUT sexo smallint, OUT telefono character varying, OUT email character varying, OUT estado_civil character varying, OUT idprofesion integer, OUT idubigeo integer, OUT direccion character varying, OUT tipo character varying, OUT estado smallint, OUT maximocredito numeric, OUT fecha_nacimiento text, OUT ubigeo character varying, OUT profesion character varying, OUT idregion integer, OUT region character varying, OUT idprovincia integer, OUT provincia character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF (xid = 0 and xnombresrs ='' and xdniruc ='' and xdniyruc ='')
	THEN
	return query
		SELECT c.*,  to_char(c.fecha_nacimiento,'dd-MM-yyyy'), u.descripcion, p.descripcion,
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region)
		FROM cliente as c inner join ubigeos as u on(c.idubigeo=u.idubigeo)
						inner join profesiones as p on(c.idprofesion=p.idprofesion)
		where c.idcliente<>0 and c.estado=1
		order by c.idcliente desc;
		return;				
	END if;
IF (xid <>0 and xnombresrs ='' and xdniruc ='' and xdniyruc ='')
	THEN
		IF EXISTS(SELECT cliente.* FROM cliente WHERE cliente.idcliente=xid)
			THEN
		return query
		SELECT c.*,  to_char(c.fecha_nacimiento,'dd-MM-yyyy'), u.descripcion, p.descripcion,
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region)
		FROM cliente as c inner join ubigeos as u on(c.idubigeo=u.idubigeo)
						inner join profesiones as p on(c.idprofesion=p.idprofesion)
				 WHERE c.idcliente=xid and c.estado=1 
				 order by c.idcliente desc;
				 return;	
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
IF (xid = 0 and xnombresrs <>'' and xdniruc ='' and xdniyruc ='')
	THEN
	return query
		SELECT c.*,  to_char(c.fecha_nacimiento,'dd-MM-yyyy'), u.descripcion, p.descripcion,
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region)
		FROM cliente as c inner join ubigeos as u on(c.idubigeo=u.idubigeo)
						inner join profesiones as p on(c.idprofesion=p.idprofesion)
				 WHERE c.idcliente<>0 and (c.nombres like '%'||xnombresrs||'%' or c.apellidos like '%'||xnombresrs||'%') and c.estado=1
				order by c.idcliente desc; 
				return;	
end if;		 		

IF (xid = 0 and xnombresrs ='' and xdniruc <>'' and xdniyruc ='')	
THEN
	return query
		SELECT c.*,  to_char(c.fecha_nacimiento,'dd-MM-yyyy'), u.descripcion, p.descripcion,
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region)
		FROM cliente as c inner join ubigeos as u on(c.idubigeo=u.idubigeo)
						inner join profesiones as p on(c.idprofesion=p.idprofesion)
				 WHERE c.idcliente<>0 and c.documento like '%'||xdniruc||'%' and c.estado=1
				order by c.idcliente desc;
				 return;	
end	if;

IF (xid = 0 and xnombresrs ='' and xdniruc ='' and xdniyruc <>'')	
THEN
	return query
		SELECT c.*,  to_char(c.fecha_nacimiento,'dd-MM-yyyy'), u.descripcion, p.descripcion,
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia='00' and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.idubigeo FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region),
	(Select ubigeos.descripcion FROM ubigeos WHERE codigo_provincia=u.codigo_provincia and codigo_distrito='00' and codigo_region=u.codigo_region)
		FROM cliente as c inner join ubigeos as u on(c.idubigeo=u.idubigeo)
						inner join profesiones as p on(c.idprofesion=p.idprofesion)
				 WHERE c.idcliente<>0 and c.documento = xdniyruc and c.estado=1
				order by c.idcliente desc;
				 return;	
end	if;

  	
END
;
$$;


ALTER FUNCTION public.sel_cliente(xid integer, xnombresrs character varying, xdniruc character varying, xdniyruc character varying, OUT idcliente integer, OUT nombres character varying, OUT apellidos character varying, OUT documento character varying, OUT xfecha_nacimiento timestamp without time zone, OUT sexo smallint, OUT telefono character varying, OUT email character varying, OUT estado_civil character varying, OUT idprofesion integer, OUT idubigeo integer, OUT direccion character varying, OUT tipo character varying, OUT estado smallint, OUT maximocredito numeric, OUT fecha_nacimiento text, OUT ubigeo character varying, OUT profesion character varying, OUT idregion integer, OUT region character varying, OUT idprovincia integer, OUT provincia character varying) OWNER TO postgres;

--
-- TOC entry 340 (class 1255 OID 873919)
-- Name: sel_compra(integer, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_compra(p_id_compra integer, p_nrodoc character varying, p_fechacompra character varying, p_proveedor character varying, OUT id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT pproveedor character varying, OUT ttipopago character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_compra = 0 AND p_nrodoc = '' AND p_fechacompra = '' AND p_proveedor = '')
	THEN
	return query
		SELECT c.*, p.razonsocial, tp.descripcion
		FROM compra c inner join proveedor p on c.id_proveedor=p.id_proveedor
			inner join tipopago tp on c.id_tipopago=tp.id_tipopago
		WHERE c.estado = 1 and p.estado = 1 and tp.estado = 1
		order by c.id_compra desc;
	return;
END if;
IF (p_id_compra = 0 AND p_nrodoc <> '' AND p_fechacompra = '' AND p_proveedor = '')
	THEN
	return query
		SELECT c.*, p.razonsocial, tp.descripcion
		FROM compra c inner join proveedor p on c.id_proveedor=p.id_proveedor
			inner join tipopago tp on c.id_tipopago=tp.id_tipopago
		WHERE c.estado = 1 and p.estado = 1 and tp.estado = 1 and c.nrodoc LIKE '%'||p_nrodoc|| '%'
		order by c.id_compra desc;
	return;
END if;
IF (p_id_compra = 0 AND p_nrodoc = '' AND p_fechacompra = '' AND p_proveedor <> '')
	THEN
	return query
		SELECT c.*, p.razonsocial, tp.descripcion
		FROM compra c inner join proveedor p on c.id_proveedor=p.id_proveedor
			inner join tipopago tp on c.id_tipopago=tp.id_tipopago
		WHERE c.estado = 1 and p.estado = 1 and tp.estado = 1 and p.razonsocial LIKE '%'||p_proveedor|| '%'
		order by c.id_compra desc;
	return;
END if;
IF (p_id_compra <> 0 AND p_nrodoc = '' AND p_fechacompra = '' AND p_proveedor = '')
	THEN
	return query
		SELECT c.*, p.razonsocial, tp.descripcion
		FROM compra c inner join proveedor p on c.id_proveedor=p.id_proveedor
			inner join tipopago tp on c.id_tipopago=tp.id_tipopago
		WHERE c.estado = 1 and p.estado = 1 and tp.estado = 1 and c.id_compra = p_id_compra
		order by c.id_compra desc;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_compra(p_id_compra integer, p_nrodoc character varying, p_fechacompra character varying, p_proveedor character varying, OUT id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT pproveedor character varying, OUT ttipopago character varying) OWNER TO postgres;

--
-- TOC entry 342 (class 1255 OID 873920)
-- Name: sel_concepto(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_concepto(p_id_concepto integer, p_descripcion character varying, p_tipoconcepto character varying, OUT id_concepto integer, OUT descripcion character varying, OUT estado integer, OUT id_tipoconcepto integer, OUT ttipoconcepto character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_concepto = 0 AND p_descripcion = '' AND p_tipoconcepto = '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM concepto c inner join tipoconcepto tc on c.id_tipoconcepto = tc.id_tipoconcepto 
		WHERE c.estado = 1 AND tc.estado = 1;
	return;
END if;
IF (p_id_concepto = 0 AND p_descripcion <> '' AND p_tipoconcepto = '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM concepto c inner join tipoconcepto tc on c.id_tipoconcepto = tc.id_tipoconcepto 
		WHERE c.estado = 1 AND tc.estado = 1 AND c.descripcion LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_concepto = 0 AND p_descripcion = '' AND p_tipoconcepto <> '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM concepto c inner join tipoconcepto tc on c.id_tipoconcepto = tc.id_tipoconcepto 
		WHERE c.estado = 1 AND tc.estado = 1 AND tc.descripcion LIKE '%'||p_tipoconcepto|| '%';
	return;
END if;
IF (p_id_concepto <> 0 AND p_descripcion = '' AND p_tipoconcepto = '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM concepto c inner join tipoconcepto tc on c.id_tipoconcepto = tc.id_tipoconcepto 
		WHERE c.estado = 1 AND tc.estado = 1 AND c.id_concepto = p_id_concepto;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_concepto(p_id_concepto integer, p_descripcion character varying, p_tipoconcepto character varying, OUT id_concepto integer, OUT descripcion character varying, OUT estado integer, OUT id_tipoconcepto integer, OUT ttipoconcepto character varying) OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 876236)
-- Name: sel_cronogcobro(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_cronogcobro(xidventa integer, x_cliente character varying, x_idcliente integer, OUT id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT fecha timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT xcliente text, OUT xmonto_cobrado numeric, OUT ttipocomprobante character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF(xidventa = 0 and x_cliente = '' and x_idcliente = 0)
	THEN
	return query
		SELECT distinct v.*, c.nombres||' '||c.apellidos, (SELECT SUM(cronogcobro.monto_cobrado) FROM cronogcobro WHERE cronogcobro.id_venta=v.id_venta),tc.descripcion
		FROM venta as v inner join cliente as c on (c.idcliente=v.idcliente)
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
		where v.estado<>0
		order by v.id_venta desc;
		return;
	END if;
IF(xidventa <> 0 and x_cliente = '' and x_idcliente = 0)
	THEN
	return query
		SELECT distinct v.*, c.nombres||' '||c.apellidos, (SELECT SUM(cronogcobro.monto_cobrado) FROM cronogcobro WHERE cronogcobro.id_venta=v.id_venta),tc.descripcion
		FROM venta as v inner join cliente as c on (c.idcliente=v.idcliente)
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
		where v.estado<>0 and v.id_venta=xidventa
		order by v.id_venta desc;
		return;
	END if;
IF(xidventa = 0 and x_cliente <> '' and x_idcliente = 0)
	THEN
	return query
		SELECT distinct v.*, c.nombres||' '||c.apellidos, (SELECT SUM(cronogcobro.monto_cobrado) FROM cronogcobro WHERE cronogcobro.id_venta=v.id_venta),tc.descripcion
		FROM venta as v inner join cliente as c on (c.idcliente=v.idcliente)
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
		where v.estado<>0 and c.nombres LIKE '%'||x_cliente||'%' or c.apellidos LIKE '%'||x_cliente||'%'
		order by v.id_venta desc;
		return;
	END if;
IF(xidventa = 0 and x_cliente = '' and x_idcliente <> 0)
	THEN
	return query
		SELECT distinct v.*, c.nombres||' '||c.apellidos, (SELECT SUM(cronogcobro.monto_cobrado) FROM cronogcobro WHERE cronogcobro.id_venta=v.id_venta),tc.descripcion
		FROM venta as v inner join cliente as c on (c.idcliente=v.idcliente)
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
		where v.estado<>0 and c.idcliente = x_idcliente
		order by v.id_venta desc;
		return;
	END if;
END;
$$;


ALTER FUNCTION public.sel_cronogcobro(xidventa integer, x_cliente character varying, x_idcliente integer, OUT id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT fecha timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT xcliente text, OUT xmonto_cobrado numeric, OUT ttipocomprobante character varying) OWNER TO postgres;

--
-- TOC entry 343 (class 1255 OID 873922)
-- Name: sel_cronogpago(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_cronogpago(xidcompra integer, x_proveedor character varying, OUT id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT xproveedor character varying, OUT xmonto_pagado numeric) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF(xidcompra = 0 and x_proveedor = '')
	THEN
	return query
		SELECT distinct c.*, p.razonsocial, (SELECT SUM(cronogpago.monto_pagado) FROM cronogpago WHERE cronogpago.id_compra=c.id_compra)
		FROM compra as c inner join proveedor as p on (c.id_proveedor=p.id_proveedor)
		where c.estadopago<>'2' and c.estado<>0 and (c.igv + 1)*c.monto <> (SELECT SUM(cronogpago.monto_pagado) FROM cronogpago WHERE cronogpago.id_compra=c.id_compra);
		return;
	END if;
IF(xidcompra <> 0 and x_proveedor = '')
	THEN
	return query
		SELECT distinct c.*, p.razonsocial, (SELECT SUM(cronogpago.monto_pagado) FROM cronogpago WHERE cronogpago.id_compra=c.id_compra)
		FROM compra as c inner join proveedor as p on (c.id_proveedor=p.id_proveedor)
		where c.estadopago<>'2' and c.estado<>0 and (c.igv + 1)*c.monto <> (SELECT SUM(cronogpago.monto_pagado) FROM cronogpago WHERE cronogpago.id_compra=c.id_compra)
		and c.id_compra = xidcompra;
		return;
	END if;
IF(xidcompra = 0 and x_proveedor <> '')
	THEN
	return query
		SELECT distinct c.*, p.razonsocial, (SELECT SUM(cronogpago.monto_pagado) FROM cronogpago WHERE cronogpago.id_compra=c.id_compra)
		FROM compra as c inner join proveedor as p on (c.id_proveedor=p.id_proveedor)
		where c.estadopago<>'2' and c.estado<>0 and (c.igv + 1)*c.monto <> (SELECT SUM(cronogpago.monto_pagado) FROM cronogpago WHERE cronogpago.id_compra=c.id_compra)
		and p.razonsocial LIKE '%'||x_proveedor||'%';
		return;
	END if;
END;
$$;


ALTER FUNCTION public.sel_cronogpago(xidcompra integer, x_proveedor character varying, OUT id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT xproveedor character varying, OUT xmonto_pagado numeric) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 873923)
-- Name: sel_cuotacobro(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_cuotacobro(xid_venta integer, OUT id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT xfecha timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT xcliente text, OUT id_cronogcobro integer, OUT c_id_venta integer, OUT fecha date, OUT monto_cuota numeric, OUT nrocuota integer, OUT monto_cobrado numeric) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF(xid_venta  <> 0)
	THEN
	return query
		SELECT v.*, c.nombres||' '||c.apellidos, cc.*
		FROM venta as v inner join cliente as c on (v.idcliente=c.idcliente) inner join cronogcobro as cc on (cc.id_venta=v.id_venta)
		where v.estadopago<>'2' and cc.id_venta=xid_venta
		order by cc.id_cronogcobro asc;
		return;
	END if;
IF(xid_venta  = 0)
	THEN
	return query
		SELECT v.*, c.nombres||' '||c.apellidos, cc.*
		FROM venta as v inner join cliente as c on (v.idcliente=c.idcliente) inner join cronogcobro as cc on (cc.id_venta=v.id_venta)
		where v.estadopago<>'2'
		order by cc.id_cronogcobro asc;
		return;
	END if;	
END;
$$;


ALTER FUNCTION public.sel_cuotacobro(xid_venta integer, OUT id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT xfecha timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT xcliente text, OUT id_cronogcobro integer, OUT c_id_venta integer, OUT fecha date, OUT monto_cuota numeric, OUT nrocuota integer, OUT monto_cobrado numeric) OWNER TO postgres;

--
-- TOC entry 345 (class 1255 OID 873924)
-- Name: sel_cuotapago(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_cuotapago(xid_compra integer, OUT id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT xproveedor character varying, OUT id_cronogpago integer, OUT c_id_compra integer, OUT fecha date, OUT monto_cuota numeric, OUT nrocuota integer, OUT monto_pagado numeric) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
begin
IF(xid_compra <> 0)
	THEN
	return query
		SELECT c.*, p.razonsocial, cp.*
		FROM compra as c inner join proveedor as p on (c.id_proveedor=p.id_proveedor) inner join cronogpago as cp on (cp.id_compra=c.id_compra)
		where c.estadopago<>'2' and cp.id_compra=xid_compra
		order by cp.id_cronogpago asc;
		return;
	END if;
IF(xid_compra = 0)
	THEN
	return query
		SELECT c.*, p.razonsocial, cp.*
		FROM compra as c inner join proveedor as p on (c.id_proveedor=p.id_proveedor) inner join cronogpago as cp on (cp.id_compra=c.id_compra)
		where c.estadopago<>'2'
		order by cp.id_cronogpago asc;
		return;
	END if;
END;
$$;


ALTER FUNCTION public.sel_cuotapago(xid_compra integer, OUT id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT xproveedor character varying, OUT id_cronogpago integer, OUT c_id_compra integer, OUT fecha date, OUT monto_cuota numeric, OUT nrocuota integer, OUT monto_pagado numeric) OWNER TO postgres;

--
-- TOC entry 344 (class 1255 OID 873925)
-- Name: sel_detcompprod(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_detcompprod(p_id_compra integer, p_id_producto integer, OUT x_id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT id_compra integer, OUT id_producto integer, OUT cantidadum integer, OUT preciounitario numeric, OUT id_unidadmedida integer, OUT cantidadub integer, OUT precioub numeric, OUT pproducto character varying, OUT uum character varying, OUT pproveedor character varying, OUT ttipopago character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (p_id_compra <> 0 AND p_id_producto = 0)
	THEN
	return query
		SELECT c.*,dc.*, p.descripcion, um.prefijo, pro.razonsocial, tp.descripcion
		FROM detcompraproducto dc inner join compra c on c.id_compra=dc.id_compra
			inner join producto p on p.id_producto=dc.id_producto
			inner join unidadmedida um on dc.id_unidadmedida=um.id_unidadmedida
			inner join proveedor pro on c.id_proveedor=pro.id_proveedor
			inner join tipopago tp on c.id_tipopago=tp.id_tipopago
		WHERE c.estado = 1 and p.estado = 1 and dc.id_compra = p_id_compra;
	return;
END if;
END;
$$;


ALTER FUNCTION public.sel_detcompprod(p_id_compra integer, p_id_producto integer, OUT x_id_compra integer, OUT id_proveedor integer, OUT id_tipopago integer, OUT fechacompra date, OUT monto numeric, OUT estado integer, OUT nrodoc character varying, OUT igv numeric, OUT estadopago character, OUT id_compra integer, OUT id_producto integer, OUT cantidadum integer, OUT preciounitario numeric, OUT id_unidadmedida integer, OUT cantidadub integer, OUT precioub numeric, OUT pproducto character varying, OUT uum character varying, OUT pproveedor character varying, OUT ttipopago character varying) OWNER TO postgres;

--
-- TOC entry 346 (class 1255 OID 873926)
-- Name: sel_detprodalm(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_detprodalm(p_id_almacen integer, p_id_producto integer, OUT id_almacen integer, OUT id_producto integer, OUT stock numeric, OUT aalmacen character varying, OUT pproducto character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (p_id_almacen <> 0 AND p_id_producto = 0)
	THEN 
	 return query
		SELECT pa.* , a.descripcion, p.descripcion
		FROM detprodalm pa inner join producto p on pa.id_producto = p.id_producto
			inner join almacen a on pa.id_almacen=a.id_almacen
		WHERE a.estado = 1 and p.estado = 1 and a.id_almacen = p_id_almacen
		ORDER BY a.id_almacen;
	 return;
	END if;
IF (p_id_almacen = 0 AND p_id_producto <> 0)
	THEN 
	 return query
		SELECT pa.* , a.descripcion, p.descripcion
		FROM detprodalm pa inner join producto p on pa.id_producto = p.id_producto
			inner join almacen a on pa.id_almacen=a.id_almacen
		WHERE a.estado = 1 and p.estado = 1 and p.id_producto = p_id_producto
		ORDER BY a.id_almacen;
	 return; 
	END if;
IF (p_id_almacen <> 0 AND p_id_producto <> 0)
	THEN 
	 return query
		SELECT pa.* , a.descripcion, p.descripcion
		FROM detprodalm pa inner join producto p on pa.id_producto = p.id_producto
			inner join almacen a on pa.id_almacen=a.id_almacen
		WHERE a.estado = 1 and p.estado = 1 and a.id_almacen = p_id_almacen and p.id_producto = p_id_producto
		ORDER BY a.id_almacen;
	 return; 
	END if;
end
;
$$;


ALTER FUNCTION public.sel_detprodalm(p_id_almacen integer, p_id_producto integer, OUT id_almacen integer, OUT id_producto integer, OUT stock numeric, OUT aalmacen character varying, OUT pproducto character varying) OWNER TO postgres;

--
-- TOC entry 347 (class 1255 OID 873927)
-- Name: sel_detprodum(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_detprodum(p_id_unidadmedida integer, p_id_producto integer, OUT id_unidadmedida integer, OUT id_producto integer, OUT preciovcont numeric, OUT preciovcre numeric, OUT uunidadmedida character varying, OUT pproducto character varying, OUT equivalenteunidad integer, OUT cant_unidad integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (p_id_unidadmedida = 0 AND p_id_producto = 0)
	THEN 
	 return query
		SELECT pum.* , um.descripcion, p.descripcion, um.equivalenteunidad, um.cant_unidad
		FROM detproductounidmedida pum inner join producto p on pum.id_producto = p.id_producto
			inner join unidadmedida um on pum.id_unidadmedida=um.id_unidadmedida
		WHERE um.estado = 1 and p.estado = 1
		ORDER BY um.id_unidadmedida;
	 return;
	END if;
IF (p_id_unidadmedida = 0 AND p_id_producto <> 0)
	THEN 
	 return query
		SELECT pum.* , um.descripcion, p.descripcion, um.equivalenteunidad, um.cant_unidad
		FROM detproductounidmedida pum inner join producto p on pum.id_producto = p.id_producto
			inner join unidadmedida um on pum.id_unidadmedida=um.id_unidadmedida
		WHERE um.estado = 1 and p.estado = 1 and p.id_producto = p_id_producto
		ORDER BY um.id_unidadmedida;
	 return; 
	END if;
IF (p_id_unidadmedida <> 0 AND p_id_producto <> 0)
	THEN 
	 return query
		SELECT pum.* , um.descripcion, p.descripcion, um.equivalenteunidad, um.cant_unidad
		FROM detproductounidmedida pum inner join producto p on pum.id_producto = p.id_producto
			inner join unidadmedida um on pum.id_unidadmedida=um.id_unidadmedida
		WHERE um.estado = 1 and p.estado = 1 and pum.id_producto = p_id_producto and pum.id_unidadmedida = p_id_unidadmedida
		ORDER BY um.id_unidadmedida;
	 return; 
	END if;
end
;
$$;


ALTER FUNCTION public.sel_detprodum(p_id_unidadmedida integer, p_id_producto integer, OUT id_unidadmedida integer, OUT id_producto integer, OUT preciovcont numeric, OUT preciovcre numeric, OUT uunidadmedida character varying, OUT pproducto character varying, OUT equivalenteunidad integer, OUT cant_unidad integer) OWNER TO postgres;

--
-- TOC entry 348 (class 1255 OID 873928)
-- Name: sel_detventa(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_detventa(p_id_venta integer, p_id_producto integer, OUT x_id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT fechaventa timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT id_venta integer, OUT id_producto integer, OUT cantidadum integer, OUT preciounitario numeric, OUT id_unidadmedida integer, OUT cantidadub integer, OUT precioub numeric, OUT pproducto character varying, OUT uum character varying, OUT ncliente character varying, OUT acliente character varying, OUT ttipopago character varying, OUT aalmacen character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (p_id_venta <> 0 AND p_id_producto = 0)
	THEN
	return query
		SELECT distinct v.*,dv.*, p.descripcion, um.prefijo,c.nombres, c.apellidos,tp.descripcion, a.descripcion
		FROM detventa dv inner join venta v on v.id_venta=dv.id_venta
			inner join cliente c on v.idcliente=c.idcliente
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join producto p on p.id_producto=dv.id_producto
			inner join unidadmedida um on dv.id_unidadmedida=um.id_unidadmedida
			inner join almacen a on v.id_almacen = a.id_almacen
		WHERE v.estado = 1 and p.estado = 1 and dv.id_venta = p_id_venta and v.id_venta = p_id_venta;
	return;
END if;
END;
$$;


ALTER FUNCTION public.sel_detventa(p_id_venta integer, p_id_producto integer, OUT x_id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT fechaventa timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT id_venta integer, OUT id_producto integer, OUT cantidadum integer, OUT preciounitario numeric, OUT id_unidadmedida integer, OUT cantidadub integer, OUT precioub numeric, OUT pproducto character varying, OUT uum character varying, OUT ncliente character varying, OUT acliente character varying, OUT ttipopago character varying, OUT aalmacen character varying) OWNER TO postgres;

--
-- TOC entry 349 (class 1255 OID 873929)
-- Name: sel_empleado(integer, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_empleado(p_id_empleado integer, p_nombre character varying, p_apellido character varying, p_usuario character varying, p_perfil character varying, p_sucursal character varying, OUT id_empleado integer, OUT nombre character varying, OUT apellido character varying, OUT direccion character varying, OUT dni character, OUT fechanacimiento date, OUT estado integer, OUT usuario character varying, OUT clave character varying, OUT id_perfil integer, OUT telefono character varying, OUT id_sucursal integer, OUT pperfil character varying, OUT ssucursal character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '' AND p_sucursal = '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1;
	return;
END if;
IF (p_id_empleado = 0 AND p_nombre <> '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '' AND p_sucursal = '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1 and e.nombre LIKE '%'||p_nombre|| '%';
	return;
END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido <> '' AND p_usuario = '' AND p_perfil = '' AND p_sucursal = '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1 and e.apellido LIKE '%'||p_apellido|| '%';
	return;
END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario <> '' AND p_perfil = '' AND p_sucursal = '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1 and e.usuario LIKE '%'||p_usuario|| '%';
	return;
END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil <> '' AND p_sucursal = '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1 and p.descripcion LIKE '%'||p_perfil|| '%';
	return;
END if;
IF (p_id_empleado = 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '' AND p_sucursal <> '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1 and s.nombre LIKE '%'||p_sucursal|| '%';
	return;
END if;
IF (p_id_empleado <> 0 AND p_nombre = '' AND p_apellido = '' AND p_usuario = '' AND p_perfil = '' AND p_sucursal = '')
	THEN
	return query
		SELECT e.*,p.descripcion, s.nombre
		FROM empleado e inner join perfil p on e.id_perfil = p.id_perfil 
			inner join sucursal s on e.id_sucursal = s.id_sucursal
		WHERE e.estado = 1 and p.estado = 1 and e.id_empleado = p_id_empleado;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_empleado(p_id_empleado integer, p_nombre character varying, p_apellido character varying, p_usuario character varying, p_perfil character varying, p_sucursal character varying, OUT id_empleado integer, OUT nombre character varying, OUT apellido character varying, OUT direccion character varying, OUT dni character, OUT fechanacimiento date, OUT estado integer, OUT usuario character varying, OUT clave character varying, OUT id_perfil integer, OUT telefono character varying, OUT id_sucursal integer, OUT pperfil character varying, OUT ssucursal character varying) OWNER TO postgres;

--
-- TOC entry 380 (class 1255 OID 876235)
-- Name: sel_kardexprod(integer, integer, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_kardexprod(p_id_kardex integer, p_id_producto integer, p_tipo character varying, p_almacen character varying, p_producto character varying, p_idsucursal integer, OUT id_kardex integer, OUT id_producto integer, OUT cantidad integer, OUT fecha date, OUT id_almacen integer, OUT saldo numeric, OUT id_motivomovimiento integer, OUT pproducto character varying, OUT uunidadmedida character varying, OUT aalmacen character varying, OUT mmotivomovimiento character varying, OUT ttipomovimiento character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_kardex = 0 AND p_id_producto = 0 AND p_tipo = '' AND p_almacen = '' AND p_producto = '' AND p_idsucursal <> 0)
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and a.id_sucursal = p_idsucursal
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex = 0 AND p_id_producto = 0 AND p_tipo = '' AND p_almacen = '' AND p_producto = '' AND p_idsucursal = 0)
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex = 0 AND p_id_producto <> 0 AND p_tipo = '' AND p_almacen = '' AND p_producto = '')
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and a.id_sucursal = p_idsucursal and p.id_producto = p_id_producto
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex = 0 AND p_id_producto = 0 AND p_tipo <> '' AND p_almacen = '' AND p_producto = '')
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and a.id_sucursal = p_idsucursal and kp.tipo  LIKE '%'||p_tipo|| '%'
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex = 0 AND p_id_producto = 0 AND p_tipo = '' AND p_almacen <> '' AND p_producto = '')
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and a.id_sucursal = p_idsucursal and a.descripcion  LIKE '%'||p_almacen|| '%'
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex = 0 AND p_id_producto = 0 AND p_tipo = '' AND p_almacen = '' AND p_producto <> '' AND p_idsucursal <> 0)
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and a.id_sucursal = p_idsucursal and p.descripcion  LIKE '%'||p_producto|| '%'
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex = 0 AND p_id_producto = 0 AND p_tipo = '' AND p_almacen = '' AND p_producto <> '' AND p_idsucursal = 0)
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and p.descripcion  LIKE '%'||p_producto|| '%'
		ORDER BY kp.id_kardex;
	return;
END if;
IF (p_id_kardex <> 0 AND p_id_producto = 0 AND p_tipo = '' AND p_almacen = '' AND p_producto = '')
	THEN
	return query
		SELECT kp.*,p.descripcion, um.descripcion, a.descripcion, mm.descripcion, tm.descripcion
		FROM kardex_producto kp inner join producto p on kp.id_producto = p.id_producto
			inner join motivomovimiento mm on mm.id_motivomovimiento = kp.id_motivomovimiento
			inner join tipomovimiento tm on tm.id_tipomovimiento = mm.id_tipomovimiento
			inner join unidadmedida um on um.id_unidadmedida = p.id_unidadmedida
			inner join almacen a on kp.id_almacen = a.id_almacen
		WHERE p.estado = 1 and um.estado = 1 and a.estado = 1 and a.id_sucursal = p_idsucursal and kp.id_kardex=p_id_kardex
		ORDER BY kp.id_kardex;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_kardexprod(p_id_kardex integer, p_id_producto integer, p_tipo character varying, p_almacen character varying, p_producto character varying, p_idsucursal integer, OUT id_kardex integer, OUT id_producto integer, OUT cantidad integer, OUT fecha date, OUT id_almacen integer, OUT saldo numeric, OUT id_motivomovimiento integer, OUT pproducto character varying, OUT uunidadmedida character varying, OUT aalmacen character varying, OUT mmotivomovimiento character varying, OUT ttipomovimiento character varying) OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 873931)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE marca (
    id_marca integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 350 (class 1255 OID 873934)
-- Name: sel_marca(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_marca(p_id_marca integer, p_descripcion character varying) RETURNS SETOF marca
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_marca = 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM marca where id_marca<>0 and estado = 1;
	return;
END if;
IF (p_id_marca = 0 AND p_descripcion <> '')
	THEN
	return query
		SELECT * FROM marca where id_marca<>0 and estado = 1 and descripcion  LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_marca <> 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM marca where id_marca<>0 and estado = 1 and id_marca = p_id_marca;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_marca(p_id_marca integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 376 (class 1255 OID 876105)
-- Name: sel_marcas(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_marcas(p_id_marca integer, p_descripcion character varying) RETURNS SETOF marcas
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_marca = 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM marcas where id<>0 and estado = 1;
	return;
END if;
IF (p_id_marca = 0 AND p_descripcion <> '')
	THEN
	return query
		SELECT * FROM marcas where id<>0 and estado = 1 and titulo  LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_marca <> 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM marcas where id<>0 and estado = 1 and id = p_id_marca;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_marcas(p_id_marca integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 876161)
-- Name: sel_motivomovimiento(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_motivomovimiento(p_id_motivomovimiento integer, p_descripcion character varying, p_tipomovimiento character varying, OUT id_motivomovimiento integer, OUT descripcion character varying, OUT estado integer, OUT id_tipomovimiento integer, OUT ttipomovimiento character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_motivomovimiento = 0 AND p_descripcion = '' AND p_tipomovimiento = '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM motivomovimiento c inner join tipomovimiento tc on c.id_tipomovimiento = tc.id_tipomovimiento 
		WHERE c.estado = 1;
	return;
END if;
IF (p_id_motivomovimiento = 0 AND p_descripcion <> '' AND p_tipomovimiento = '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM motivomovimiento c inner join tipomovimiento tc on c.id_tipomovimiento = tc.id_tipomovimiento 
		WHERE c.estado = 1 AND c.descripcion LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_motivomovimiento = 0 AND p_descripcion = '' AND p_tipomovimiento <> '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM motivomovimiento c inner join tipomovimiento tc on c.id_tipomovimiento = tc.id_tipomovimiento 
		WHERE c.estado = 1 AND tc.descripcion LIKE '%'||p_tipomovimiento|| '%';
	return;
END if;
IF (p_id_motivomovimiento <> 0 AND p_descripcion = '' AND p_tipomovimiento = '')
	THEN
	return query
		SELECT c.*, tc.descripcion 
		FROM motivomovimiento c inner join tipomovimiento tc on c.id_tipomovimiento = tc.id_tipomovimiento 
		WHERE c.estado = 1 AND c.id_motivomovimiento = p_id_motivomovimiento;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_motivomovimiento(p_id_motivomovimiento integer, p_descripcion character varying, p_tipomovimiento character varying, OUT id_motivomovimiento integer, OUT descripcion character varying, OUT estado integer, OUT id_tipomovimiento integer, OUT ttipomovimiento character varying) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 876233)
-- Name: sel_movimiento(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_movimiento(xid integer, xdescripcion character varying, OUT id_movimiento integer, OUT id_caja integer, OUT id_concepto integer, OUT id_formapago integer, OUT monto numeric, OUT estado integer, OUT fecha timestamp without time zone, OUT xconcepto character varying, OUT id_tipoconcepto integer, OUT fformapago character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF ( xid = 0 and  xdescripcion='')
	then
	return query
		SELECT mc.*, cm.descripcion, cm.id_tipoconcepto, fp.descripcion
		FROM movimiento as mc inner join concepto as cm on(mc.id_concepto=cm.id_concepto)
			inner join formapago fp on mc.id_formapago = fp.id_formapago
		WHERE mc.estado=1
		order by mc.id_movimiento desc;
		return;
	END if;
IF ( xid = 0 and  xdescripcion<>'')
	then
	return query
		SELECT mc.*, cm.descripcion, cm.id_tipoconcepto, fp.descripcion
		FROM movimiento as mc inner join concepto as cm on(mc.id_concepto=cm.id_concepto)
			inner join formapago fp on mc.id_formapago = fp.id_formapago
		WHERE cm.descripcion LIKE '%'|| xdescripcion||'%' and mc.estado=1
		order by mc.id_movimiento desc;
		return;
	END if;
IF( xid<>0)
	then
		IF EXISTS(SELECT movimiento.id_movimiento FROM movimiento WHERE movimiento.id_movimiento= xid)
			then
			return query
				SELECT mc.*, cm.descripcion, cm.id_tipoconcepto, fp.descripcion
		FROM movimiento as mc inner join concepto as cm on(mc.id_concepto=cm.id_concepto)
			inner join formapago fp on mc.id_formapago = fp.id_formapago
		WHERE mc.id_movimiento= xid and mc.estado=1
		order by mc.id_movimiento desc;
	
		return;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.sel_movimiento(xid integer, xdescripcion character varying, OUT id_movimiento integer, OUT id_caja integer, OUT id_concepto integer, OUT id_formapago integer, OUT monto numeric, OUT estado integer, OUT fecha timestamp without time zone, OUT xconcepto character varying, OUT id_tipoconcepto integer, OUT fformapago character varying) OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 873936)
-- Name: param; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE param (
    id_param character varying(30) NOT NULL,
    valor character varying(30) NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.param OWNER TO postgres;

--
-- TOC entry 351 (class 1255 OID 873939)
-- Name: sel_param(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_param(p_id_param character varying) RETURNS SETOF param
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_param = '')
	THEN
	return query
		SELECT * FROM param where estado = 1;
	return;
END if;
IF (p_id_param <> '')
	THEN
	return query
		SELECT * FROM param where id_param = p_id_param and estado = 1;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_param(p_id_param character varying) OWNER TO postgres;

--
-- TOC entry 361 (class 1255 OID 874960)
-- Name: sel_producto(integer, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_producto(p_id_producto integer, p_descripcion character varying, p_marca character varying, p_subcategoria character varying, OUT id_producto integer, OUT id_marca integer, OUT id_subcategoria integer, OUT descripcion character varying, OUT estado integer, OUT id_unidadmedida integer, OUT precioc numeric, OUT mmarca character varying, OUT ssubcategoria character varying, OUT uunidadmedida character varying, OUT id_categoria integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_producto = 0 AND p_descripcion = '' AND p_marca = '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, sc.id_categoria
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on p.id_unidadmedida = um.id_unidadmedida
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1;
	return;
END if;
IF (p_id_producto = 0 AND p_descripcion <> '' AND p_marca = '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, sc.id_categoria
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on p.id_unidadmedida = um.id_unidadmedida
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and p.descripcion LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_producto = 0 AND p_descripcion = '' AND p_marca <> '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, sc.id_categoria
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on p.id_unidadmedida = um.id_unidadmedida
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and m.descripcion LIKE '%'||p_marca|| '%';
	return;
END if;
IF (p_id_producto = 0 AND p_descripcion = '' AND p_marca = '' AND p_subcategoria <> '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, sc.id_categoria
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on p.id_unidadmedida = um.id_unidadmedida
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and sc.descripcion LIKE '%'||p_subcategoria|| '%';
	return;
END if;
IF (p_id_producto <> 0 AND p_descripcion = '' AND p_marca = '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, sc.id_categoria
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on p.id_unidadmedida = um.id_unidadmedida
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and p.id_producto = p_id_producto;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_producto(p_id_producto integer, p_descripcion character varying, p_marca character varying, p_subcategoria character varying, OUT id_producto integer, OUT id_marca integer, OUT id_subcategoria integer, OUT descripcion character varying, OUT estado integer, OUT id_unidadmedida integer, OUT precioc numeric, OUT mmarca character varying, OUT ssubcategoria character varying, OUT uunidadmedida character varying, OUT id_categoria integer) OWNER TO postgres;

--
-- TOC entry 371 (class 1255 OID 874963)
-- Name: sel_productos(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_productos(xid integer, xtitulo character varying, OUT id integer, OUT titulo character varying, OUT cuerpo text, OUT imagen character varying, OUT tipo smallint, OUT estado smallint, OUT id_subcategoria integer, OUT xsubcategoria character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (xid = 0 and xtitulo='')
	then
	return query
		SELECT productos.*, subcategoria.descripcion
		FROM productos inner join subcategoria on productos.id_subcategoria=subcategoria.id_subcategoria
		where productos.estado<>0
		order by productos.id desc;
		return;
end if;
IF (xid = 0 and xtitulo<>'')
	then
	return query
	SELECT productos.*, subcategoria.descripcion
	FROM productos inner join subcategoria on productos.id_subcategoria=subcategoria.id_subcategoria
	where productos.estado<>0 and productos.titulo like '%'||xtitulo||'%';
	return;
end if;
IF (xid <> 0 and xtitulo='')
	then
		IF EXISTS(SELECT productos.* FROM productos WHERE productos.id=xid)
			then
			return query
			SELECT productos.*, subcategoria.descripcion
			FROM productos inner join subcategoria on productos.id_subcategoria=subcategoria.id_subcategoria
			where productos.id=xid and productos.estado<>0;
		 return;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
				
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.sel_productos(xid integer, xtitulo character varying, OUT id integer, OUT titulo character varying, OUT cuerpo text, OUT imagen character varying, OUT tipo smallint, OUT estado smallint, OUT id_subcategoria integer, OUT xsubcategoria character varying) OWNER TO postgres;

--
-- TOC entry 368 (class 1255 OID 876175)
-- Name: sel_productos_cat(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_productos_cat(p_id integer) RETURNS SETOF productos
    LANGUAGE plpgsql
    AS $$

BEGIN
return query
SELECT * FROM productos 
where id_subcategoria<>0 and estado = 1 and id_subcategoria = p_id
order by id desc;
END;

$$;


ALTER FUNCTION public.sel_productos_cat(p_id integer) OWNER TO postgres;

--
-- TOC entry 352 (class 1255 OID 873942)
-- Name: sel_prodxalm(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_prodxalm(p_descripcion character varying, p_marca character varying, p_subcategoria character varying, p_id_almacen integer, OUT id_producto integer, OUT id_marca integer, OUT id_subcategoria integer, OUT descripcion character varying, OUT estado integer, OUT id_unidadmedida integer, OUT precioc numeric, OUT mmarca character varying, OUT ssubcategoria character varying, OUT uunidadmedida character varying, OUT aalmacen character varying, OUT stock numeric, OUT preciovcont numeric, OUT preciovcre numeric) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_descripcion = '' AND p_marca = '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, a.descripcion, dpa.stock, dpum.preciovcont, dpum.preciovcre
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join detproductounidmedida dpum on dpum.id_producto = p.id_producto
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on dpum.id_unidadmedida = um.id_unidadmedida
			inner join detprodalm dpa on p.id_producto = dpa.id_producto
			inner join almacen a on dpa.id_almacen = a.id_almacen			
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and a.id_almacen = p_id_almacen and um.equivalenteunidad = 0;
	return;
END if;
IF (p_descripcion <> '' AND p_marca = '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, a.descripcion, dpa.stock, dpum.preciovcont, dpum.preciovcre
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join detproductounidmedida dpum on dpum.id_producto = p.id_producto
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on dpum.id_unidadmedida = um.id_unidadmedida
			inner join detprodalm dpa on p.id_producto = dpa.id_producto
			inner join almacen a on dpa.id_almacen = a.id_almacen			
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and a.id_almacen = p_id_almacen and um.equivalenteunidad = 0 and p.descripcion LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_descripcion = '' AND p_marca <> '' AND p_subcategoria = '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, a.descripcion, dpa.stock, dpum.preciovcont, dpum.preciovcre
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join detproductounidmedida dpum on dpum.id_producto = p.id_producto
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on dpum.id_unidadmedida = um.id_unidadmedida
			inner join detprodalm dpa on p.id_producto = dpa.id_producto
			inner join almacen a on dpa.id_almacen = a.id_almacen			
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and a.id_almacen = p_id_almacen and um.equivalenteunidad = 0 and m.descripcion LIKE '%'||p_marca|| '%';
	return;
END if;
IF (p_descripcion = '' AND p_marca = '' AND p_subcategoria <> '')
	THEN
	return query
		SELECT p.*, m.descripcion, sc.descripcion, um.descripcion, a.descripcion, dpa.stock, dpum.preciovcont, dpum.preciovcre
		FROM producto p inner join marca m on p.id_marca=m.id_marca
			inner join detproductounidmedida dpum on dpum.id_producto = p.id_producto
			inner join subcategoria sc on p.id_subcategoria=sc.id_subcategoria
			inner join unidadmedida um on dpum.id_unidadmedida = um.id_unidadmedida
			inner join detprodalm dpa on p.id_producto = dpa.id_producto
			inner join almacen a on dpa.id_almacen = a.id_almacen			
		WHERE p.estado = 1 and m.estado = 1 and sc.estado = 1 and um.estado = 1 and a.id_almacen = p_id_almacen and um.equivalenteunidad = 0 and sc.descripcion LIKE '%'||p_subcategoria|| '%';
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_prodxalm(p_descripcion character varying, p_marca character varying, p_subcategoria character varying, p_id_almacen integer, OUT id_producto integer, OUT id_marca integer, OUT id_subcategoria integer, OUT descripcion character varying, OUT estado integer, OUT id_unidadmedida integer, OUT precioc numeric, OUT mmarca character varying, OUT ssubcategoria character varying, OUT uunidadmedida character varying, OUT aalmacen character varying, OUT stock numeric, OUT preciovcont numeric, OUT preciovcre numeric) OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 873943)
-- Name: profesiones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profesiones (
    idprofesion integer NOT NULL,
    descripcion character varying(100) DEFAULT NULL::character varying,
    codigo character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.profesiones OWNER TO postgres;

--
-- TOC entry 353 (class 1255 OID 873948)
-- Name: sel_profesion(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_profesion(xid integer) RETURNS SETOF profesiones
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (xid = 0)
		THEN 
	 return query
		SELECT * FROM profesiones;
		return; 
		ELSE
		IF EXISTS(SELECT * FROM profesiones WHERE idprofesion=xid)
				THEN 
	 return query
				SELECT * FROM profesiones WHERE idprofesion=xid;
				return; 
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.sel_profesion(xid integer) OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 873949)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedor (
    id_proveedor integer NOT NULL,
    nombre character varying(50),
    direccion character varying(50),
    razonsocial character varying(50),
    email character varying(50),
    ciudad character varying(50),
    estado integer,
    ruc character(11),
    telefmovil character varying(15)
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 354 (class 1255 OID 873952)
-- Name: sel_proveedor(integer, character varying, character varying, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_proveedor(p_id_proveedor integer, p_nombre character varying, p_razonsocial character varying, p_ruc character) RETURNS SETOF proveedor
    LANGUAGE plpgsql
    AS $$
declare
xid integer;

BEGIN

IF (p_id_proveedor = 0 AND p_nombre = '' AND p_razonsocial = '' AND p_ruc = '')
	THEN
	return query
		SELECT * FROM proveedor 
		WHERE estado = 1;
	return;
END if;


IF (p_id_proveedor = 9999 AND p_nombre = '' AND p_razonsocial = '' AND p_ruc = '')
	THEN
	xid:=(select max(id_proveedor)from proveedor);
	return query
		SELECT * FROM proveedor 
		WHERE estado = 1 and id_proveedor =xid;
	return;
END if;

IF (p_id_proveedor = 0 AND p_nombre <> '' AND p_razonsocial = '' AND p_ruc = '')
	THEN
	return query
		SELECT * FROM proveedor 
		WHERE estado = 1 and nombre LIKE '%'||p_nombre|| '%';
	return;
END if;
IF (p_id_proveedor = 0 AND p_nombre = '' AND p_razonsocial <> '' AND p_ruc = '')
	THEN
	return query
		SELECT * FROM proveedor 
		WHERE estado = 1 and razonsocial LIKE '%'||p_razonsocial|| '%';
	return;
END if;
IF (p_id_proveedor = 0 AND p_nombre = '' AND p_razonsocial = '' AND p_ruc <> '')
	THEN
	return query
		SELECT * FROM proveedor 
		WHERE estado = 1 and ruc LIKE '%'||p_ruc|| '%';
	return;
END if;
IF (p_id_proveedor <> 0 AND p_nombre = '' AND p_razonsocial = '' AND p_ruc = '')
	THEN
	return query
		SELECT * FROM proveedor 
		WHERE estado = 1 and id_proveedor = p_id_proveedor;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_proveedor(p_id_proveedor integer, p_nombre character varying, p_razonsocial character varying, p_ruc character) OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 873953)
-- Name: ubigeos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ubigeos (
    idubigeo integer NOT NULL,
    codigo_region character varying(50) DEFAULT NULL::character varying,
    codigo_provincia character varying(50) DEFAULT NULL::character varying,
    codigo_distrito character varying(50) DEFAULT NULL::character varying,
    descripcion character varying(50) DEFAULT NULL::character varying,
    idpais integer NOT NULL
);


ALTER TABLE public.ubigeos OWNER TO postgres;

--
-- TOC entry 355 (class 1255 OID 873960)
-- Name: sel_provincia(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_provincia(xid integer, xidregion integer) RETURNS SETOF ubigeos
    LANGUAGE plpgsql
    AS $$
declare xcod_region character varying;
begin
IF (xid = 0)
	then
	
	xcod_region :=(select ubigeos.codigo_region from ubigeos where ubigeos.idubigeo=xidregion);
	return query
		SELECT * FROM ubigeos
		where ubigeos.codigo_region=xcod_region and ubigeos.codigo_provincia<>'00' and ubigeos.codigo_distrito='00';
		return;
ELSE
		IF EXISTS(SELECT ubigeos.* FROM ubigeos WHERE ubigeos.idubigeo=xid)
			then
			return query
				SELECT ubigeos.* FROM ubigeos WHERE ubigeos.idubigeo=xid;
				return;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end;
$$;


ALTER FUNCTION public.sel_provincia(xid integer, xidregion integer) OWNER TO postgres;

--
-- TOC entry 341 (class 1255 OID 873961)
-- Name: sel_region(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_region(xid integer, xidpais integer) RETURNS SETOF ubigeos
    LANGUAGE plpgsql
    AS $$
begin
IF (xid = 0)
		THEN 
	 return query
		SELECT u.* FROM ubigeos as  u inner join paises   as p on(u.idpais=p.idpais)
		where u.idpais=xidpais and u.codigo_provincia='00' and u.codigo_distrito='00';
		return; 
		ELSE
		IF EXISTS(SELECT ubigeos.* FROM ubigeos WHERE ubigeos.idubigeo=xid)
				THEN 
	 return query
				SELECT ubigeos.* FROM ubigeos WHERE ubigeos.idubigeo=xid;
				return; 
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
end
;
$$;


ALTER FUNCTION public.sel_region(xid integer, xidpais integer) OWNER TO postgres;

--
-- TOC entry 356 (class 1255 OID 873962)
-- Name: sel_seriecomprobante(integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_seriecomprobante(p_id_seriecomprobante integer, p_tipocomprobante character varying, p_id_tipocomprobante integer, OUT id_seriecomprobante integer, OUT serie integer, OUT correlativo integer, OUT id_tipocomprobante integer, OUT maxcorrelativo integer, OUT estado integer, OUT ttipocomprobante character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN
IF (p_id_seriecomprobante = 0 AND p_tipocomprobante='' AND p_id_tipocomprobante = 0)
	THEN
	return query
		SELECT sc.*, tc.descripcion 
		FROM seriecomprobante sc inner join tipocomprobante tc on sc.id_tipocomprobante = tc.id_tipocomprobante
		WHERE sc.estado=1 and tc.estado = 1;
	return;
END if;
IF (p_id_seriecomprobante = 0 AND p_tipocomprobante<>'' AND p_id_tipocomprobante = 0)
	THEN
	return query
		SELECT sc.*, tc.descripcion 
		FROM seriecomprobante sc inner join tipocomprobante tc on sc.id_tipocomprobante = tc.id_tipocomprobante
		WHERE sc.estado=1 and tc.estado = 1 AND tc.descripcion LIKE '%'||p_tipocomprobante|| '%';
	return;
END if;
IF (p_id_seriecomprobante <> 0 AND p_tipocomprobante='' AND p_id_tipocomprobante = 0)
	THEN
	return query
		SELECT sc.*, tc.descripcion 
		FROM seriecomprobante sc inner join tipocomprobante tc on sc.id_tipocomprobante = tc.id_tipocomprobante
		WHERE sc.estado = 1 and tc.estado = 1 and sc.id_seriecomprobante = p_id_seriecomprobante;
	return;
END if;
IF (p_id_seriecomprobante = 0 AND p_tipocomprobante='' AND p_id_tipocomprobante <> 0)
	THEN
	return query
		SELECT sc.*, tc.descripcion 
		FROM seriecomprobante sc inner join tipocomprobante tc on sc.id_tipocomprobante = tc.id_tipocomprobante
		WHERE sc.estado = 1 and tc.estado = 1 and sc.id_tipocomprobante = p_id_tipocomprobante;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_seriecomprobante(p_id_seriecomprobante integer, p_tipocomprobante character varying, p_id_tipocomprobante integer, OUT id_seriecomprobante integer, OUT serie integer, OUT correlativo integer, OUT id_tipocomprobante integer, OUT maxcorrelativo integer, OUT estado integer, OUT ttipocomprobante character varying) OWNER TO postgres;

--
-- TOC entry 367 (class 1255 OID 874959)
-- Name: sel_subcategoria(integer, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_subcategoria(p_id_subcategoria integer, p_descripcion character varying, p_categoria character varying, p_id_categoria integer, OUT id_subcategoria integer, OUT descripcion character varying, OUT id_categoria integer, OUT estado integer, OUT ccategoria character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_subcategoria = 0 AND p_descripcion = '' AND p_categoria = '' AND p_id_categoria = 0)
	THEN
	return query
		SELECT sc.*, c.descripcion 
		FROM subcategoria sc inner join categoria c on sc.id_categoria = c.id_categoria 
		WHERE sc.estado = 1 AND c.estado = 1;
	return;
END if;
IF (p_id_subcategoria = 0 AND p_descripcion <> '' AND p_categoria = '' AND p_id_categoria = 0)
	THEN
	return query
		SELECT sc.*, c.descripcion 
		FROM subcategoria sc inner join categoria c on sc.id_categoria = c.id_categoria 
		WHERE sc.estado = 1 AND c.estado = 1 AND sc.descripcion LIKE '%'||p_descripcion|| '%';
	return;
END if;
IF (p_id_subcategoria = 0 AND p_descripcion = '' AND p_categoria <> '' AND p_id_categoria = 0)
	THEN
	return query
		SELECT sc.*, c.descripcion 
		FROM subcategoria sc inner join categoria c on sc.id_categoria = c.id_categoria 
		WHERE sc.estado = 1 AND c.estado = 1 AND c.descripcion LIKE '%'||p_categoria|| '%';
	return;
END if;
IF (p_id_subcategoria = 0 AND p_descripcion = '' AND p_categoria = '' AND p_id_categoria <> 0)
	THEN
	return query
		SELECT sc.*, c.descripcion 
		FROM subcategoria sc inner join categoria c on sc.id_categoria = c.id_categoria 
		WHERE sc.estado = 1 AND c.estado = 1 AND c.id_categoria = p_id_categoria;
	return;
END if;
IF (p_id_subcategoria <> 0 AND p_descripcion = '' AND p_categoria = '' AND p_id_categoria = 0)
	THEN
	return query
		SELECT sc.*, c.descripcion 
		FROM subcategoria sc inner join categoria c on sc.id_categoria = c.id_categoria 
		WHERE sc.estado = 1 AND c.estado = 1 AND sc.id_subcategoria = p_id_subcategoria;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_subcategoria(p_id_subcategoria integer, p_descripcion character varying, p_categoria character varying, p_id_categoria integer, OUT id_subcategoria integer, OUT descripcion character varying, OUT id_categoria integer, OUT estado integer, OUT ccategoria character varying) OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 873964)
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sucursal (
    id_sucursal integer NOT NULL,
    nombre character varying(200),
    direccion character varying(200),
    telefono character varying(100),
    ciudad character varying(100),
    estado integer
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- TOC entry 357 (class 1255 OID 873970)
-- Name: sel_sucursal(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_sucursal(p_id_sucursal integer, p_nombre character varying) RETURNS SETOF sucursal
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_sucursal = 0 AND p_nombre = '')
	THEN
	return query
		SELECT * FROM sucursal where id_sucursal<>0 and estado = 1;
	return;
END if;
IF (p_id_sucursal = 0 AND p_nombre <> '')
	THEN
	return query
		SELECT * FROM sucursal where id_sucursal<>0 and estado = 1 and nombre  LIKE '%'||p_nombre|| '%';
	return;
END if;
IF (p_id_sucursal <> 0 AND p_nombre = '')
	THEN
	return query
		SELECT * FROM sucursal where id_sucursal<>0 and estado = 1 and id_sucursal = p_id_sucursal;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_sucursal(p_id_sucursal integer, p_nombre character varying) OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 873971)
-- Name: tipoconcepto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoconcepto (
    id_tipoconcepto integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.tipoconcepto OWNER TO postgres;

--
-- TOC entry 358 (class 1255 OID 873974)
-- Name: sel_tipoconcepto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_tipoconcepto() RETURNS SETOF tipoconcepto
    LANGUAGE plpgsql
    AS $$

BEGIN

return query
	SELECT * FROM tipoconcepto  WHERE estado = 1;
	return;

END;

$$;


ALTER FUNCTION public.sel_tipoconcepto() OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 876140)
-- Name: tipomovimiento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipomovimiento (
    id_tipomovimiento integer NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE public.tipomovimiento OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 876162)
-- Name: sel_tipomovimiento(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_tipomovimiento(p_id_tipomovimiento integer, p_descripcion character varying) RETURNS SETOF tipomovimiento
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_tipomovimiento = 0 AND p_descripcion = '')
	THEN
	return query
		SELECT * FROM tipomovimiento;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_tipomovimiento(p_id_tipomovimiento integer, p_descripcion character varying) OWNER TO postgres;

--
-- TOC entry 359 (class 1255 OID 873975)
-- Name: sel_ubigeo(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_ubigeo(xid integer, xidprovincia integer, xidpais integer, OUT idubigeo integer, OUT codigo_region character varying, OUT codigo_provincia character varying, OUT codigo_distrito character varying, OUT descripcion character varying, OUT idpais integer, OUT pais character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
declare xcod_provincia    CHARACTER VARYING(50);
	xcod_region   CHARACTER VARYING(50);
	 xpais CHARACTER VARYING(50);
begin

IF (xid = 0)
		THEN 
	if(xidpais=0)
		THEN 
	xpais :='PerÃº';
	xcod_provincia :=(select ubigeos.codigo_provincia from ubigeos where ubigeos.idubigeo=xidprovincia);
	 xcod_region :=(select ubigeos.codigo_region from ubigeos where ubigeos.idubigeo=xidprovincia);
			 return query
		SELECT ubigeos.*, xpais FROM ubigeos
		where ubigeos.codigo_provincia=xcod_provincia
		and xcod_region=ubigeos.codigo_region and ubigeos.codigo_distrito<>'0' and ubigeos.codigo_distrito<>'0' and ubigeos.codigo_region<>'0' and
		ubigeos.idubigeo<>0;
			return; 
		ELSE
	xpais :=(select paises.descripcion from paises where paises.idpais=xidpais);
	return query
		SELECT u.*, p.descripcion from ubigeos  as u inner join paises  as p on(u.idpais=p.idpais)
		where u.idpais=xidpais;
		return;
	end if;
		ELSE
		IF EXISTS(SELECT ubigeos.* FROM ubigeos WHERE ubigeos.idubigeo=xid)
				THEN 
					 xpais :='PerÃº';
	 return query

				SELECT ubigeos.*, xpais FROM ubigeos WHERE ubigeos.idubigeo=xid;
				return; 
		ELSE
			RAISE EXCEPTION 'Nonexistent ID --> %', xid;
			return;
			END if;
	END if;
	end
;
$$;


ALTER FUNCTION public.sel_ubigeo(xid integer, xidprovincia integer, xidpais integer, OUT idubigeo integer, OUT codigo_region character varying, OUT codigo_provincia character varying, OUT codigo_distrito character varying, OUT descripcion character varying, OUT idpais integer, OUT pais character varying) OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 873976)
-- Name: unidadmedida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidadmedida (
    id_unidadmedida integer NOT NULL,
    descripcion character varying(100),
    prefijo character varying(50),
    estado integer,
    cant_unidad integer,
    equivalenteunidad integer
);


ALTER TABLE public.unidadmedida OWNER TO postgres;

--
-- TOC entry 360 (class 1255 OID 873979)
-- Name: sel_unidadbase(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_unidadbase(p_equivalenteunidad integer) RETURNS SETOF unidadmedida
    LANGUAGE plpgsql
    AS $$

BEGIN
	return query
		SELECT um.*
		FROM unidadmedida um left join unidadmedida e on e.id_unidadmedida = um.equivalenteunidad
		WHERE um.estado=1 and um.equivalenteunidad = p_equivalenteunidad;
	return; 
END;

$$;


ALTER FUNCTION public.sel_unidadbase(p_equivalenteunidad integer) OWNER TO postgres;

--
-- TOC entry 362 (class 1255 OID 873980)
-- Name: sel_unidadmedida(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_unidadmedida(p_id_unidadmedida integer, p_descripcion character varying, p_prefijo character varying, OUT id_unidadmedida integer, OUT descripcion character varying, OUT prefijo character varying, OUT estado integer, OUT cant_unidad integer, OUT equivalenteunidad integer, OUT unidadbase character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_unidadmedida = 0 AND p_descripcion = '' AND p_prefijo = '')
	THEN
	return query
		SELECT um.*, e.descripcion
		FROM unidadmedida um left join unidadmedida e on e.id_unidadmedida = um.equivalenteunidad
		WHERE um.estado=1 
		ORDER BY um.id_unidadmedida;
	return;
END if;
IF (p_id_unidadmedida = 0 AND p_descripcion <> '' AND p_prefijo = '')
	THEN
	return query
		SELECT um.*, e.descripcion
		FROM unidadmedida um left join unidadmedida e on e.id_unidadmedida = um.equivalenteunidad
		WHERE um.estado=1 AND um.descripcion LIKE '%'||p_descripcion|| '%'
		ORDER BY um.id_unidadmedida;
	return;
END if;
IF (p_id_unidadmedida = 0 AND p_descripcion = '' AND p_prefijo <> '')
	THEN
	return query
		SELECT um.*, e.descripcion
		FROM unidadmedida um left join unidadmedida e on e.id_unidadmedida = um.equivalenteunidad
		WHERE um.estado=1 AND um.prefijo LIKE '%'||p_prefijo|| '%'
		ORDER BY um.id_unidadmedida;
	return;
END if;
IF (p_id_unidadmedida <> 0 AND p_descripcion = '' AND p_prefijo = '')
	THEN
	return query
		SELECT um.*, e.descripcion
		FROM unidadmedida um left join unidadmedida e on e.id_unidadmedida = um.equivalenteunidad
		WHERE um.estado=1 AND um.id_unidadmedida = p_id_unidadmedida
		ORDER BY um.id_unidadmedida;
END if;
END;

$$;


ALTER FUNCTION public.sel_unidadmedida(p_id_unidadmedida integer, p_descripcion character varying, p_prefijo character varying, OUT id_unidadmedida integer, OUT descripcion character varying, OUT prefijo character varying, OUT estado integer, OUT cant_unidad integer, OUT equivalenteunidad integer, OUT unidadbase character varying) OWNER TO postgres;

--
-- TOC entry 363 (class 1255 OID 873981)
-- Name: sel_venta(integer, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sel_venta(p_id_venta integer, p_nrodoc character varying, p_fechaventa character varying, p_cliente character varying, p_empleado character varying, OUT id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT fechaventa timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT ncliente character varying, OUT acliente character varying, OUT dircliente character varying, OUT doccliente character varying, OUT nempleado character varying, OUT aempleado character varying, OUT ttipopago character varying, OUT ttipocomprobante character varying, OUT aalmacen character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$

BEGIN

IF (p_id_venta = 0 AND p_nrodoc = '' AND p_fechaventa = '' AND p_cliente = '' AND p_empleado = '')
	THEN
	return query
		SELECT v.*, c.nombres, c.apellidos,c.direccion,c.documento, e.nombre, e.apellido, tp.descripcion, tc.descripcion, a.descripcion
		FROM venta v inner join cliente c on v.idcliente=c.idcliente
			inner join empleado e on v.id_empleado=e.id_empleado
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
			inner join almacen a on a.id_almacen = v.id_almacen
		WHERE v.estado = 1 and c.estado = 1 and e.estado = 1 and tp.estado = 1 and tc.estado = 1
		order by v.id_venta desc;
	return;
END if;
IF (p_id_venta = 0 AND p_nrodoc <> '' AND p_fechaventa = '' AND p_cliente = '' AND p_empleado = '')
	THEN
	return query
		SELECT v.*, c.nombres, c.apellidos,c.direccion,c.documento, e.nombre, e.apellido, tp.descripcion, tc.descripcion, a.descripcion
		FROM venta v inner join cliente c on v.idcliente=c.idcliente
			inner join empleado e on v.id_empleado=e.id_empleado
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
			inner join almacen a on a.id_almacen = v.id_almacen
		WHERE v.estado = 1 and c.estado = 1 and e.estado = 1 and tp.estado = 1 and tc.estado = 1 and v.nrodoc LIKE '%'||p_nrodoc|| '%'
		order by v.id_venta desc;
	return;
END if;
IF (p_id_venta = 0 AND p_nrodoc = '' AND p_fechaventa <> '' AND p_cliente = '' AND p_empleado = '')
	THEN
	return query
		SELECT v.*, c.nombres, c.apellidos,c.direccion,c.documento, e.nombre, e.apellido, tp.descripcion, tc.descripcion, a.descripcion
		FROM venta v inner join cliente c on v.idcliente=c.idcliente
			inner join empleado e on v.id_empleado=e.id_empleado
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
			inner join almacen a on a.id_almacen = v.id_almacen
		WHERE v.estado = 1 and c.estado = 1 and e.estado = 1 and tp.estado = 1 and tc.estado = 1 and v.fechaventa LIKE '%'||p_fechaventa|| '%'
		order by v.id_venta desc;
	return;
END if;
IF (p_id_venta = 0 AND p_nrodoc = '' AND p_fechaventa = '' AND p_cliente <> '' AND p_empleado = '')
	THEN
	return query
		SELECT v.*, c.nombres, c.apellidos,c.direccion,c.documento, e.nombre, e.apellido, tp.descripcion, tc.descripcion, a.descripcion
		FROM venta v inner join cliente c on v.idcliente=c.idcliente
			inner join empleado e on v.id_empleado=e.id_empleado
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
			inner join almacen a on a.id_almacen = v.id_almacen
		WHERE v.estado = 1 and c.estado = 1 and e.estado = 1 and tp.estado = 1 and tc.estado = 1 and (c.nombres LIKE '%'||p_cliente|| '%' or c.apellidos LIKE '%'||p_cliente|| '%')
		order by v.id_venta desc;
	return;
END if;
IF (p_id_venta = 0 AND p_nrodoc = '' AND p_fechaventa = '' AND p_cliente = '' AND p_empleado <> '')
	THEN
	return query
		SELECT v.*, c.nombres, c.apellidos,c.direccion,c.documento, e.nombre, e.apellido, tp.descripcion, tc.descripcion, a.descripcion
		FROM venta v inner join cliente c on v.idcliente=c.idcliente
			inner join empleado e on v.id_empleado=e.id_empleado
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
			inner join almacen a on a.id_almacen = v.id_almacen
		WHERE v.estado = 1 and c.estado = 1 and e.estado = 1 and tp.estado = 1 and tc.estado = 1 and (e.nombre LIKE '%'||p_empleado|| '%' or e.apellido LIKE '%'||p_empleado|| '%')
		order by v.id_venta desc;
	return;
END if;
IF (p_id_venta <> 0 AND p_nrodoc = '' AND p_fechaventa = '' AND p_cliente = '' AND p_empleado = '')
	THEN
	return query
		SELECT v.*, c.nombres, c.apellidos,c.direccion,c.documento, e.nombre, e.apellido, tp.descripcion, tc.descripcion, a.descripcion
		FROM venta v inner join cliente c on v.idcliente=c.idcliente
			inner join empleado e on v.id_empleado=e.id_empleado
			inner join tipopago tp on v.id_tipopago=tp.id_tipopago
			inner join tipocomprobante tc on v.id_tipocomprobante=tc.id_tipocomprobante
			inner join almacen a on a.id_almacen = v.id_almacen
		WHERE v.estado = 1 and c.estado = 1 and e.estado = 1 and tp.estado = 1 and tc.estado = 1 and v.id_venta = p_id_venta
		order by v.id_venta desc;
	return;
END if;
END;

$$;


ALTER FUNCTION public.sel_venta(p_id_venta integer, p_nrodoc character varying, p_fechaventa character varying, p_cliente character varying, p_empleado character varying, OUT id_venta integer, OUT idcliente integer, OUT id_empleado integer, OUT id_tipopago integer, OUT fechaventa timestamp without time zone, OUT estado integer, OUT subtotal numeric, OUT igv numeric, OUT id_tipocomprobante integer, OUT nrodoc character varying, OUT estadopago character, OUT id_almacen integer, OUT ncliente character varying, OUT acliente character varying, OUT dircliente character varying, OUT doccliente character varying, OUT nempleado character varying, OUT aempleado character varying, OUT ttipopago character varying, OUT ttipocomprobante character varying, OUT aalmacen character varying) OWNER TO postgres;

--
-- TOC entry 364 (class 1255 OID 873982)
-- Name: selmoduoloxurl(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION selmoduoloxurl(p_url character varying) RETURNS SETOF modulos
    LANGUAGE plpgsql
    AS $$

BEGIN
	return query
		SELECT * FROM modulos where url=p_url and estado = 1;
	return;
END;

$$;


ALTER FUNCTION public.selmoduoloxurl(p_url character varying) OWNER TO postgres;

--
-- TOC entry 365 (class 1255 OID 873983)
-- Name: valida_acceso(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION valida_acceso(xid_perfil integer, xmodulo character varying, OUT id_perfil integer, OUT idmodulo integer, OUT estado smallint, OUT pperfil character varying, OUT mmodulo character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
return query
SELECT p.*, per.descripcion, m.descripcion
FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
	inner join modulos as m on(p.idmodulo=m.idmodulo)
	WHERE p.id_perfil=xid_perfil AND m.url=xmodulo AND m.estado = 1 and p.estado=1;
return;	

END;
$$;


ALTER FUNCTION public.valida_acceso(xid_perfil integer, xmodulo character varying, OUT id_perfil integer, OUT idmodulo integer, OUT estado smallint, OUT pperfil character varying, OUT mmodulo character varying) OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 873984)
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE almacen (
    id_almacen integer NOT NULL,
    descripcion character varying(100),
    ubicacion character varying(50),
    estado integer,
    id_sucursal integer
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 873987)
-- Name: almacen_id_almacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE almacen_id_almacen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.almacen_id_almacen_seq OWNER TO postgres;

--
-- TOC entry 2616 (class 0 OID 0)
-- Dependencies: 182
-- Name: almacen_id_almacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE almacen_id_almacen_seq OWNED BY almacen.id_almacen;


--
-- TOC entry 2617 (class 0 OID 0)
-- Dependencies: 182
-- Name: almacen_id_almacen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('almacen_id_almacen_seq', 2, true);


--
-- TOC entry 183 (class 1259 OID 873989)
-- Name: caja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE caja (
    id_caja integer NOT NULL,
    id_empleado integer,
    fecha_hora_ap timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    saldo_ap numeric(18,2),
    fecha_hora_ci timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    saldo_ci numeric(18,2),
    estado integer,
    id_sucursal integer
);


ALTER TABLE public.caja OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 873994)
-- Name: caja_id_caja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE caja_id_caja_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caja_id_caja_seq OWNER TO postgres;

--
-- TOC entry 2618 (class 0 OID 0)
-- Dependencies: 184
-- Name: caja_id_caja_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE caja_id_caja_seq OWNED BY caja.id_caja;


--
-- TOC entry 2619 (class 0 OID 0)
-- Dependencies: 184
-- Name: caja_id_caja_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('caja_id_caja_seq', 22, true);


--
-- TOC entry 185 (class 1259 OID 873996)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 2620 (class 0 OID 0)
-- Dependencies: 185
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;


--
-- TOC entry 2621 (class 0 OID 0)
-- Dependencies: 185
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_categoria_seq', 14, true);


--
-- TOC entry 186 (class 1259 OID 873998)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    idcliente integer NOT NULL,
    nombres character varying(50) DEFAULT NULL::character varying,
    apellidos character varying(50) DEFAULT NULL::character varying,
    documento character varying(50) DEFAULT NULL::character varying,
    fecha_nacimiento timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    sexo smallint,
    telefono character varying(50) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    estado_civil character varying(50) DEFAULT NULL::character varying,
    idprofesion integer NOT NULL,
    idubigeo integer NOT NULL,
    direccion character varying(50) DEFAULT NULL::character varying,
    tipo character varying(50) DEFAULT NULL::character varying,
    estado smallint,
    maximocredito numeric(18,2)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 874010)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compra (
    id_compra integer NOT NULL,
    id_proveedor integer,
    id_tipopago integer,
    fechacompra date,
    monto numeric(18,2),
    estado integer,
    nrodoc character varying(20),
    igv numeric(5,2),
    estadopago character(1)
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 874013)
-- Name: compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE compra_id_compra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_compra_seq OWNER TO postgres;

--
-- TOC entry 2622 (class 0 OID 0)
-- Dependencies: 188
-- Name: compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compra_id_compra_seq OWNED BY compra.id_compra;


--
-- TOC entry 2623 (class 0 OID 0)
-- Dependencies: 188
-- Name: compra_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('compra_id_compra_seq', 33, true);


--
-- TOC entry 189 (class 1259 OID 874015)
-- Name: concepto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE concepto (
    id_concepto integer NOT NULL,
    descripcion character varying(100),
    estado integer,
    id_tipoconcepto integer
);


ALTER TABLE public.concepto OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 874018)
-- Name: concepto_id_concepto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE concepto_id_concepto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concepto_id_concepto_seq OWNER TO postgres;

--
-- TOC entry 2624 (class 0 OID 0)
-- Dependencies: 190
-- Name: concepto_id_concepto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE concepto_id_concepto_seq OWNED BY concepto.id_concepto;


--
-- TOC entry 2625 (class 0 OID 0)
-- Dependencies: 190
-- Name: concepto_id_concepto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('concepto_id_concepto_seq', 6, true);


--
-- TOC entry 191 (class 1259 OID 874020)
-- Name: cronogcobro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cronogcobro (
    id_cronogcobro integer NOT NULL,
    id_venta integer,
    fecha date,
    monto_cuota numeric(5,2),
    nrocuota integer,
    monto_cobrado numeric(5,2)
);


ALTER TABLE public.cronogcobro OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 874023)
-- Name: cronogcobro_id_cronogcobro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cronogcobro_id_cronogcobro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cronogcobro_id_cronogcobro_seq OWNER TO postgres;

--
-- TOC entry 2626 (class 0 OID 0)
-- Dependencies: 192
-- Name: cronogcobro_id_cronogcobro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cronogcobro_id_cronogcobro_seq OWNED BY cronogcobro.id_cronogcobro;


--
-- TOC entry 2627 (class 0 OID 0)
-- Dependencies: 192
-- Name: cronogcobro_id_cronogcobro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cronogcobro_id_cronogcobro_seq', 41, true);


--
-- TOC entry 193 (class 1259 OID 874025)
-- Name: cronogpago; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cronogpago (
    id_cronogpago integer NOT NULL,
    id_compra integer,
    fecha date,
    monto_cuota numeric(5,2),
    nrocuota integer,
    monto_pagado numeric(5,2)
);


ALTER TABLE public.cronogpago OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 874028)
-- Name: cronogpago_id_cronogpago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cronogpago_id_cronogpago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cronogpago_id_cronogpago_seq OWNER TO postgres;

--
-- TOC entry 2628 (class 0 OID 0)
-- Dependencies: 194
-- Name: cronogpago_id_cronogpago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cronogpago_id_cronogpago_seq OWNED BY cronogpago.id_cronogpago;


--
-- TOC entry 2629 (class 0 OID 0)
-- Dependencies: 194
-- Name: cronogpago_id_cronogpago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cronogpago_id_cronogpago_seq', 83, true);


--
-- TOC entry 195 (class 1259 OID 874030)
-- Name: detamortizacioncobro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detamortizacioncobro (
    id_movimiento integer NOT NULL,
    id_cronogcobro integer NOT NULL,
    monto numeric(5,2),
    estado integer
);


ALTER TABLE public.detamortizacioncobro OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 874033)
-- Name: detamortizacionpago; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detamortizacionpago (
    id_cronogpago integer NOT NULL,
    id_movimiento integer NOT NULL,
    monto integer,
    estado integer
);


ALTER TABLE public.detamortizacionpago OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 874036)
-- Name: detcompraproducto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detcompraproducto (
    id_compra integer NOT NULL,
    id_producto integer NOT NULL,
    cantidadum integer,
    preciounitario numeric(5,2),
    id_unidadmedida integer,
    cantidadub integer,
    precioub numeric(18,6)
);


ALTER TABLE public.detcompraproducto OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 874039)
-- Name: detprodalm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detprodalm (
    id_almacen integer NOT NULL,
    id_producto integer NOT NULL,
    stock numeric(18,3)
);


ALTER TABLE public.detprodalm OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 874042)
-- Name: detproductounidmedida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detproductounidmedida (
    id_unidadmedida integer NOT NULL,
    id_producto integer NOT NULL,
    preciovcont numeric(5,2),
    preciovcre numeric(5,2)
);


ALTER TABLE public.detproductounidmedida OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 874045)
-- Name: detventa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detventa (
    id_venta integer NOT NULL,
    id_producto integer NOT NULL,
    cantidadum integer,
    preciounitario numeric(5,2),
    id_unidadmedida integer,
    cantidadub integer,
    precioub numeric(5,2)
);


ALTER TABLE public.detventa OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 874048)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empleado (
    id_empleado integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    direccion character varying(50),
    dni character(8),
    fechanacimiento date,
    estado integer,
    usuario character varying(50),
    clave character varying(50),
    id_perfil integer,
    telefono character varying(15),
    id_sucursal integer
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 874051)
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleado_id_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 2630 (class 0 OID 0)
-- Dependencies: 202
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleado_id_empleado_seq OWNED BY empleado.id_empleado;


--
-- TOC entry 2631 (class 0 OID 0)
-- Dependencies: 202
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleado_id_empleado_seq', 8, true);


--
-- TOC entry 203 (class 1259 OID 874053)
-- Name: formapago; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formapago (
    id_formapago integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.formapago OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 874056)
-- Name: formapago_id_formapago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formapago_id_formapago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formapago_id_formapago_seq OWNER TO postgres;

--
-- TOC entry 2632 (class 0 OID 0)
-- Dependencies: 204
-- Name: formapago_id_formapago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formapago_id_formapago_seq OWNED BY formapago.id_formapago;


--
-- TOC entry 2633 (class 0 OID 0)
-- Dependencies: 204
-- Name: formapago_id_formapago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formapago_id_formapago_seq', 1, false);


--
-- TOC entry 205 (class 1259 OID 874058)
-- Name: informacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.informacion_id_seq OWNER TO postgres;

--
-- TOC entry 2634 (class 0 OID 0)
-- Dependencies: 205
-- Name: informacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE informacion_id_seq OWNED BY informacion.id;


--
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 205
-- Name: informacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('informacion_id_seq', 1, false);


--
-- TOC entry 206 (class 1259 OID 874060)
-- Name: kardex_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex_producto (
    id_kardex integer NOT NULL,
    id_producto integer,
    cantidad integer,
    fecha date,
    id_almacen integer,
    saldo numeric(10,3),
    id_motivomovimiento integer
);


ALTER TABLE public.kardex_producto OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 874063)
-- Name: kardex_producto_id_kardex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardex_producto_id_kardex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_producto_id_kardex_seq OWNER TO postgres;

--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 207
-- Name: kardex_producto_id_kardex_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardex_producto_id_kardex_seq OWNED BY kardex_producto.id_kardex;


--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 207
-- Name: kardex_producto_id_kardex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardex_producto_id_kardex_seq', 38, true);


--
-- TOC entry 208 (class 1259 OID 874065)
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marca_id_marca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_id_marca_seq OWNER TO postgres;

--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 208
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marca_id_marca_seq OWNED BY marca.id_marca;


--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 208
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('marca_id_marca_seq', 71, true);


--
-- TOC entry 231 (class 1259 OID 876092)
-- Name: marcas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marcas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marcas_id_seq OWNER TO postgres;

--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 231
-- Name: marcas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marcas_id_seq OWNED BY marcas.id;


--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 231
-- Name: marcas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('marcas_id_seq', 1, false);


--
-- TOC entry 235 (class 1259 OID 876147)
-- Name: motivomovimiento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE motivomovimiento (
    id_motivomovimiento integer NOT NULL,
    descripcion character varying(100),
    estado integer,
    id_tipomovimiento integer
);


ALTER TABLE public.motivomovimiento OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 876145)
-- Name: motivomovimiento_id_motivomovimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE motivomovimiento_id_motivomovimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motivomovimiento_id_motivomovimiento_seq OWNER TO postgres;

--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 234
-- Name: motivomovimiento_id_motivomovimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE motivomovimiento_id_motivomovimiento_seq OWNED BY motivomovimiento.id_motivomovimiento;


--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 234
-- Name: motivomovimiento_id_motivomovimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('motivomovimiento_id_motivomovimiento_seq', 6, true);


--
-- TOC entry 209 (class 1259 OID 874067)
-- Name: movimiento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movimiento (
    id_movimiento integer NOT NULL,
    id_caja integer,
    id_concepto integer,
    id_formapago integer,
    monto numeric(18,2),
    estado integer,
    fecha timestamp without time zone
);


ALTER TABLE public.movimiento OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 874070)
-- Name: movimiento_id_movimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movimiento_id_movimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimiento_id_movimiento_seq OWNER TO postgres;

--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 210
-- Name: movimiento_id_movimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movimiento_id_movimiento_seq OWNED BY movimiento.id_movimiento;


--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 210
-- Name: movimiento_id_movimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movimiento_id_movimiento_seq', 40, true);


--
-- TOC entry 211 (class 1259 OID 874072)
-- Name: paises; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE paises (
    idpais integer NOT NULL,
    descripcion character varying(50) DEFAULT NULL::character varying,
    codigo character varying(50) DEFAULT NULL::character varying,
    idcontinente integer NOT NULL
);


ALTER TABLE public.paises OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 874077)
-- Name: permisos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permisos (
    id_perfil integer NOT NULL,
    idmodulo integer NOT NULL,
    estado smallint
);


ALTER TABLE public.permisos OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 874080)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto (
    id_producto integer NOT NULL,
    id_marca integer,
    id_subcategoria integer,
    descripcion character varying(100),
    estado integer,
    id_unidadmedida integer,
    precioc numeric(18,6)
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 874083)
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_id_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 214
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE producto_id_producto_seq OWNED BY producto.id_producto;


--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 214
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_id_producto_seq', 37, true);


--
-- TOC entry 215 (class 1259 OID 874085)
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedor_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedor_id_proveedor_seq OWNER TO postgres;

--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 215
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedor_id_proveedor_seq OWNED BY proveedor.id_proveedor;


--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 215
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedor_id_proveedor_seq', 30, true);


--
-- TOC entry 216 (class 1259 OID 874087)
-- Name: seriecomprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE seriecomprobante (
    id_seriecomprobante integer NOT NULL,
    serie integer,
    correlativo integer,
    id_tipocomprobante integer,
    maxcorrelativo integer,
    estado integer
);


ALTER TABLE public.seriecomprobante OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 874090)
-- Name: seriecomprobante_id_seriecomprobante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seriecomprobante_id_seriecomprobante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seriecomprobante_id_seriecomprobante_seq OWNER TO postgres;

--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 217
-- Name: seriecomprobante_id_seriecomprobante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seriecomprobante_id_seriecomprobante_seq OWNED BY seriecomprobante.id_seriecomprobante;


--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 217
-- Name: seriecomprobante_id_seriecomprobante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seriecomprobante_id_seriecomprobante_seq', 2, true);


--
-- TOC entry 218 (class 1259 OID 874092)
-- Name: subcategoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subcategoria (
    id_subcategoria integer NOT NULL,
    descripcion character varying(100),
    id_categoria integer,
    estado integer
);


ALTER TABLE public.subcategoria OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 874095)
-- Name: subcategoria_id_subcategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subcategoria_id_subcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategoria_id_subcategoria_seq OWNER TO postgres;

--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 219
-- Name: subcategoria_id_subcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subcategoria_id_subcategoria_seq OWNED BY subcategoria.id_subcategoria;


--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 219
-- Name: subcategoria_id_subcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subcategoria_id_subcategoria_seq', 41, true);


--
-- TOC entry 220 (class 1259 OID 874097)
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sucursal_id_sucursal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursal_id_sucursal_seq OWNER TO postgres;

--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 220
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sucursal_id_sucursal_seq OWNED BY sucursal.id_sucursal;


--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 220
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sucursal_id_sucursal_seq', 3, true);


--
-- TOC entry 221 (class 1259 OID 874099)
-- Name: tipocliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipocliente (
    id_tipocliente integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.tipocliente OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 874102)
-- Name: tipocliente_id_tipocliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipocliente_id_tipocliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipocliente_id_tipocliente_seq OWNER TO postgres;

--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 222
-- Name: tipocliente_id_tipocliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipocliente_id_tipocliente_seq OWNED BY tipocliente.id_tipocliente;


--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 222
-- Name: tipocliente_id_tipocliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipocliente_id_tipocliente_seq', 1, false);


--
-- TOC entry 223 (class 1259 OID 874104)
-- Name: tipocomprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipocomprobante (
    id_tipocomprobante integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.tipocomprobante OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 874107)
-- Name: tipocomprobante_id_tipocomprobante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipocomprobante_id_tipocomprobante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipocomprobante_id_tipocomprobante_seq OWNER TO postgres;

--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 224
-- Name: tipocomprobante_id_tipocomprobante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipocomprobante_id_tipocomprobante_seq OWNED BY tipocomprobante.id_tipocomprobante;


--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 224
-- Name: tipocomprobante_id_tipocomprobante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipocomprobante_id_tipocomprobante_seq', 2, true);


--
-- TOC entry 225 (class 1259 OID 874109)
-- Name: tipoconcepto_id_tipoconcepto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipoconcepto_id_tipoconcepto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipoconcepto_id_tipoconcepto_seq OWNER TO postgres;

--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipoconcepto_id_tipoconcepto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipoconcepto_id_tipoconcepto_seq OWNED BY tipoconcepto.id_tipoconcepto;


--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipoconcepto_id_tipoconcepto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipoconcepto_id_tipoconcepto_seq', 1, false);


--
-- TOC entry 226 (class 1259 OID 874111)
-- Name: tipopago; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipopago (
    id_tipopago integer NOT NULL,
    descripcion character varying(100),
    estado integer
);


ALTER TABLE public.tipopago OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 874114)
-- Name: tipopago_id_tipopago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipopago_id_tipopago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipopago_id_tipopago_seq OWNER TO postgres;

--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 227
-- Name: tipopago_id_tipopago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipopago_id_tipopago_seq OWNED BY tipopago.id_tipopago;


--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 227
-- Name: tipopago_id_tipopago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipopago_id_tipopago_seq', 1, false);


--
-- TOC entry 228 (class 1259 OID 874116)
-- Name: unidadmedida_id_unidadmedida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidadmedida_id_unidadmedida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidadmedida_id_unidadmedida_seq OWNER TO postgres;

--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 228
-- Name: unidadmedida_id_unidadmedida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidadmedida_id_unidadmedida_seq OWNED BY unidadmedida.id_unidadmedida;


--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 228
-- Name: unidadmedida_id_unidadmedida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidadmedida_id_unidadmedida_seq', 11, true);


--
-- TOC entry 229 (class 1259 OID 874118)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE venta (
    id_venta integer NOT NULL,
    idcliente integer,
    id_empleado integer,
    id_tipopago integer,
    fechaventa timestamp without time zone,
    estado integer,
    subtotal numeric(18,2),
    igv numeric(5,2),
    id_tipocomprobante integer,
    nrodoc character varying(20),
    estadopago character(1),
    id_almacen integer
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 874121)
-- Name: venta_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venta_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_id_venta_seq OWNER TO postgres;

--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 230
-- Name: venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venta_id_venta_seq OWNED BY venta.id_venta;


--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 230
-- Name: venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venta_id_venta_seq', 32, true);


--
-- TOC entry 2293 (class 2604 OID 874123)
-- Name: id_almacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen ALTER COLUMN id_almacen SET DEFAULT nextval('almacen_id_almacen_seq'::regclass);


--
-- TOC entry 2296 (class 2604 OID 874124)
-- Name: id_caja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caja ALTER COLUMN id_caja SET DEFAULT nextval('caja_id_caja_seq'::regclass);


--
-- TOC entry 2281 (class 2604 OID 874125)
-- Name: id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id_categoria SET DEFAULT nextval('categoria_id_categoria_seq'::regclass);


--
-- TOC entry 2306 (class 2604 OID 874126)
-- Name: id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra ALTER COLUMN id_compra SET DEFAULT nextval('compra_id_compra_seq'::regclass);


--
-- TOC entry 2307 (class 2604 OID 874127)
-- Name: id_concepto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY concepto ALTER COLUMN id_concepto SET DEFAULT nextval('concepto_id_concepto_seq'::regclass);


--
-- TOC entry 2308 (class 2604 OID 874128)
-- Name: id_cronogcobro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogcobro ALTER COLUMN id_cronogcobro SET DEFAULT nextval('cronogcobro_id_cronogcobro_seq'::regclass);


--
-- TOC entry 2309 (class 2604 OID 874129)
-- Name: id_cronogpago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogpago ALTER COLUMN id_cronogpago SET DEFAULT nextval('cronogpago_id_cronogpago_seq'::regclass);


--
-- TOC entry 2310 (class 2604 OID 874130)
-- Name: id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado ALTER COLUMN id_empleado SET DEFAULT nextval('empleado_id_empleado_seq'::regclass);


--
-- TOC entry 2311 (class 2604 OID 874131)
-- Name: id_formapago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formapago ALTER COLUMN id_formapago SET DEFAULT nextval('formapago_id_formapago_seq'::regclass);


--
-- TOC entry 2277 (class 2604 OID 874132)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY informacion ALTER COLUMN id SET DEFAULT nextval('informacion_id_seq'::regclass);


--
-- TOC entry 2312 (class 2604 OID 874133)
-- Name: id_kardex; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_producto ALTER COLUMN id_kardex SET DEFAULT nextval('kardex_producto_id_kardex_seq'::regclass);


--
-- TOC entry 2282 (class 2604 OID 874134)
-- Name: id_marca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca ALTER COLUMN id_marca SET DEFAULT nextval('marca_id_marca_seq'::regclass);


--
-- TOC entry 2323 (class 2604 OID 876097)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marcas ALTER COLUMN id SET DEFAULT nextval('marcas_id_seq'::regclass);


--
-- TOC entry 2324 (class 2604 OID 876150)
-- Name: id_motivomovimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivomovimiento ALTER COLUMN id_motivomovimiento SET DEFAULT nextval('motivomovimiento_id_motivomovimiento_seq'::regclass);


--
-- TOC entry 2313 (class 2604 OID 874135)
-- Name: id_movimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento ALTER COLUMN id_movimiento SET DEFAULT nextval('movimiento_id_movimiento_seq'::regclass);


--
-- TOC entry 2316 (class 2604 OID 874136)
-- Name: id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto ALTER COLUMN id_producto SET DEFAULT nextval('producto_id_producto_seq'::regclass);


--
-- TOC entry 2285 (class 2604 OID 874137)
-- Name: id_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedor ALTER COLUMN id_proveedor SET DEFAULT nextval('proveedor_id_proveedor_seq'::regclass);


--
-- TOC entry 2317 (class 2604 OID 874138)
-- Name: id_seriecomprobante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seriecomprobante ALTER COLUMN id_seriecomprobante SET DEFAULT nextval('seriecomprobante_id_seriecomprobante_seq'::regclass);


--
-- TOC entry 2318 (class 2604 OID 874139)
-- Name: id_subcategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subcategoria ALTER COLUMN id_subcategoria SET DEFAULT nextval('subcategoria_id_subcategoria_seq'::regclass);


--
-- TOC entry 2290 (class 2604 OID 874140)
-- Name: id_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sucursal ALTER COLUMN id_sucursal SET DEFAULT nextval('sucursal_id_sucursal_seq'::regclass);


--
-- TOC entry 2319 (class 2604 OID 874141)
-- Name: id_tipocliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipocliente ALTER COLUMN id_tipocliente SET DEFAULT nextval('tipocliente_id_tipocliente_seq'::regclass);


--
-- TOC entry 2320 (class 2604 OID 874142)
-- Name: id_tipocomprobante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipocomprobante ALTER COLUMN id_tipocomprobante SET DEFAULT nextval('tipocomprobante_id_tipocomprobante_seq'::regclass);


--
-- TOC entry 2291 (class 2604 OID 874143)
-- Name: id_tipoconcepto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipoconcepto ALTER COLUMN id_tipoconcepto SET DEFAULT nextval('tipoconcepto_id_tipoconcepto_seq'::regclass);


--
-- TOC entry 2321 (class 2604 OID 874144)
-- Name: id_tipopago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipopago ALTER COLUMN id_tipopago SET DEFAULT nextval('tipopago_id_tipopago_seq'::regclass);


--
-- TOC entry 2292 (class 2604 OID 874145)
-- Name: id_unidadmedida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidadmedida ALTER COLUMN id_unidadmedida SET DEFAULT nextval('unidadmedida_id_unidadmedida_seq'::regclass);


--
-- TOC entry 2322 (class 2604 OID 874146)
-- Name: id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta ALTER COLUMN id_venta SET DEFAULT nextval('venta_id_venta_seq'::regclass);


--
-- TOC entry 2579 (class 0 OID 873984)
-- Dependencies: 181
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO almacen (id_almacen, descripcion, ubicacion, estado, id_sucursal) VALUES (1, 'ALMACEN CENTRAL', 'MARTIN DE LA RIVA # 276', 1, 1);
INSERT INTO almacen (id_almacen, descripcion, ubicacion, estado, id_sucursal) VALUES (2, 'ALMACEN SUCURSAL', 'VIA DE EVITAMIENTO # 456', 1, 2);


--
-- TOC entry 2580 (class 0 OID 873989)
-- Dependencies: 183
-- Data for Name: caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO caja (id_caja, id_empleado, fecha_hora_ap, saldo_ap, fecha_hora_ci, saldo_ci, estado, id_sucursal) VALUES (21, 2, '2013-11-21 12:10:37', 400.00, '2013-11-23 20:44:10', 451.00, 0, 1);
INSERT INTO caja (id_caja, id_empleado, fecha_hora_ap, saldo_ap, fecha_hora_ci, saldo_ci, estado, id_sucursal) VALUES (22, 2, '2013-11-23 20:44:14', 451.00, '1990-01-01 00:00:00', 281.00, 1, 1);


--
-- TOC entry 2570 (class 0 OID 873914)
-- Dependencies: 172
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (2, 'AGREGADOS', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (3, 'ANTIBIOTICOS', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (4, 'AGROQUIMICOS', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (5, 'ALIMENTOS', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (6, 'FERTILIZANTES', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (7, 'HERRAMIENTAS', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (12, 'VETERINARIA', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (13, 'SEMILLAS', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (9, 'SEMILLAS', 0);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (10, 'PULVERIZADORES', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (11, 'ABONOS FOLIARES', 0);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (8, 'MAQUINARIA', 0);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (14, 'SANEAMIENTO AMBIENTAL', 1);
INSERT INTO categoria (id_categoria, descripcion, estado) VALUES (1, 'ABONOS Y CORRECTORES', 1);


--
-- TOC entry 2581 (class 0 OID 873998)
-- Dependencies: 186
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente (idcliente, nombres, apellidos, documento, fecha_nacimiento, sexo, telefono, email, estado_civil, idprofesion, idubigeo, direccion, tipo, estado, maximocredito) VALUES (2, 'PESCADOS.SAC', '', '45124376', '1990-01-01 00:00:00', 1, ' 645648649848', 'PES@HOTMAUIL.COM', '', 67, 1173, 'JR PISCIS', 'JURIDICO', 1, 200.00);
INSERT INTO cliente (idcliente, nombres, apellidos, documento, fecha_nacimiento, sexo, telefono, email, estado_civil, idprofesion, idubigeo, direccion, tipo, estado, maximocredito) VALUES (1, 'JOSE', 'LOPEZ', '12345678', '1979-01-30 00:00:00', 1, '94586321458', 'PEPS@HOTNAIL.COM', 'SOLTERO(A)', 5, 1359, 'JR ABRIL', 'NATURAL', 1, 200.00);


--
-- TOC entry 2582 (class 0 OID 874010)
-- Dependencies: 187
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO compra (id_compra, id_proveedor, id_tipopago, fechacompra, monto, estado, nrodoc, igv, estadopago) VALUES (32, 16, 2, '2013-11-21', 3820.00, 1, '003-122131', 0.00, '0');
INSERT INTO compra (id_compra, id_proveedor, id_tipopago, fechacompra, monto, estado, nrodoc, igv, estadopago) VALUES (33, 30, 2, '2013-11-23', 134.00, 1, '123456', 0.19, '1');


--
-- TOC entry 2583 (class 0 OID 874015)
-- Dependencies: 189
-- Data for Name: concepto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO concepto (id_concepto, descripcion, estado, id_tipoconcepto) VALUES (1, 'VENTA DE PRODUCTO', 1, 1);
INSERT INTO concepto (id_concepto, descripcion, estado, id_tipoconcepto) VALUES (4, 'COMPRA DE PRODUCTOS', 1, 2);
INSERT INTO concepto (id_concepto, descripcion, estado, id_tipoconcepto) VALUES (5, 'PAGO PROVEEDORES', 1, 2);
INSERT INTO concepto (id_concepto, descripcion, estado, id_tipoconcepto) VALUES (6, 'GASTOS OPERATIVOS', 1, 2);
INSERT INTO concepto (id_concepto, descripcion, estado, id_tipoconcepto) VALUES (7, 'PAGO EMPLEADOS', 1, 2);


--
-- TOC entry 2584 (class 0 OID 874020)
-- Dependencies: 191
-- Data for Name: cronogcobro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cronogcobro (id_cronogcobro, id_venta, fecha, monto_cuota, nrocuota, monto_cobrado) VALUES (39, 30, '2013-11-21', 30.00, 1, 30.00);
INSERT INTO cronogcobro (id_cronogcobro, id_venta, fecha, monto_cuota, nrocuota, monto_cobrado) VALUES (40, 31, '2013-11-21', 15.00, 1, 15.00);
INSERT INTO cronogcobro (id_cronogcobro, id_venta, fecha, monto_cuota, nrocuota, monto_cobrado) VALUES (41, 32, '2013-11-21', 6.00, 1, 6.00);


--
-- TOC entry 2585 (class 0 OID 874025)
-- Dependencies: 193
-- Data for Name: cronogpago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (73, 32, '2013-11-26', 477.00, 1, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (74, 32, '2013-12-01', 477.00, 2, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (75, 32, '2013-12-06', 477.00, 3, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (76, 32, '2013-12-11', 477.00, 4, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (77, 32, '2013-12-16', 477.00, 5, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (78, 32, '2013-12-21', 477.00, 6, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (79, 32, '2013-12-26', 477.00, 7, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (80, 32, '2013-12-31', 481.00, 8, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (83, 33, '2013-11-29', 53.46, 3, 0.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (81, 33, '2013-11-25', 53.00, 1, 53.00);
INSERT INTO cronogpago (id_cronogpago, id_compra, fecha, monto_cuota, nrocuota, monto_pagado) VALUES (82, 33, '2013-11-27', 53.00, 2, 17.00);


--
-- TOC entry 2586 (class 0 OID 874030)
-- Dependencies: 195
-- Data for Name: detamortizacioncobro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2587 (class 0 OID 874033)
-- Dependencies: 196
-- Data for Name: detamortizacionpago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2588 (class 0 OID 874036)
-- Dependencies: 197
-- Data for Name: detcompraproducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detcompraproducto (id_compra, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (32, 35, 10, 108.00, 8, 90, 12.000000);
INSERT INTO detcompraproducto (id_compra, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (32, 36, 10, 10.00, 4, 150, 0.666667);
INSERT INTO detcompraproducto (id_compra, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (32, 34, 10, 144.00, 6, 120, 12.000000);
INSERT INTO detcompraproducto (id_compra, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (32, 37, 100, 12.00, 1, 100, 12.000000);
INSERT INTO detcompraproducto (id_compra, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (33, 36, 200, 0.67, 1, 200, 0.666667);


--
-- TOC entry 2589 (class 0 OID 874039)
-- Dependencies: 198
-- Data for Name: detprodalm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (2, 35, 0.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (2, 37, 0.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (1, 37, 100.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (1, 35, 70.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (2, 36, 50.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (1, 34, 100.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (2, 34, 20.000);
INSERT INTO detprodalm (id_almacen, id_producto, stock) VALUES (1, 36, 300.000);


--
-- TOC entry 2590 (class 0 OID 874042)
-- Dependencies: 199
-- Data for Name: detproductounidmedida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (6, 34, 25.00, 45.00);
INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (8, 35, 15.00, 25.00);
INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (1, 36, 12.00, 25.00);
INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (4, 36, 160.00, 350.00);
INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (1, 34, 16.00, 55.00);
INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (1, 37, 0.00, 0.00);
INSERT INTO detproductounidmedida (id_unidadmedida, id_producto, preciovcont, preciovcre) VALUES (1, 35, 0.00, 0.00);


--
-- TOC entry 2591 (class 0 OID 874045)
-- Dependencies: 200
-- Data for Name: detventa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detventa (id_venta, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (30, 35, 10, 3.00, 1, 10, 3.00);
INSERT INTO detventa (id_venta, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (31, 35, 5, 3.00, 1, 5, 3.00);
INSERT INTO detventa (id_venta, id_producto, cantidadum, preciounitario, id_unidadmedida, cantidadub, precioub) VALUES (32, 35, 2, 3.00, 1, 2, 3.00);


--
-- TOC entry 2592 (class 0 OID 874048)
-- Dependencies: 201
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO empleado (id_empleado, nombre, apellido, direccion, dni, fechanacimiento, estado, usuario, clave, id_perfil, telefono, id_sucursal) VALUES (4, 'WASHO', 'ZUMBA', 'JR. YUNGAY', '47170786', '1991-06-12', 1, 'ZUMBA', '12345', 4, '942456789', 1);
INSERT INTO empleado (id_empleado, nombre, apellido, direccion, dni, fechanacimiento, estado, usuario, clave, id_perfil, telefono, id_sucursal) VALUES (6, 'CRISTIAN', 'TAPULLINA', 'JR PROGRESA', '45879087', '1950-01-03', 1, 'CRISTIAN', '123456', 5, '987123456', 1);
INSERT INTO empleado (id_empleado, nombre, apellido, direccion, dni, fechanacimiento, estado, usuario, clave, id_perfil, telefono, id_sucursal) VALUES (7, 'RONALD', 'RAMOS PESCADOR', 'JR MARISCOS', '45463783', '1950-01-11', 1, 'PESCADO', '123', 5, '94586321458', 1);
INSERT INTO empleado (id_empleado, nombre, apellido, direccion, dni, fechanacimiento, estado, usuario, clave, id_perfil, telefono, id_sucursal) VALUES (8, 'JIM', 'DROGO', 'JR MOREY', '43435454', '1950-01-02', 1, 'JIMY', '123456', 4, '+645648649848', 2);
INSERT INTO empleado (id_empleado, nombre, apellido, direccion, dni, fechanacimiento, estado, usuario, clave, id_perfil, telefono, id_sucursal) VALUES (2, 'ADMIN', 'NUEVO', 'TACNA', '12345678', '2013-06-19', 1, 'ADMIN', '1', 1, '942893090', 1);


--
-- TOC entry 2593 (class 0 OID 874053)
-- Dependencies: 203
-- Data for Name: formapago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO formapago (id_formapago, descripcion, estado) VALUES (1, 'Efectivo', 1);
INSERT INTO formapago (id_formapago, descripcion, estado) VALUES (2, 'Tarjeta', 1);


--
-- TOC entry 2567 (class 0 OID 873889)
-- Dependencies: 169
-- Data for Name: informacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO informacion (id, mision, vision, conocenos) VALUES (1, 'SOMOS UNA EMPRESA DEDICADA A LA COMERCIALIZACIÃ“N DE PRODUCTOS ALIMENTICIOS, DE CONSUMO MASIVO ESTAMOS SIEMPRE A LA BÃŠSQUEDA DEL CONTENTAMIENTO DE NUESTROS CLIENTES, YA QUE SE MERECE TODA NUESTRA ATENCIÃ“N, HACIENDO SIEMPRE EL MÃXIMO ESFUERZO POR MANTENER UNA CONSTANCIA QUE NOS HA HECHO POSIBLE LLEGAR HASTA DONDE ESTAMOS, LO QUE NOS MOTIVA SEGUIR CON LOS OBJETIVOS TRAZADOS, QUE SON LA SENSIBILIDAD Y LA COMPRENSIÃ“N DE LAS NECESIDADES PARA CON LA COMUNIDAD, VALORES ÃŠNICOS QUE NO DEBEN DE PERDERSE JAMÃS.
', 'EN EL 2015, SER UNA EMPRESA RECONOCIDA A NIVEL REGIONAL Y NACIONAL POR LOS SERVICIOS DE CALIDAD QUE SE BRINDA, BUSCANDO MANTENER LA CONFIANZA DE LOS CLIENTES, OFRECIENDO NUESTROS PRODUCTOS DE PRIMERA CALIDAD Y A UN PRECIO JUSTO.', 'LA EMPRESA DESARROLLA LAS ACTIVIDADES COMERCIALES DE MAYORISTA Y MINORISTA DE ARTÃCULOS DE LIMPIEZA, EN UN AMBIENTE GEOGRÃFICO DE ALCANCE NACIONAL. DE ACUERDO A SU VOLUMEN DE OPERACIONES, SE LA PUEDE CONSIDERAR DE TAMAÃ‘O MEDIANO.
CON RESPECTO A SU CLASIFICACIÃ“N, ES UNA SOCIEDAD DE RESPONSABILIDAD LIMITADA CON FINES DE LUCRO.
SU ESTRUCTURA ESTÃ FORMALIZADA Y POSEE CARACTERÃSTICAS DE UNA ORGANIZACIÃ“N FUNCIONAL.
');


--
-- TOC entry 2594 (class 0 OID 874060)
-- Dependencies: 206
-- Data for Name: kardex_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (33, 35, 3, '2013-11-21', 1, 70.000, 6);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (26, 35, 90, '2013-11-21', 1, 90.000, 4);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (27, 36, 150, '2013-11-21', 1, 150.000, 4);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (28, 34, 120, '2013-11-21', 1, 120.000, 4);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (29, 37, 100, '2013-11-21', 1, 100.000, 4);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (30, 35, 10, '2013-11-21', 1, 80.000, 3);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (31, 35, 5, '2013-11-21', 1, 75.000, 3);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (32, 35, 2, '2013-11-21', 1, 73.000, 3);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (34, 36, 50, '2013-11-21', 1, 100.000, 2);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (35, 36, 50, '2013-11-21', 2, 50.000, 1);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (36, 34, 20, '2013-11-21', 1, 100.000, 2);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (37, 34, 20, '2013-11-21', 2, 20.000, 1);
INSERT INTO kardex_producto (id_kardex, id_producto, cantidad, fecha, id_almacen, saldo, id_motivomovimiento) VALUES (38, 36, 200, '2013-11-23', 1, 300.000, 4);


--
-- TOC entry 2571 (class 0 OID 873931)
-- Dependencies: 173
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO marca (id_marca, descripcion, estado) VALUES (48, 'STIHL', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (49, 'GAYSA TITANIUM', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (50, 'BENZA', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (51, 'TRAGUZA', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (52, 'BAYER', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (53, 'VINCARE', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (54, 'SUMILAN', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (55, 'MONCUT', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (56, 'ERASMUS', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (57, 'DARCOS', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (58, 'HERBANOL', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (59, 'LOGRADO', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (60, 'TORNADO', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (61, 'ECLIPSE', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (62, 'ROMECTIN', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (63, 'IVENOL', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (64, 'DIPEL', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (65, 'BACTUR', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (66, 'ZELSIUS', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (67, 'WELGRO', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (68, 'PROUSAL', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (69, 'GREENSTIM', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (70, 'FERRUM', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (71, 'GROWEL', 1);
INSERT INTO marca (id_marca, descripcion, estado) VALUES (0, '', 1);


--
-- TOC entry 2605 (class 0 OID 876094)
-- Dependencies: 232
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2568 (class 0 OID 873898)
-- Dependencies: 170
-- Data for Name: modulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (31, 'Tipo comprobante', 'tipocomprobante', 0, 1, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (0, 'MODULO PADRE', '#', 0, 0, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (13, 'MODULOS', 'MODULOS', 1, 8, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (3, 'MARCA', 'MARCA', 1, 1, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (10, 'PERMISOS', 'PERMISOS', 1, 8, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (11, 'PERFIL', 'PERFILES', 1, 8, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (12, 'CONFIGURAR BD', 'CONFIGURARBD', 1, 8, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (16, 'CLIENTE', 'CLIENTE', 1, 5, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (2, 'ALMACEN', 'ALMACENES', 1, 7, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (22, 'PRODUCTO', 'PRODUCTO', 1, 7, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (28, 'EMPLEADO', 'EMPLEADO', 1, 1, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (18, 'PROVEEDOR', 'PROVEEDOR', 1, 4, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (23, 'UNIDAD MEDIDA', 'UNIDADMEDIDA', 1, 7, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (25, 'MOVIMIENTO', 'MOVIMIENTO', 1, 6, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (15, 'CONCEPTO', 'CONCEPTO', 1, 6, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (30, 'SERIE COMPROBANTE', 'SERIECOMPROBANTE', 1, 1, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (32, 'REPORTE GRAFICO', 'REPORTEGRAFICO', 1, 9, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (36, 'VENTA', 'VENTA', 1, 5, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (37, 'COMPRAS', 'COMPRA', 1, 4, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (38, 'REPORTES', 'REPORTES', 1, 9, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (20, 'CRONOGRAMA PAGO', 'CRONOGPAGO', 1, 6, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (21, 'CRONOGRAMA COBROS', 'CRONOGCOBRO', 1, 6, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (24, 'ADMINISTRACION DE CAJA', 'CAJA', 1, 6, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (34, 'INFORMACION GENERAL', 'INFORMACION', 1, 33, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (39, 'PARAMETROS', 'PARAM', 1, 8, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (40, 'SUCURSAL', 'SUCURSAL', 1, 1, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (41, 'CATEGORIA', 'CATEGORIA', 1, 7, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (42, 'SUBCATEGORIA', 'SUBCATEGORIA', 1, 7, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (14, 'TIPO PRODUCTO', 'TIPOPRODUCTO', 0, 1, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (43, 'MOVIMIENTO DE PRODUCTO', 'MOVIMIENTOPRODUCTO', 1, 7, NULL);
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (4, 'COMPRAS', '#', 1, 0, 'ICON-BRIEFCASE');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (5, 'VENTA', '#', 1, 0, 'ICON-SHOPPING-CART');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (6, 'CAJA', '#', 1, 0, 'ICON-BARCODE');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (1, 'ARCHIVOS', '#', 1, 0, 'ICON-HDD');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (7, 'ALMACEN', '#', 1, 0, 'ICON-INBOX');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (8, 'SEGURIDAD', '#', 1, 0, 'ICON-LOCK');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (9, 'REPORTES', '#', 1, 0, 'ICON-PICTURE');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (33, 'INFORMATIVO', '#', 1, 0, 'ICON-BOOKMARK');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (35, 'CATALOGO', 'PRODUCTOS', 1, 33, '');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (44, 'MARCAS RECONOCIDAS', 'MARCASWEB', 1, 33, '');
INSERT INTO modulos (idmodulo, descripcion, url, estado, idmodulo_padre, icono) VALUES (45, 'MOTIVO MOVIMIENTO', 'MOTIVOMOVIMIENTO', 1, 7, '');


--
-- TOC entry 2607 (class 0 OID 876147)
-- Dependencies: 235
-- Data for Name: motivomovimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO motivomovimiento (id_motivomovimiento, descripcion, estado, id_tipomovimiento) VALUES (1, 'TRASLADO INTERNO', 1, 1);
INSERT INTO motivomovimiento (id_motivomovimiento, descripcion, estado, id_tipomovimiento) VALUES (2, 'TRASLADO INTERNO', 1, 0);
INSERT INTO motivomovimiento (id_motivomovimiento, descripcion, estado, id_tipomovimiento) VALUES (5, 'DEVOLUCION AL PROVEEDOR', 1, 0);
INSERT INTO motivomovimiento (id_motivomovimiento, descripcion, estado, id_tipomovimiento) VALUES (6, 'BAJA POR VENCIMIENTO', 1, 0);
INSERT INTO motivomovimiento (id_motivomovimiento, descripcion, estado, id_tipomovimiento) VALUES (4, 'COMPRA DE PRODUCTOS', 0, 1);
INSERT INTO motivomovimiento (id_motivomovimiento, descripcion, estado, id_tipomovimiento) VALUES (3, 'VENTA DE PRODUCTO', 0, 0);


--
-- TOC entry 2595 (class 0 OID 874067)
-- Dependencies: 209
-- Data for Name: movimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO movimiento (id_movimiento, id_caja, id_concepto, id_formapago, monto, estado, fecha) VALUES (35, 21, 1, 1, 30.00, 1, NULL);
INSERT INTO movimiento (id_movimiento, id_caja, id_concepto, id_formapago, monto, estado, fecha) VALUES (36, 21, 1, 1, 15.00, 1, NULL);
INSERT INTO movimiento (id_movimiento, id_caja, id_concepto, id_formapago, monto, estado, fecha) VALUES (37, 21, 1, 1, 6.00, 1, NULL);
INSERT INTO movimiento (id_movimiento, id_caja, id_concepto, id_formapago, monto, estado, fecha) VALUES (38, 22, 7, 1, 100.00, 1, '2013-11-23 20:44:42');
INSERT INTO movimiento (id_movimiento, id_caja, id_concepto, id_formapago, monto, estado, fecha) VALUES (39, 22, 5, 1, 30.00, 1, '2013-11-23 20:49:23');
INSERT INTO movimiento (id_movimiento, id_caja, id_concepto, id_formapago, monto, estado, fecha) VALUES (40, 22, 5, 1, 40.00, 1, '2013-11-23 20:54:08');


--
-- TOC entry 2596 (class 0 OID 874072)
-- Dependencies: 211
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (0, '', '', 0);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (1, 'BOUVET ISLAND', '9001', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (2, 'COTE D IVOIRE', '9002', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (3, 'FALKLAND ISLANDS (MALVINAS)', '9003', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (4, 'FRANCE, METROPOLITAN', '9004', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (5, 'FRENCH SOUTHERN TERRITORIES', '9005', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (6, 'HEARD AND MC DONALD ISLANDS', '9006', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (7, 'MAYOTTE', '9007', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (8, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', '9008', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (9, 'SVALBARD AND JAN MAYEN ISLANDS', '9009', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (10, 'UNITED STATES MINOR OUTLYING ISLANDS', '9010', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (11, 'OTROS PAISES O LUGARES', '9011', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (12, 'AFGANISTAN', '9013', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (13, 'ALBANIA', '9017', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (14, 'ALDERNEY', '9019', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (15, 'ALEMANIA', '9023', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (16, 'ARMENIA', '9026', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (17, 'ARUBA', '9027', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (18, 'ASCENCION', '9028', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (19, 'BOSNIA-HERZEGOVINA', '9029', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (20, 'BURKINA FASO', '9031', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (21, 'ANDORRA', '9037', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (22, 'ANGOLA', '9040', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (23, 'ANGUILLA', '9041', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (24, 'ANTIGUA Y BARBUDA', '9043', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (25, 'ANTILLAS HOLANDESAS', '9047', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (26, 'ARABIA SAUDITA', '9053', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (27, 'ARGELIA', '9059', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (28, 'ARGENTINA', '9063', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (29, 'AUSTRALIA', '9069', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (30, 'AUSTRIA', '9072', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (31, 'AZERBAIJAN', '9074', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (32, 'BAHAMAS', '9077', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (33, 'BAHREIN', '9080', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (34, 'BANGLADESH', '9081', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (35, 'BARBADOS', '9083', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (36, 'BELGICA', '9087', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (37, 'BELICE', '9088', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (38, 'BERMUDAS', '9090', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (39, 'BELARUS', '9091', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (40, 'MYANMAR', '9093', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (41, 'BOLIVIA', '9097', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (42, 'BOTSWANA', '9101', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (43, 'BRASIL', '9105', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (44, 'BRUNEI DARUSSALAM', '9108', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (45, 'BULGARIA', '9111', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (46, 'BURUNDI', '9115', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (47, 'BUTAN', '9119', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (48, 'CABO VERDE', '9127', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (49, 'CAIMAN,ISLAS', '9137', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (50, 'CAMBOYA', '9141', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (51, 'CAMERUN,REPUBLICA UNIDA DEL', '9145', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (52, 'CAMPIONE D TALIA', '9147', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (53, 'CANADA', '9149', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (54, 'CANAL (NORMANDAS), ISLAS', '9155', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (55, 'CANTON Y ENDERBURRY', '9157', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (56, 'SANTA SEDE', '9159', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (57, 'COCOS (KEELING),ISLAS', '9165', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (58, 'COLOMBIA', '9169', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (59, 'COMORAS', '9173', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (60, 'CONGO', '9177', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (61, 'COOK, ISLAS', '9183', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (62, 'COREA (NORTE), REPUBLICA POPULAR DEMOCRATICA DE', '9187', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (63, 'COREA (SUR), REPUBLICA DE', '9190', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (64, 'COSTA DE MARFIL', '9193', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (65, 'COSTA RICA', '9196', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (66, 'CROACIA', '9198', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (67, 'CUBA', '9199', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (68, 'CHAD', '9203', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (69, 'CHECOSLOVAQUIA', '9207', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (70, 'CHILE', '9211', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (71, 'CHINA', '9215', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (72, 'TAIWAN (FORMOSA)', '9218', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (73, 'CHIPRE', '9221', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (74, 'BENIN', '9229', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (75, 'DINAMARCA', '9232', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (76, 'DOMINICA', '9235', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (77, 'ECUADOR', '9239', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (78, 'EGIPTO', '9240', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (79, 'EL SALVADOR', '9242', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (80, 'ERITREA', '9243', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (81, 'EMIRATOS ARABES UNIDOS', '9244', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (82, 'ESPANA', '9245', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (83, 'ESLOVAQUIA', '9246', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (84, 'ESLOVENIA', '9247', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (85, 'ESTADOS UNIDOS', '9249', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (86, 'ESTONIA', '9251', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (87, 'ETIOPIA', '9253', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (88, 'FEROE, ISLAS', '9259', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (89, 'FILIPINAS', '9267', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (90, 'FINLANDIA', '9271', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (91, 'FRANCIA', '9275', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (92, 'GABON', '9281', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (93, 'GAMBIA', '9285', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (94, 'GAZA Y JERICO', '9286', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (95, 'GEORGIA', '9287', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (96, 'GHANA', '9289', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (97, 'GIBRALTAR', '9293', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (98, 'GRANADA', '9297', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (99, 'GRECIA', '9301', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (100, 'GROENLANDIA', '9305', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (101, 'GUADALUPE', '9309', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (102, 'GUAM', '9313', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (103, 'GUATEMALA', '9317', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (104, 'GUAYANA FRANCESA', '9325', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (105, 'GUERNSEY', '9327', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (106, 'GUINEA', '9329', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (107, 'GUINEA ECUATORIAL', '9331', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (108, 'GUINEA-BISSAU', '9334', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (109, 'GUYANA', '9337', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (110, 'HAITI', '9341', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (111, 'HONDURAS', '9345', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (112, 'HONDURAS BRITANICAS', '9348', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (113, 'HONG KONG', '9351', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (114, 'HUNGRIA', '9355', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (115, 'INDIA', '9361', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (116, 'INDONESIA', '9365', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (117, 'IRAK', '9369', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (118, 'IRAN, REPUBLICA ISLAMICA DEL', '9372', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (119, 'IRLANDA (EIRE)', '9375', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (120, 'ISLA AZORES', '9377', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (121, 'ISLA DEL MAN', '9378', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (122, 'ISLANDIA', '9379', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (123, 'ISLAS CANARIAS', '9380', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (124, 'ISLAS DE CHRISTMAS', '9381', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (125, 'ISLAS QESHM', '9382', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (126, 'ISRAEL', '9383', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (127, 'ITALIA', '9386', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (128, 'JAMAICA', '9391', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (129, 'JONSTON, ISLAS', '9395', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (130, 'JAPON', '9399', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (131, 'JERSEY', '9401', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (132, 'JORDANIA', '9403', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (133, 'KAZAJSTAN', '9406', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (134, 'KENIA', '9410', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (135, 'KIRIBATI', '9411', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (136, 'KIRGUIZISTAN', '9412', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (137, 'KUWAIT', '9413', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (138, 'LABUN', '9418', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (139, 'LAOS, REPUBLICA POPULAR DEMOCRATICA DE', '9420', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (140, 'LESOTHO', '9426', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (141, 'LETONIA', '9429', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (142, 'LIBANO', '9431', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (143, 'LIBERIA', '9434', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (144, 'LIBIA', '9438', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (145, 'LIECHTENSTEIN', '9440', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (146, 'LITUANIA', '9443', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (147, 'LUXEMBURGO', '9445', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (148, 'MACAO', '9447', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (149, 'MACEDONIA', '9448', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (150, 'MADAGASCAR', '9450', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (151, 'MADEIRA', '9453', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (152, 'MALAYSIA', '9455', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (153, 'MALAWI', '9458', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (154, 'MALDIVAS', '9461', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (155, 'MALI', '9464', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (156, 'MALTA', '9467', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (157, 'MARIANAS DEL NORTE, ISLAS', '9469', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (158, 'MARSHALL, ISLAS', '9472', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (159, 'MARRUECOS', '9474', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (160, 'MARTINICA', '9477', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (161, 'MAURICIO', '9485', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (162, 'MAURITANIA', '9488', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (163, 'MEXICO', '9493', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (164, 'MICRONESIA, ESTADOS FEDERADOS DE', '9494', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (165, 'MIDWAY ISLAS', '9495', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (166, 'MOLDAVIA', '9496', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (167, 'MONGOLIA', '9497', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (168, 'MONACO', '9498', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (169, 'MONTSERRAT, ISLA', '9501', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (170, 'MOZAMBIQUE', '9505', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (171, 'NAMIBIA', '9507', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (172, 'NAURU', '9508', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (173, 'NAVIDAD (CHRISTMAS), ISLA', '9511', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (174, 'NEPAL', '9517', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (175, 'NICARAGUA', '9521', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (176, 'NIGER', '9525', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (177, 'NIGERIA', '9528', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (178, 'NIUE, ISLA', '9531', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (179, 'NORFOLK, ISLA', '9535', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (180, 'NORUEGA', '9538', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (181, 'NUEVA CALEDONIA', '9542', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (182, 'PAPUASIA NUEVA GUINEA', '9545', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (183, 'NUEVA ZELANDA', '9548', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (184, 'VANUATU', '9551', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (185, 'OMAN', '9556', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (186, 'PACIFICO, ISLAS DEL', '9566', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (187, 'PAISES BAJOS', '9573', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (188, 'PAKISTAN', '9576', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (189, 'PALAU, ISLAS', '9578', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (190, 'TERRITORIO AUTONOMO DE PALESTINA.', '9579', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (191, 'PANAMA', '9580', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (192, 'PARAGUAY', '9586', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (193, 'PERU', '9589', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (194, 'PITCAIRN, ISLA', '9593', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (195, 'POLINESIA FRANCESA', '9599', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (196, 'POLONIA', '9603', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (197, 'PORTUGAL', '9607', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (198, 'PUERTO RICO', '9611', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (199, 'QATAR', '9618', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (200, 'REINO UNIDO', '9628', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (201, 'ESCOCIA', '9629', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (202, 'REPUBLICA ARABE UNIDA', '9633', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (203, 'REPUBLICA CENTROAFRICANA', '9640', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (204, 'REPUBLICA CHECA', '9644', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (205, 'REPUBLICA DE SWAZILANDIA', '9645', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (206, 'REPUBLICA DE TUNEZ', '9646', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (207, 'REPUBLICA DOMINICANA', '9647', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (208, 'REUNION', '9660', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (209, 'ZIMBABWE', '9665', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (210, 'RUMANIA', '9670', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (211, 'RUANDA', '9675', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (212, 'RUSIA', '9676', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (213, 'SALOMON, ISLAS', '9677', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (214, 'SAHARA OCCIDENTAL', '9685', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (215, 'SAMOA OCCIDENTAL', '9687', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (216, 'SAMOA NORTEAMERICANA', '9690', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (217, 'SAN CRISTOBAL Y NIEVES', '9695', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (218, 'SAN MARINO', '9697', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (219, 'SAN PEDRO Y MIQUELON', '9700', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (220, 'SAN VICENTE Y LAS GRANADINAS', '9705', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (221, 'SANTA ELENA', '9710', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (222, 'SANTA LUCIA', '9715', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (223, 'SANTO TOME Y PRINCIPE', '9720', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (224, 'SENEGAL', '9728', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (225, 'SEYCHELLES', '9731', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (226, 'SIERRA LEONA', '9735', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (227, 'SINGAPUR', '9741', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (228, 'SIRIA, REPUBLICA ARABE DE', '9744', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (229, 'SOMALIA', '9748', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (230, 'SRI LANKA', '9750', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (231, 'SUDAFRICA, REPUBLICA DE', '9756', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (232, 'SUDAN', '9759', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (233, 'SUECIA', '9764', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (234, 'SUIZA', '9767', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (235, 'SURINAM', '9770', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (236, 'SAWSILANDIA', '9773', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (237, 'TADJIKISTAN', '9774', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (238, 'TAILANDIA', '9776', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (239, 'TANZANIA, REPUBLICA UNIDA DE', '9780', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (240, 'DJIBOUTI', '9783', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (241, 'TERRITORIO ANTARTICO BRITANICO', '9786', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (242, 'TERRITORIO BRITANICO DEL OCEANO INDICO', '9787', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (243, 'TIMOR DEL ESTE', '9788', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (244, 'TOGO', '9800', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (245, 'TOKELAU', '9805', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (246, 'TONGA', '9810', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (247, 'TRINIDAD Y TOBAGO', '9815', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (248, 'TRISTAN DA CUNHA', '9816', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (249, 'TUNICIA', '9820', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (250, 'TURCAS Y CAICOS, ISLAS', '9823', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (251, 'TURKMENISTAN', '9825', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (252, 'TURQUIA', '9827', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (253, 'TUVALU', '9828', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (254, 'UCRANIA', '9830', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (255, 'UGANDA', '9833', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (256, 'URSS', '9840', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (257, 'URUGUAY', '9845', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (258, 'UZBEKISTAN', '9847', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (259, 'VENEZUELA', '9850', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (260, 'VIET NAM', '9855', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (261, 'VIETNAM (DEL NORTE)', '9858', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (262, 'VIRGENES, ISLAS (BRITANICAS)', '9863', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (263, 'VIRGENES, ISLAS (NORTEAMERICANAS)', '9866', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (264, 'FIJI', '9870', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (265, 'WAKE, ISLA', '9873', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (266, 'WALLIS Y FORTUNA, ISLAS', '9875', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (267, 'YEMEN', '9880', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (268, 'YUGOSLAVIA', '9885', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (269, 'ZAIRE', '9888', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (270, 'ZAMBIA', '9890', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (271, 'ZONA DEL CANAL DE PANAMA', '9895', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (272, 'ZONA LIBRE OSTRAVA', '9896', 1);
INSERT INTO paises (idpais, descripcion, codigo, idcontinente) VALUES (273, 'ZONA NEUTRAL (PALESTINA)', '9897', 1);


--
-- TOC entry 2572 (class 0 OID 873936)
-- Dependencies: 174
-- Data for Name: param; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO param (id_param, valor, descripcion, estado) VALUES ('CODIGO', 'VALORS', 'DESCRIPCIONS', 0);
INSERT INTO param (id_param, valor, descripcion, estado) VALUES ('IGV', '0.19', 'CONTROL DEL IGV', 1);


--
-- TOC entry 2569 (class 0 OID 873904)
-- Dependencies: 171
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfil (id_perfil, descripcion, estado) VALUES (2, 'Cajero', 0);
INSERT INTO perfil (id_perfil, descripcion, estado) VALUES (3, 'Cajero', 0);
INSERT INTO perfil (id_perfil, descripcion, estado) VALUES (5, 'VENDEDOR', 1);
INSERT INTO perfil (id_perfil, descripcion, estado) VALUES (1, 'ADMINISTRADOR', 1);
INSERT INTO perfil (id_perfil, descripcion, estado) VALUES (4, 'CAJERO', 1);
INSERT INTO perfil (id_perfil, descripcion, estado) VALUES (6, 'ALMACENERO', 1);


--
-- TOC entry 2597 (class 0 OID 874077)
-- Dependencies: 212
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 10, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 11, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 12, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 13, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 14, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 15, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 34, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 35, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 20, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 25, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 24, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 22, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 21, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 31, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 28, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 37, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (2, 3, 0);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 30, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (4, 24, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (5, 16, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (5, 21, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (5, 36, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (4, 20, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (4, 21, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 39, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 40, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 41, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 42, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 43, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (4, 25, 0);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (4, 15, 0);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 18, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 3, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 16, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 36, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 23, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 2, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 32, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 38, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 44, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (1, 45, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (6, 43, 1);
INSERT INTO permisos (id_perfil, idmodulo, estado) VALUES (6, 22, 1);


--
-- TOC entry 2598 (class 0 OID 874080)
-- Dependencies: 213
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO producto (id_producto, id_marca, id_subcategoria, descripcion, estado, id_unidadmedida, precioc) VALUES (34, 58, 9, 'AMITROL 86% SG', 1, 1, 12.000000);
INSERT INTO producto (id_producto, id_marca, id_subcategoria, descripcion, estado, id_unidadmedida, precioc) VALUES (37, 0, 7, 'AMAX 12%', 1, 1, 12.000000);
INSERT INTO producto (id_producto, id_marca, id_subcategoria, descripcion, estado, id_unidadmedida, precioc) VALUES (36, 62, 4, 'ABAMECTINA 1.8 % EC', 1, 1, 0.666667);
INSERT INTO producto (id_producto, id_marca, id_subcategoria, descripcion, estado, id_unidadmedida, precioc) VALUES (35, 67, 41, 'ACIDOS HUMICOS 15%', 1, 1, 12.000000);


--
-- TOC entry 2566 (class 0 OID 873873)
-- Dependencies: 168
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2573 (class 0 OID 873943)
-- Dependencies: 175
-- Data for Name: profesiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (1, 'ABOGADO', '1');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (2, 'ACTOR, ARTISTA Y DIRECTOR DE ESPECTACULOS', '1');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (3, 'ADMINISTRADOR DE EMPRESAS (PROFESIONAL)', '1');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (4, 'AGRIMENSOR Y TOPOGRAFO', '4');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (5, 'AGRÃ“NOMO', '5');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (6, 'ALBANIL', '6');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (7, 'ANALISTAS DE SISTEMA Y COMPUTACION', '7');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (8, 'ANTROPOLOGO, ARQUEOLOGO Y ETNOLOGO', '8');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (9, 'ARQUITECTO', '9');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (10, 'ARTESANO DE CUERO', '10');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (11, 'ARTESANO TEXTIL', '11');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (12, 'AUTOR LITERARIO, ESCRITOR Y CRITICO', '12');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (13, 'BACTERIOLOGO, FARMACOLOGO', '13');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (14, 'BIOLOGO', '14');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (15, 'CARPINTERO', '15');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (16, 'CONDUCTOR DE VEHICULOS DE MOTOR', '16');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (17, 'CONTADOR', '17');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (18, 'COREOGRAFO Y BAILARINES', '18');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (19, 'COSMETOLOGO, PELUQUERO Y BARBERO', '19');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (20, 'DECORADOR, DIBUJANTE, PUBLICISTA, DISEÃ‘ADOR DE PUBLICIDAD', '10');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (21, 'DEPORTISTA PROFESIONAL Y ATLETA', '11');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (22, 'DIRECTOR DE EMPRESAS', '12');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (23, 'ECONOMISTA', '13');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (24, 'ELECTRICISTA (TECNICO)', '14');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (25, 'ENFERMERO', '15');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (26, 'ENTRENADOR DEPORTIVO', '16');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (27, 'ESCENOGRAFO', '17');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (28, 'ESCULTOR', '18');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (29, 'ESPECIALISTA EN TRATAMIENTO DE BELLEZA', '19');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (30, 'FARMACEUTICO', '20');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (31, 'FOTOGRAFO Y OPERADORES CAMARA, CINE Y TV', '21');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (32, 'GASFITERO', '22');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (33, 'GEOGRAFO', '23');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (34, 'INGENIERO', '24');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (35, 'INTERPRETE, TRADUCTOR, FILOSOFO', '25');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (36, 'JOYERO Y/O PLATERO', '26');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (37, 'LABORATORISTA (TECNICO)', '27');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (38, 'LOCUTOR DE RADIO, TV', '28');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (39, 'MECANICO MOTORES AVIONES Y NAVES MARINAS', '29');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (40, 'MECANICO DE VEHICULOS DE MOTOR', '30');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (41, 'MEDICO Y CIRUJANO', '31');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (42, 'MODELO', '32');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (43, 'MUSICO', '33');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (44, 'NUTRICIONISTA', '44');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (45, 'OBSTETRIZ', '45');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (46, 'ODONTOLOGO', '46');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (47, 'PERIODISTA', '47');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (48, 'PILOTO DE AERONAVES', '48');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (49, 'PINTOR', '49');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (50, 'PROFESOR', '50');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (51, 'PSICOLOGO', '51');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (52, 'RADIO TECNICO', '52');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (53, 'REGIDORES DE MUNICIPALIDADES', '53');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (54, 'RELACIONISTA PUBLICO E INDUSTRIAL', '54');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (55, 'SASTRE', '55');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (56, 'SOCIOLOGO', '56');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (57, 'TAPICERO', '57');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (58, 'TAXIDERMISTA, DISECADOR DE ANIMALES', '58');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (59, 'VETERINARIO', '59');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (60, 'PODOLOGOS', '60');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (61, 'ARCHIVERO', '61');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (62, 'ALBACEA', '62');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (63, 'GESTOR DE NEGOCIO', '63');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (64, 'MANDATARIO', '64');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (65, 'SINDICO', '65');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (66, 'TECNOLOGOS MEDICOS', '66');
INSERT INTO profesiones (idprofesion, descripcion, codigo) VALUES (67, 'PROFESION U OCUPACION NO ESPECIFICADA', '99');


--
-- TOC entry 2574 (class 0 OID 873949)
-- Dependencies: 176
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proveedor (id_proveedor, nombre, direccion, razonsocial, email, ciudad, estado, ruc, telefmovil) VALUES (16, 'RAUL QUEZQUEN', 'JR TACNA', 'AGROSANTA', 'AGROS_12@HOTMAIL.COM', 'LIMA', 1, '10456372890', '978456123');
INSERT INTO proveedor (id_proveedor, nombre, direccion, razonsocial, email, ciudad, estado, ruc, telefmovil) VALUES (17, 'JUNIOR GAMARRA', 'JR TAHUANTINSUYO', 'AGRICLSAC', 'AGRISALC@HOTMAIL.COM', 'TACNA', 1, '20345687976', '965123654');
INSERT INTO proveedor (id_proveedor, nombre, direccion, razonsocial, email, ciudad, estado, ruc, telefmovil) VALUES (30, 'JIMY', 'GJDSIK', 'JIMY HOUSE', 'BGBJKDFBSJKSDKJ', 'LIMA', 1, '12345678987', 'FJKDFJJVV');


--
-- TOC entry 2599 (class 0 OID 874087)
-- Dependencies: 216
-- Data for Name: seriecomprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO seriecomprobante (id_seriecomprobante, serie, correlativo, id_tipocomprobante, maxcorrelativo, estado) VALUES (2, 1, 9, 2, 1000000, 1);
INSERT INTO seriecomprobante (id_seriecomprobante, serie, correlativo, id_tipocomprobante, maxcorrelativo, estado) VALUES (1, 1, 13, 1, 1000000, 1);


--
-- TOC entry 2600 (class 0 OID 874092)
-- Dependencies: 218
-- Data for Name: subcategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (2, 'ASERRIN', 2, 0);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (3, 'TIERRA DE CHACRA', 2, 0);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (1, 'ARENA DE CERROS', 2, 0);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (4, 'ACARICIDAS', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (5, 'ÃCIDOS HUMICOS', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (6, 'ATRAYENTES', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (7, 'BIOESTIMULANTES', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (8, 'FUNGICIDAS', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (9, 'HERBICIDAS', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (10, 'NUTRIENTES FOLIARES', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (11, 'AGRICOLAS', 7, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (12, 'ANABÃ“LICOS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (13, 'ANESTESICOS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (14, 'ANTIBIÃ“TICOS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (15, 'ANTIINFLAMATORIOS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (16, 'ANTIPARASITARIOS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (17, 'HORMONALES Y OTROS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (18, 'SUPLEMENTOS', 12, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (19, 'AROMATICAS', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (20, 'FLORES', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (21, 'FORESTALES', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (22, 'FRUTALES', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (23, 'HORTALIZAS', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (24, 'ASERRIN', 2, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (25, 'TIERRA DE CHACRA', 2, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (26, 'REGULADORES DE CRECIMIENTO', 4, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (27, 'UREA', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (28, 'NITRATO DE AMONIO', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (29, 'NITRATO DE POTASIO', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (30, 'CLORURO DE POTASIO', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (31, 'SULFATO DE POTASIO', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (32, 'SULFATO DE AMONIO', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (33, 'SULFATO DE ZINC', 6, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (34, 'JARDINERIA', 7, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (35, 'DESINFECTANTE', 14, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (36, 'INSECTICIDAS', 14, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (37, 'RODENTICIDAS', 14, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (38, 'VIRUCIDA', 14, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (39, 'GRASS DECORATIVO', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (40, 'PASTOS FORRAJEROS', 13, 1);
INSERT INTO subcategoria (id_subcategoria, descripcion, id_categoria, estado) VALUES (41, 'ABONOS ORGANICOS', 1, 1);


--
-- TOC entry 2576 (class 0 OID 873964)
-- Dependencies: 178
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sucursal (id_sucursal, nombre, direccion, telefono, ciudad, estado) VALUES (1, 'AGROVET TARAPOTO', 'TARAPOTO', '232425', 'TARAPOTO', 1);
INSERT INTO sucursal (id_sucursal, nombre, direccion, telefono, ciudad, estado) VALUES (2, 'AGROVET YURIMAGUAS', 'YURIMAGUAS', '23423', 'YURIMAGUAS', 1);


--
-- TOC entry 2601 (class 0 OID 874099)
-- Dependencies: 221
-- Data for Name: tipocliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipocliente (id_tipocliente, descripcion, estado) VALUES (1, 'NATURAL', 1);
INSERT INTO tipocliente (id_tipocliente, descripcion, estado) VALUES (2, 'JURIDICO', 1);


--
-- TOC entry 2602 (class 0 OID 874104)
-- Dependencies: 223
-- Data for Name: tipocomprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipocomprobante (id_tipocomprobante, descripcion, estado) VALUES (1, 'TICKET SIMPLE', 1);
INSERT INTO tipocomprobante (id_tipocomprobante, descripcion, estado) VALUES (2, 'TICKET FACTURA', 1);


--
-- TOC entry 2577 (class 0 OID 873971)
-- Dependencies: 179
-- Data for Name: tipoconcepto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipoconcepto (id_tipoconcepto, descripcion, estado) VALUES (1, 'INGRESO', 1);
INSERT INTO tipoconcepto (id_tipoconcepto, descripcion, estado) VALUES (2, 'EGRESO', 1);


--
-- TOC entry 2606 (class 0 OID 876140)
-- Dependencies: 233
-- Data for Name: tipomovimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipomovimiento (id_tipomovimiento, descripcion) VALUES (0, 'SALIDA');
INSERT INTO tipomovimiento (id_tipomovimiento, descripcion) VALUES (1, 'INGRESO');


--
-- TOC entry 2603 (class 0 OID 874111)
-- Dependencies: 226
-- Data for Name: tipopago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipopago (id_tipopago, descripcion, estado) VALUES (1, 'Contado', 1);
INSERT INTO tipopago (id_tipopago, descripcion, estado) VALUES (2, 'Credito', 1);


--
-- TOC entry 2575 (class 0 OID 873953)
-- Dependencies: 177
-- Data for Name: ubigeos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (0, '', '', '', '', 0);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1, '01', '00', '00', 'AMAZONAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2, '01', '01', '00', 'CHACHAPOYAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (3, '01', '01', '01', 'CHACHAPOYAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (4, '01', '01', '02', 'ASUNCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (5, '01', '01', '03', 'BALSAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (6, '01', '01', '04', 'CHETO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (7, '01', '01', '05', 'CHILIQUIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (8, '01', '01', '06', 'CHUQUIBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (9, '01', '01', '07', 'GRANADA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (10, '01', '01', '08', 'HUANCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (11, '01', '01', '09', 'LA JALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (12, '01', '01', '10', 'LEIMEBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (13, '01', '01', '11', 'LEVANTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (14, '01', '01', '12', 'MAGDALENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (15, '01', '01', '13', 'MARISCAL CASTILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (16, '01', '01', '14', 'MOLINOPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (17, '01', '01', '15', 'MONTEVIDEO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (18, '01', '01', '16', 'OLLEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (19, '01', '01', '17', 'QUINJALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (20, '01', '01', '18', 'SAN FRANCISCO DE DAGUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (21, '01', '01', '19', 'SAN ISIDRO DE MAINO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (22, '01', '01', '20', 'SOLOCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (23, '01', '01', '21', 'SONCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (24, '01', '02', '00', 'BAGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (25, '01', '02', '01', 'BAGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (26, '01', '02', '02', 'ARAMANGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (27, '01', '02', '03', 'COPALLIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (28, '01', '02', '04', 'EL PARCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (29, '01', '02', '05', 'IMAZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (30, '01', '02', '06', 'LA PECA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (31, '01', '03', '00', 'BONGARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (32, '01', '03', '01', 'JUMBILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (33, '01', '03', '02', 'CHISQUILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (34, '01', '03', '03', 'CHURUJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (35, '01', '03', '04', 'COROSHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (36, '01', '03', '05', 'CUISPES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (37, '01', '03', '06', 'FLORIDA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (38, '01', '03', '07', 'JAZAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (39, '01', '03', '08', 'RECTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (40, '01', '03', '09', 'SAN CARLOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (41, '01', '03', '10', 'SHIPASBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (42, '01', '03', '11', 'VALERA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (43, '01', '03', '12', 'YAMBRASBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (44, '01', '04', '00', 'CONDORCANQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (45, '01', '04', '01', 'NIEVA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (46, '01', '04', '02', 'EL CENEPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (47, '01', '04', '03', 'RIO SANTIAGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (48, '01', '05', '00', 'LUYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (49, '01', '05', '01', 'LAMUD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (50, '01', '05', '02', 'CAMPORREDONDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (51, '01', '05', '03', 'COCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (52, '01', '05', '04', 'COLCAMAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (53, '01', '05', '05', 'CONILA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (54, '01', '05', '06', 'INGUILPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (55, '01', '05', '07', 'LONGUITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (56, '01', '05', '08', 'LONYA CHICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (57, '01', '05', '09', 'LUYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (58, '01', '05', '10', 'LUYA VIEJO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (59, '01', '05', '11', 'MARIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (60, '01', '05', '12', 'OCALLI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (61, '01', '05', '13', 'OCUMAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (62, '01', '05', '14', 'PISUQUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (63, '01', '05', '15', 'PROVIDENCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (64, '01', '05', '16', 'SAN CRISTOBAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (65, '01', '05', '17', 'SAN FRANCISCO DEL YESO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (66, '01', '05', '18', 'SAN JERONIMO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (67, '01', '05', '19', 'SAN JUAN DE LOPECANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (68, '01', '05', '20', 'SANTA CATALINA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (69, '01', '05', '21', 'SANTO TOMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (70, '01', '05', '22', 'TINGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (71, '01', '05', '23', 'TRITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (72, '01', '06', '00', 'RODRIGUEZ DE MENDOZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (73, '01', '06', '01', 'SAN NICOLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (74, '01', '06', '02', 'CHIRIMOTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (75, '01', '06', '03', 'COCHAMAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (76, '01', '06', '04', 'HUAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (77, '01', '06', '05', 'LIMABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (78, '01', '06', '06', 'LONGAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (79, '01', '06', '07', 'MARISCAL BENAVIDES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (80, '01', '06', '08', 'MILPUC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (81, '01', '06', '09', 'OMIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (82, '01', '06', '10', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (83, '01', '06', '11', 'TOTORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (84, '01', '06', '12', 'VISTA ALEGRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (85, '01', '07', '00', 'UTCUBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (86, '01', '07', '01', 'BAGUA GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (87, '01', '07', '02', 'CAJARURO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (88, '01', '07', '03', 'CUMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (89, '01', '07', '04', 'EL MILAGRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (90, '01', '07', '05', 'JAMALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (91, '01', '07', '06', 'LONYA GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (92, '01', '07', '07', 'YAMON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (93, '02', '00', '00', 'ANCASH', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (94, '02', '01', '00', 'HUARAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (95, '02', '01', '01', 'HUARAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (96, '02', '01', '02', 'COCHABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (97, '02', '01', '03', 'COLCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (98, '02', '01', '04', 'HUANCHAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (99, '02', '01', '05', 'INDEPENDENCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (100, '02', '01', '06', 'JANGAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (101, '02', '01', '07', 'LA LIBERTAD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (102, '02', '01', '08', 'OLLEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (103, '02', '01', '09', 'PAMPAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (104, '02', '01', '10', 'PARIACOTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (105, '02', '01', '11', 'PIRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (106, '02', '01', '12', 'TARICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (107, '02', '02', '00', 'AIJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (108, '02', '02', '01', 'AIJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (109, '02', '02', '02', 'CORIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (110, '02', '02', '03', 'HUACLLAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (111, '02', '02', '04', 'LA MERCED', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (112, '02', '02', '05', 'SUCCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (113, '02', '03', '00', 'ANTONIO RAYMONDI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (114, '02', '03', '01', 'LLAMELLIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (115, '02', '03', '02', 'ACZO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (116, '02', '03', '03', 'CHACCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (117, '02', '03', '04', 'CHINGAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (118, '02', '03', '05', 'MIRGAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (119, '02', '03', '06', 'SAN JUAN DE RONTOY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (120, '02', '04', '00', 'ASUNCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (121, '02', '04', '01', 'CHACAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (122, '02', '04', '02', 'ACOCHACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (123, '02', '05', '00', 'BOLOGNESI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (124, '02', '05', '01', 'CHIQUIAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (125, '02', '05', '02', 'ABELARDO PARDO LEZAMETA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (126, '02', '05', '03', 'ANTONIO RAYMONDI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (127, '02', '05', '04', 'AQUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (128, '02', '05', '05', 'CAJACAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (129, '02', '05', '06', 'CANIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (130, '02', '05', '07', 'COLQUIOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (131, '02', '05', '08', 'HUALLANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (132, '02', '05', '09', 'HUASTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (133, '02', '05', '10', 'HUAYLLACAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (134, '02', '05', '11', 'LA PRIMAVERA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (135, '02', '05', '12', 'MANGAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (136, '02', '05', '13', 'PACLLON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (137, '02', '05', '14', 'SAN MIGUEL DE CORPANQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (138, '02', '05', '15', 'TICLLOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (139, '02', '06', '00', 'CARHUAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (140, '02', '06', '01', 'CARHUAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (141, '02', '06', '02', 'ACOPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (142, '02', '06', '03', 'AMASHCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (143, '02', '06', '04', 'ANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (144, '02', '06', '05', 'ATAQUERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (145, '02', '06', '06', 'MARCARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (146, '02', '06', '07', 'PARIAHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (147, '02', '06', '08', 'SAN MIGUEL DE ACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (148, '02', '06', '09', 'SHILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (149, '02', '06', '10', 'TINCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (150, '02', '06', '11', 'YUNGAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (151, '02', '07', '00', 'CARLOS FERMIN FITZCARRALD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (152, '02', '07', '01', 'SAN LUIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (153, '02', '07', '02', 'SAN NICOLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (154, '02', '07', '03', 'YAUYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (155, '02', '08', '00', 'CASMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (156, '02', '08', '01', 'CASMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (157, '02', '08', '02', 'BUENA VISTA ALTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (158, '02', '08', '03', 'COMANDANTE NOEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (159, '02', '08', '04', 'YAUTAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (160, '02', '09', '00', 'CORONGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (161, '02', '09', '01', 'CORONGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (162, '02', '09', '02', 'ACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (163, '02', '09', '03', 'BAMBAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (164, '02', '09', '04', 'CUSCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (165, '02', '09', '05', 'LA PAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (166, '02', '09', '06', 'YANAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (167, '02', '09', '07', 'YUPAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (168, '02', '10', '00', 'HUARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (169, '02', '10', '01', 'HUARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (170, '02', '10', '02', 'ANRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (171, '02', '10', '03', 'CAJAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (172, '02', '10', '04', 'CHAVIN DE HUANTAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (173, '02', '10', '05', 'HUACACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (174, '02', '10', '06', 'HUACCHIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (175, '02', '10', '07', 'HUACHIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (176, '02', '10', '08', 'HUANTAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (177, '02', '10', '09', 'MASIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (178, '02', '10', '10', 'PAUCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (179, '02', '10', '11', 'PONTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (180, '02', '10', '12', 'RAHUAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (181, '02', '10', '13', 'RAPAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (182, '02', '10', '14', 'SAN MARCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (183, '02', '10', '15', 'SAN PEDRO DE CHANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (184, '02', '10', '16', 'UCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (185, '02', '11', '00', 'HUARMEY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (186, '02', '11', '01', 'HUARMEY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (187, '02', '11', '02', 'COCHAPETI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (188, '02', '11', '03', 'CULEBRAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (189, '02', '11', '04', 'HUAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (190, '02', '11', '05', 'MALVAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (191, '02', '12', '00', 'HUAYLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (192, '02', '12', '01', 'CARAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (193, '02', '12', '02', 'HUALLANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (194, '02', '12', '03', 'HUATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (195, '02', '12', '04', 'HUAYLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (196, '02', '12', '05', 'MATO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (197, '02', '12', '06', 'PAMPAROMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (198, '02', '12', '07', 'PUEBLO LIBRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (199, '02', '12', '08', 'SANTA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (200, '02', '12', '09', 'SANTO TORIBIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (201, '02', '12', '10', 'YURACMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (202, '02', '13', '00', 'MARISCAL LUZURIAGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (203, '02', '13', '01', 'PISCOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (204, '02', '13', '02', 'CASCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (205, '02', '13', '03', 'ELEAZAR GUZMAN BARRON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (206, '02', '13', '04', 'FIDEL OLIVAS ESCUDERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (207, '02', '13', '05', 'LLAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (208, '02', '13', '06', 'LLUMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (209, '02', '13', '07', 'LUCMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (210, '02', '13', '08', 'MUSGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (211, '02', '14', '00', 'OCROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (212, '02', '14', '01', 'OCROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (213, '02', '14', '02', 'ACAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (214, '02', '14', '03', 'CAJAMARQUILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (215, '02', '14', '04', 'CARHUAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (216, '02', '14', '05', 'COCHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (217, '02', '14', '06', 'CONGAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (218, '02', '14', '07', 'LLIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (219, '02', '14', '08', 'SAN CRISTOBAL DE RAJAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (220, '02', '14', '09', 'SAN PEDRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (221, '02', '14', '10', 'SANTIAGO DE CHILCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (222, '02', '15', '00', 'PALLASCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (223, '02', '15', '01', 'CABANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (224, '02', '15', '02', 'BOLOGNESI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (225, '02', '15', '03', 'CONCHUCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (226, '02', '15', '04', 'HUACASCHUQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (227, '02', '15', '05', 'HUANDOVAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (228, '02', '15', '06', 'LACABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (229, '02', '15', '07', 'LLAPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (230, '02', '15', '08', 'PALLASCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (231, '02', '15', '09', 'PAMPAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (232, '02', '15', '10', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (233, '02', '15', '11', 'TAUCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (234, '02', '16', '00', 'POMABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (235, '02', '16', '01', 'POMABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (236, '02', '16', '02', 'HUAYLLAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (237, '02', '16', '03', 'PAROBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (238, '02', '16', '04', 'QUINUABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (239, '02', '17', '00', 'RECUAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (240, '02', '17', '01', 'RECUAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (241, '02', '17', '02', 'CATAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (242, '02', '17', '03', 'COTAPARACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (243, '02', '17', '04', 'HUAYLLAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (244, '02', '17', '05', 'LLACLLIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (245, '02', '17', '06', 'MARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (246, '02', '17', '07', 'PAMPAS CHICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (247, '02', '17', '08', 'PARARIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (248, '02', '17', '09', 'TAPACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (249, '02', '17', '10', 'TICAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (250, '02', '18', '00', 'SANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (251, '02', '18', '01', 'CHIMBOTE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (252, '02', '18', '02', 'CACERES DEL PERU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (253, '02', '18', '03', 'COISHCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (254, '02', '18', '04', 'MACATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (255, '02', '18', '05', 'MORO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (256, '02', '18', '06', 'NEPEÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (257, '02', '18', '07', 'SAMANCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (258, '02', '18', '08', 'SANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (259, '02', '18', '09', 'NUEVO CHIMBOTE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (260, '02', '19', '00', 'SIHUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (261, '02', '19', '01', 'SIHUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (262, '02', '19', '02', 'ACOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (263, '02', '19', '03', 'ALFONSO UGARTE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (264, '02', '19', '04', 'CASHAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (265, '02', '19', '05', 'CHINGALPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (266, '02', '19', '06', 'HUAYLLABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (267, '02', '19', '07', 'QUICHES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (268, '02', '19', '08', 'RAGASH', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (269, '02', '19', '09', 'SAN JUAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (270, '02', '19', '10', 'SICSIBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (271, '02', '20', '00', 'YUNGAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (272, '02', '20', '01', 'YUNGAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (273, '02', '20', '02', 'CASCAPARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (274, '02', '20', '03', 'MANCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (275, '02', '20', '04', 'MATACOTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (276, '02', '20', '05', 'QUILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (277, '02', '20', '06', 'RANRAHIRCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (278, '02', '20', '07', 'SHUPLUY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (279, '02', '20', '08', 'YANAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (280, '03', '00', '00', 'APURIMAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (281, '03', '01', '00', 'ABANCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (282, '03', '01', '01', 'ABANCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (283, '03', '01', '02', 'CHACOCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (284, '03', '01', '03', 'CIRCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (285, '03', '01', '04', 'CURAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (286, '03', '01', '05', 'HUANIPACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (287, '03', '01', '06', 'LAMBRAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (288, '03', '01', '07', 'PICHIRHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (289, '03', '01', '08', 'SAN PEDRO DE CACHORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (290, '03', '01', '09', 'TAMBURCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (291, '03', '02', '00', 'ANDAHUAYLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (292, '03', '02', '01', 'ANDAHUAYLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (293, '03', '02', '02', 'ANDARAPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (294, '03', '02', '03', 'CHIARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (295, '03', '02', '04', 'HUANCARAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (296, '03', '02', '05', 'HUANCARAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (297, '03', '02', '06', 'HUAYANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (298, '03', '02', '07', 'KISHUARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (299, '03', '02', '08', 'PACOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (300, '03', '02', '09', 'PACUCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (301, '03', '02', '10', 'PAMPACHIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (302, '03', '02', '11', 'POMACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (303, '03', '02', '12', 'SAN ANTONIO DE CACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (304, '03', '02', '13', 'SAN JERONIMO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (305, '03', '02', '14', 'SAN MIGUEL DE CHACCRAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (306, '03', '02', '15', 'SANTA MARIA DE CHICMO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (307, '03', '02', '16', 'TALAVERA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (308, '03', '02', '17', 'TUMAY HUARACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (309, '03', '02', '18', 'TURPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (310, '03', '02', '19', 'KAQUIABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (311, '03', '03', '00', 'ANTABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (312, '03', '03', '01', 'ANTABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (313, '03', '03', '02', 'EL ORO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (314, '03', '03', '03', 'HUAQUIRCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (315, '03', '03', '04', 'JUAN ESPINOZA MEDRANO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (316, '03', '03', '05', 'OROPESA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (317, '03', '03', '06', 'PACHACONAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (318, '03', '03', '07', 'SABAINO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (319, '03', '04', '00', 'AYMARAES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (320, '03', '04', '01', 'CHALHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (321, '03', '04', '02', 'CAPAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (322, '03', '04', '03', 'CARAYBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (323, '03', '04', '04', 'CHAPIMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (324, '03', '04', '05', 'COLCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (325, '03', '04', '06', 'COTARUSE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (326, '03', '04', '07', 'HUAYLLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (327, '03', '04', '08', 'JUSTO APU SAHUARAURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (328, '03', '04', '09', 'LUCRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (329, '03', '04', '10', 'POCOHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (330, '03', '04', '11', 'SAN JUAN DE CHACÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (331, '03', '04', '12', 'SAÃ‘AYCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (332, '03', '04', '13', 'SORAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (333, '03', '04', '14', 'TAPAIRIHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (334, '03', '04', '15', 'TINTAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (335, '03', '04', '16', 'TORAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (336, '03', '04', '17', 'YANACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (337, '03', '05', '00', 'COTABAMBAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (338, '03', '05', '01', 'TAMBOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (339, '03', '05', '02', 'COTABAMBAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (340, '03', '05', '03', 'COYLLURQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (341, '03', '05', '04', 'HAQUIRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (342, '03', '05', '05', 'MARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (343, '03', '05', '06', 'CHALLHUAHUACHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (344, '03', '06', '00', 'CHINCHEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (345, '03', '06', '01', 'CHINCHEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (346, '03', '06', '02', 'ANCO_HUALLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (347, '03', '06', '03', 'COCHARCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (348, '03', '06', '04', 'HUACCANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (349, '03', '06', '05', 'OCOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (350, '03', '06', '06', 'ONGOY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (351, '03', '06', '07', 'URANMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (352, '03', '06', '08', 'RANRACANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (353, '03', '07', '00', 'GRAU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (354, '03', '07', '01', 'CHUQUIBAMBILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (355, '03', '07', '02', 'CURPAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (356, '03', '07', '03', 'GAMARRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (357, '03', '07', '04', 'HUAYLLATI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (358, '03', '07', '05', 'MAMARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (359, '03', '07', '06', 'MICAELA BASTIDAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (360, '03', '07', '07', 'PATAYPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (361, '03', '07', '08', 'PROGRESO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (362, '03', '07', '09', 'SAN ANTONIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (363, '03', '07', '10', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (364, '03', '07', '11', 'TURPAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (365, '03', '07', '12', 'VILCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (366, '03', '07', '13', 'VIRUNDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (367, '03', '07', '14', 'CURASCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (368, '04', '00', '00', 'AREQUIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (369, '04', '01', '00', 'AREQUIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (370, '04', '01', '01', 'AREQUIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (371, '04', '01', '02', 'ALTO SELVA ALEGRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (372, '04', '01', '03', 'CAYMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (373, '04', '01', '04', 'CERRO COLORADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (374, '04', '01', '05', 'CHARACATO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (375, '04', '01', '06', 'CHIGUATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (376, '04', '01', '07', 'JACOBO HUNTER', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (377, '04', '01', '08', 'LA JOYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (378, '04', '01', '09', 'MARIANO MELGAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (379, '04', '01', '10', 'MIRAFLORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (380, '04', '01', '11', 'MOLLEBAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (381, '04', '01', '12', 'PAUCARPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (382, '04', '01', '13', 'POCSI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (383, '04', '01', '14', 'POLOBAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (384, '04', '01', '15', 'QUEQUEÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (385, '04', '01', '16', 'SABANDIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (386, '04', '01', '17', 'SACHACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (387, '04', '01', '18', 'SAN JUAN DE SIGUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (388, '04', '01', '19', 'SAN JUAN DE TARUCANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (389, '04', '01', '20', 'SANTA ISABEL DE SIGUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (390, '04', '01', '21', 'SANTA RITA DE SIGUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (391, '04', '01', '22', 'SOCABAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (392, '04', '01', '23', 'TIABAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (393, '04', '01', '24', 'UCHUMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (394, '04', '01', '25', 'VITOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (395, '04', '01', '26', 'YANAHUARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (396, '04', '01', '27', 'YARABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (397, '04', '01', '28', 'YURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (398, '04', '01', '29', 'JOSE LUIS BUSTAMANTE Y RIVERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (399, '04', '02', '00', 'CAMANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (400, '04', '02', '01', 'CAMANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (401, '04', '02', '02', 'JOSE MARIA QUIMPER', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (402, '04', '02', '03', 'MARIANO NICOLAS VALCARCEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (403, '04', '02', '04', 'MARISCAL CACERES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (404, '04', '02', '05', 'NICOLAS DE PIEROLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (405, '04', '02', '06', 'OCOÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (406, '04', '02', '07', 'QUILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (407, '04', '02', '08', 'SAMUEL PASTOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (408, '04', '03', '00', 'CARAVELI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (409, '04', '03', '01', 'CARAVELI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (410, '04', '03', '02', 'ACARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (411, '04', '03', '03', 'ATICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (412, '04', '03', '04', 'ATIQUIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (413, '04', '03', '05', 'BELLA UNION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (414, '04', '03', '06', 'CAHUACHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (415, '04', '03', '07', 'CHALA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (416, '04', '03', '08', 'CHAPARRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (417, '04', '03', '09', 'HUANUHUANU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (418, '04', '03', '10', 'JAQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (419, '04', '03', '11', 'LOMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (420, '04', '03', '12', 'QUICACHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (421, '04', '03', '13', 'YAUCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (422, '04', '04', '00', 'CASTILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (423, '04', '04', '01', 'APLAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (424, '04', '04', '02', 'ANDAGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (425, '04', '04', '03', 'AYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (426, '04', '04', '04', 'CHACHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (427, '04', '04', '05', 'CHILCAYMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (428, '04', '04', '06', 'CHOCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (429, '04', '04', '07', 'HUANCARQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (430, '04', '04', '08', 'MACHAGUAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (431, '04', '04', '09', 'ORCOPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (432, '04', '04', '10', 'PAMPACOLCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (433, '04', '04', '11', 'TIPAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (434, '04', '04', '12', 'UÃ‘ON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (435, '04', '04', '13', 'URACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (436, '04', '04', '14', 'VIRACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (437, '04', '05', '00', 'CAYLLOMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (438, '04', '05', '01', 'CHIVAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (439, '04', '05', '02', 'ACHOMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (440, '04', '05', '03', 'CABANACONDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (441, '04', '05', '04', 'CALLALLI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (442, '04', '05', '05', 'CAYLLOMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (443, '04', '05', '06', 'COPORAQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (444, '04', '05', '07', 'HUAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (445, '04', '05', '08', 'HUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (446, '04', '05', '09', 'ICHUPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (447, '04', '05', '10', 'LARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (448, '04', '05', '11', 'LLUTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (449, '04', '05', '12', 'MACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (450, '04', '05', '13', 'MADRIGAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (451, '04', '05', '14', 'SAN ANTONIO DE CHUCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (452, '04', '05', '15', 'SIBAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (453, '04', '05', '16', 'TAPAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (454, '04', '05', '17', 'TISCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (455, '04', '05', '18', 'TUTI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (456, '04', '05', '19', 'YANQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (457, '04', '05', '20', 'MAJES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (458, '04', '06', '00', 'CONDESUYOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (459, '04', '06', '01', 'CHUQUIBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (460, '04', '06', '02', 'ANDARAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (461, '04', '06', '03', 'CAYARANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (462, '04', '06', '04', 'CHICHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (463, '04', '06', '05', 'IRAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (464, '04', '06', '06', 'RIO GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (465, '04', '06', '07', 'SALAMANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (466, '04', '06', '08', 'YANAQUIHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (467, '04', '07', '00', 'ISLAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (468, '04', '07', '01', 'MOLLENDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (469, '04', '07', '02', 'COCACHACRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (470, '04', '07', '03', 'DEAN VALDIVIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (471, '04', '07', '04', 'ISLAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (472, '04', '07', '05', 'MEJIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (473, '04', '07', '06', 'PUNTA DE BOMBON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (474, '04', '08', '00', 'LA UNION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (475, '04', '08', '01', 'COTAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (476, '04', '08', '02', 'ALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (477, '04', '08', '03', 'CHARCANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (478, '04', '08', '04', 'HUAYNACOTAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (479, '04', '08', '05', 'PAMPAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (480, '04', '08', '06', 'PUYCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (481, '04', '08', '07', 'QUECHUALLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (482, '04', '08', '08', 'SAYLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (483, '04', '08', '09', 'TAURIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (484, '04', '08', '10', 'TOMEPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (485, '04', '08', '11', 'TORO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (486, '05', '00', '00', 'AYACUCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (487, '05', '01', '00', 'HUAMANGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (488, '05', '01', '01', 'AYACUCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (489, '05', '01', '02', 'ACOCRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (490, '05', '01', '03', 'ACOS VINCHOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (491, '05', '01', '04', 'CARMEN ALTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (492, '05', '01', '05', 'CHIARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (493, '05', '01', '06', 'OCROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (494, '05', '01', '07', 'PACAYCASA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (495, '05', '01', '08', 'QUINUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (496, '05', '01', '09', 'SAN JOSE DE TICLLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (497, '05', '01', '10', 'SAN JUAN BAUTISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (498, '05', '01', '11', 'SANTIAGO DE PISCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (499, '05', '01', '12', 'SOCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (500, '05', '01', '13', 'TAMBILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (501, '05', '01', '14', 'VINCHOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (502, '05', '01', '15', 'JESUS NAZARENO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (503, '05', '02', '00', 'CANGALLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (504, '05', '02', '01', 'CANGALLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (505, '05', '02', '02', 'CHUSCHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (506, '05', '02', '03', 'LOS MOROCHUCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (507, '05', '02', '04', 'MARIA PARADO DE BELLIDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (508, '05', '02', '05', 'PARAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (509, '05', '02', '06', 'TOTOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (510, '05', '03', '00', 'HUANCA SANCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (511, '05', '03', '01', 'SANCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (512, '05', '03', '02', 'CARAPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (513, '05', '03', '03', 'SACSAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (514, '05', '03', '04', 'SANTIAGO DE LUCANAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (515, '05', '04', '00', 'HUANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (516, '05', '04', '01', 'HUANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (517, '05', '04', '02', 'AYAHUANCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (518, '05', '04', '03', 'HUAMANGUILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (519, '05', '04', '04', 'IGUAIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (520, '05', '04', '05', 'LURICOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (521, '05', '04', '06', 'SANTILLANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (522, '05', '04', '07', 'SIVIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (523, '05', '04', '08', 'LLOCHEGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (524, '05', '05', '00', 'LA MAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (525, '05', '05', '01', 'SAN MIGUEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (526, '05', '05', '02', 'ANCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (527, '05', '05', '03', 'AYNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (528, '05', '05', '04', 'CHILCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (529, '05', '05', '05', 'CHUNGUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (530, '05', '05', '06', 'LUIS CARRANZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (531, '05', '05', '07', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (532, '05', '05', '08', 'TAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (533, '05', '05', '09', 'SAMUGARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (534, '05', '06', '00', 'LUCANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (535, '05', '06', '01', 'PUQUIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (536, '05', '06', '02', 'AUCARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (537, '05', '06', '03', 'CABANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (538, '05', '06', '04', 'CARMEN SALCEDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (539, '05', '06', '05', 'CHAVIÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (540, '05', '06', '06', 'CHIPAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (541, '05', '06', '07', 'HUAC-HUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (542, '05', '06', '08', 'LARAMATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (543, '05', '06', '09', 'LEONCIO PRADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (544, '05', '06', '10', 'LLAUTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (545, '05', '06', '11', 'LUCANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (546, '05', '06', '12', 'OCAÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (547, '05', '06', '13', 'OTOCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (548, '05', '06', '14', 'SAISA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (549, '05', '06', '15', 'SAN CRISTOBAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (550, '05', '06', '16', 'SAN JUAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (551, '05', '06', '17', 'SAN PEDRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (552, '05', '06', '18', 'SAN PEDRO DE PALCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (553, '05', '06', '19', 'SANCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (554, '05', '06', '20', 'SANTA ANA DE HUAYCAHUACHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (555, '05', '06', '21', 'SANTA LUCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (556, '05', '07', '00', 'PARINACOCHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (557, '05', '07', '01', 'CORACORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (558, '05', '07', '02', 'CHUMPI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (559, '05', '07', '03', 'CORONEL CASTAÃ‘EDA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (560, '05', '07', '04', 'PACAPAUSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (561, '05', '07', '05', 'PULLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (562, '05', '07', '06', 'PUYUSCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (563, '05', '07', '07', 'SAN FRANCISCO DE RAVACAYCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (564, '05', '07', '08', 'UPAHUACHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (565, '05', '08', '00', 'PAUCAR DEL SARA SARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (566, '05', '08', '01', 'PAUSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (567, '05', '08', '02', 'COLTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (568, '05', '08', '03', 'CORCULLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (569, '05', '08', '04', 'LAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (570, '05', '08', '05', 'MARCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (571, '05', '08', '06', 'OYOLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (572, '05', '08', '07', 'PARARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (573, '05', '08', '08', 'SAN JAVIER DE ALPABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (574, '05', '08', '09', 'SAN JOSE DE USHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (575, '05', '08', '10', 'SARA SARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (576, '05', '09', '00', 'SUCRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (577, '05', '09', '01', 'QUEROBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (578, '05', '09', '02', 'BELEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (579, '05', '09', '03', 'CHALCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (580, '05', '09', '04', 'CHILCAYOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (581, '05', '09', '05', 'HUACAÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (582, '05', '09', '06', 'MORCOLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (583, '05', '09', '07', 'PAICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (584, '05', '09', '08', 'SAN PEDRO DE LARCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (585, '05', '09', '09', 'SAN SALVADOR DE QUIJE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (586, '05', '09', '10', 'SANTIAGO DE PAUCARAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (587, '05', '09', '11', 'SORAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (588, '05', '10', '00', 'VICTOR FAJARDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (589, '05', '10', '01', 'HUANCAPI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (590, '05', '10', '02', 'ALCAMENCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (591, '05', '10', '03', 'APONGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (592, '05', '10', '04', 'ASQUIPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (593, '05', '10', '05', 'CANARIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (594, '05', '10', '06', 'CAYARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (595, '05', '10', '07', 'COLCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (596, '05', '10', '08', 'HUAMANQUIQUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (597, '05', '10', '09', 'HUANCARAYLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (598, '05', '10', '10', 'HUAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (599, '05', '10', '11', 'SARHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (600, '05', '10', '12', 'VILCANCHOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (601, '05', '11', '00', 'VILCAS HUAMAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (602, '05', '11', '01', 'VILCAS HUAMAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (603, '05', '11', '02', 'ACCOMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (604, '05', '11', '03', 'CARHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (605, '05', '11', '04', 'CONCEPCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (606, '05', '11', '05', 'HUAMBALPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (607, '05', '11', '06', 'INDEPENDENCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (608, '05', '11', '07', 'SAURAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (609, '05', '11', '08', 'VISCHONGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (610, '06', '00', '00', 'CAJAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (611, '06', '01', '00', 'CAJAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (612, '06', '01', '01', 'CAJAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (613, '06', '01', '02', 'ASUNCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (614, '06', '01', '03', 'CHETILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (615, '06', '01', '04', 'COSPAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (616, '06', '01', '05', 'ENCAÃ‘ADA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (617, '06', '01', '06', 'JESUS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (618, '06', '01', '07', 'LLACANORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (619, '06', '01', '08', 'LOS BAÃ‘OS DEL INCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (620, '06', '01', '09', 'MAGDALENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (621, '06', '01', '10', 'MATARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (622, '06', '01', '11', 'NAMORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (623, '06', '01', '12', 'SAN JUAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (624, '06', '02', '00', 'CAJABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (625, '06', '02', '01', 'CAJABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (626, '06', '02', '02', 'CACHACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (627, '06', '02', '03', 'CONDEBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (628, '06', '02', '04', 'SITACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (629, '06', '03', '00', 'CELENDIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (630, '06', '03', '01', 'CELENDIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (631, '06', '03', '02', 'CHUMUCH', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (632, '06', '03', '03', 'CORTEGANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (633, '06', '03', '04', 'HUASMIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (634, '06', '03', '05', 'JORGE CHAVEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (635, '06', '03', '06', 'JOSE GALVEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (636, '06', '03', '07', 'MIGUEL IGLESIAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (637, '06', '03', '08', 'OXAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (638, '06', '03', '09', 'SOROCHUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (639, '06', '03', '10', 'SUCRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (640, '06', '03', '11', 'UTCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (641, '06', '03', '12', 'LA LIBERTAD DE PALLAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (642, '06', '04', '00', 'CHOTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (643, '06', '04', '01', 'CHOTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (644, '06', '04', '02', 'ANGUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (645, '06', '04', '03', 'CHADIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (646, '06', '04', '04', 'CHIGUIRIP', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (647, '06', '04', '05', 'CHIMBAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (648, '06', '04', '06', 'CHOROPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (649, '06', '04', '07', 'COCHABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (650, '06', '04', '08', 'CONCHAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (651, '06', '04', '09', 'HUAMBOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (652, '06', '04', '10', 'LAJAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (653, '06', '04', '11', 'LLAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (654, '06', '04', '12', 'MIRACOSTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (655, '06', '04', '13', 'PACCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (656, '06', '04', '14', 'PION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (657, '06', '04', '15', 'QUEROCOTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (658, '06', '04', '16', 'SAN JUAN DE LICUPIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (659, '06', '04', '17', 'TACABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (660, '06', '04', '18', 'TOCMOCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (661, '06', '04', '19', 'CHALAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (662, '06', '05', '00', 'CONTUMAZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (663, '06', '05', '01', 'CONTUMAZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (664, '06', '05', '02', 'CHILETE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (665, '06', '05', '03', 'CUPISNIQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (666, '06', '05', '04', 'GUZMANGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (667, '06', '05', '05', 'SAN BENITO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (668, '06', '05', '06', 'SANTA CRUZ DE TOLED', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (669, '06', '05', '07', 'TANTARICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (670, '06', '05', '08', 'YONAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (671, '06', '06', '00', 'CUTERVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (672, '06', '06', '01', 'CUTERVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (673, '06', '06', '02', 'CALLAYUC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (674, '06', '06', '03', 'CHOROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (675, '06', '06', '04', 'CUJILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (676, '06', '06', '05', 'LA RAMADA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (677, '06', '06', '06', 'PIMPINGOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (678, '06', '06', '07', 'QUEROCOTILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (679, '06', '06', '08', 'SAN ANDRES DE CUTERVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (680, '06', '06', '09', 'SAN JUAN DE CUTERVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (681, '06', '06', '10', 'SAN LUIS DE LUCMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (682, '06', '06', '11', 'SANTA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (683, '06', '06', '12', 'SANTO DOMINGO DE LA CAPILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (684, '06', '06', '13', 'SANTO TOMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (685, '06', '06', '14', 'SOCOTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (686, '06', '06', '15', 'TORIBIO CASANOVA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (687, '06', '07', '00', 'HUALGAYOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (688, '06', '07', '01', 'BAMBAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (689, '06', '07', '02', 'CHUGUR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (690, '06', '07', '03', 'HUALGAYOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (691, '06', '08', '00', 'JAEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (692, '06', '08', '01', 'JAEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (693, '06', '08', '02', 'BELLAVISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (694, '06', '08', '03', 'CHONTALI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (695, '06', '08', '04', 'COLASAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (696, '06', '08', '05', 'HUABAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (697, '06', '08', '06', 'LAS PIRIAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (698, '06', '08', '07', 'POMAHUACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (699, '06', '08', '08', 'PUCARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (700, '06', '08', '09', 'SALLIQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (701, '06', '08', '10', 'SAN FELIPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (702, '06', '08', '11', 'SAN JOSE DEL ALTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (703, '06', '08', '12', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (704, '06', '09', '00', 'SAN IGNACIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (705, '06', '09', '01', 'SAN IGNACIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (706, '06', '09', '02', 'CHIRINOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (707, '06', '09', '03', 'HUARANGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (708, '06', '09', '04', 'LA COIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (709, '06', '09', '05', 'NAMBALLE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (710, '06', '09', '06', 'SAN JOSE DE LOURDES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (711, '06', '09', '07', 'TABACONAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (712, '06', '10', '00', 'SAN MARCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (713, '06', '10', '01', 'PEDRO GALVEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (714, '06', '10', '02', 'CHANCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (715, '06', '10', '03', 'EDUARDO VILLANUEVA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (716, '06', '10', '04', 'GREGORIO PITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (717, '06', '10', '05', 'ICHOCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (718, '06', '10', '06', 'JOSE MANUEL QUIROZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (719, '06', '10', '07', 'JOSE SABOGAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (720, '06', '11', '00', 'SAN MIGUEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (721, '06', '11', '01', 'SAN MIGUEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (722, '06', '11', '02', 'BOLIVAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (723, '06', '11', '03', 'CALQUIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (724, '06', '11', '04', 'CATILLUC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (725, '06', '11', '05', 'EL PRADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (726, '06', '11', '06', 'LA FLORIDA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (727, '06', '11', '07', 'LLAPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (728, '06', '11', '08', 'NANCHOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (729, '06', '11', '09', 'NIEPOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (730, '06', '11', '10', 'SAN GREGORIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (731, '06', '11', '11', 'SAN SILVESTRE DE COCHAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (732, '06', '11', '12', 'TONGOD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (733, '06', '11', '13', 'UNION AGUA BLANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (734, '06', '12', '00', 'SAN PABLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (735, '06', '12', '01', 'SAN PABLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (736, '06', '12', '02', 'SAN BERNARDINO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (737, '06', '12', '03', 'SAN LUIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (738, '06', '12', '04', 'TUMBADEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (739, '06', '13', '00', 'SANTA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (740, '06', '13', '01', 'SANTA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (741, '06', '13', '02', 'ANDABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (742, '06', '13', '03', 'CATACHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (743, '06', '13', '04', 'CHANCAYBAÃ‘OS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (744, '06', '13', '05', 'LA ESPERANZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (745, '06', '13', '06', 'NINABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (746, '06', '13', '07', 'PULAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (747, '06', '13', '08', 'SAUCEPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (748, '06', '13', '09', 'SEXI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (749, '06', '13', '10', 'UTICYACU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (750, '06', '13', '11', 'YAUYUCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (751, '07', '00', '00', 'CALLAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (752, '07', '01', '00', 'CALLAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (753, '07', '01', '01', 'CALLAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (754, '07', '01', '02', 'BELLAVISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (755, '07', '01', '03', 'CARMEN DE LA LEGUA REYNOSO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (756, '07', '01', '04', 'LA PERLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (757, '07', '01', '05', 'LA PUNTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (758, '07', '01', '06', 'VENTANILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (759, '08', '00', '00', 'CUSCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (760, '08', '01', '00', 'CUSCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (761, '08', '01', '01', 'CUSCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (762, '08', '01', '02', 'CCORCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (763, '08', '01', '03', 'POROY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (764, '08', '01', '04', 'SAN JERONIMO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (765, '08', '01', '05', 'SAN SEBASTIAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (766, '08', '01', '06', 'SANTIAGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (767, '08', '01', '07', 'SAYLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (768, '08', '01', '08', 'WANCHAQ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (769, '08', '02', '00', 'ACOMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (770, '08', '02', '01', 'ACOMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (771, '08', '02', '02', 'ACOPIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (772, '08', '02', '03', 'ACOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (773, '08', '02', '04', 'MOSOC LLACTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (774, '08', '02', '05', 'POMACANCHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (775, '08', '02', '06', 'RONDOCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (776, '08', '02', '07', 'SANGARARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (777, '08', '03', '00', 'ANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (778, '08', '03', '01', 'ANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (779, '08', '03', '02', 'ANCAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (780, '08', '03', '03', 'CACHIMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (781, '08', '03', '04', 'CHINCHAYPUJIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (782, '08', '03', '05', 'HUAROCONDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (783, '08', '03', '06', 'LIMATAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (784, '08', '03', '07', 'MOLLEPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (785, '08', '03', '08', 'PUCYURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (786, '08', '03', '09', 'ZURITE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (787, '08', '04', '00', 'CALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (788, '08', '04', '01', 'CALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (789, '08', '04', '02', 'COYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (790, '08', '04', '03', 'LAMAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (791, '08', '04', '04', 'LARES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (792, '08', '04', '05', 'PISAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (793, '08', '04', '06', 'SAN SALVADOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (794, '08', '04', '07', 'TARAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (795, '08', '04', '08', 'YANATILE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (796, '08', '05', '00', 'CANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (797, '08', '05', '01', 'YANAOCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (798, '08', '05', '02', 'CHECCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (799, '08', '05', '03', 'KUNTURKANKI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (800, '08', '05', '04', 'LANGUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (801, '08', '05', '05', 'LAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (802, '08', '05', '06', 'PAMPAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (803, '08', '05', '07', 'QUEHUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (804, '08', '05', '08', 'TUPAC AMARU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (805, '08', '06', '00', 'CANCHIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (806, '08', '06', '01', 'SICUANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (807, '08', '06', '02', 'CHECACUPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (808, '08', '06', '03', 'COMBAPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (809, '08', '06', '04', 'MARANGANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (810, '08', '06', '05', 'PITUMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (811, '08', '06', '06', 'SAN PABLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (812, '08', '06', '07', 'SAN PEDRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (813, '08', '06', '08', 'TINTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (814, '08', '07', '00', 'CHUMBIVILCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (815, '08', '07', '01', 'SANTO TOMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (816, '08', '07', '02', 'CAPACMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (817, '08', '07', '03', 'CHAMACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (818, '08', '07', '04', 'COLQUEMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (819, '08', '07', '05', 'LIVITACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (820, '08', '07', '06', 'LLUSCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (821, '08', '07', '07', 'QUIÃ‘OTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (822, '08', '07', '08', 'VELILLE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (823, '08', '08', '00', 'ESPINAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (824, '08', '08', '01', 'ESPINAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (825, '08', '08', '02', 'CONDOROMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (826, '08', '08', '03', 'COPORAQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (827, '08', '08', '04', 'OCORURO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (828, '08', '08', '05', 'PALLPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (829, '08', '08', '06', 'PICHIGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (830, '08', '08', '07', 'SUYCKUTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (831, '08', '08', '08', 'ALTO PICHIGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (832, '08', '09', '00', 'LA CONVENCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (833, '08', '09', '01', 'SANTA ANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (834, '08', '09', '02', 'ECHARATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (835, '08', '09', '03', 'HUAYOPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (836, '08', '09', '04', 'MARANURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (837, '08', '09', '05', 'OCOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (838, '08', '09', '06', 'QUELLOUNO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (839, '08', '09', '07', 'KIMBIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (840, '08', '09', '08', 'SANTA TERESA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (841, '08', '09', '09', 'VILCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (842, '08', '09', '10', 'PICHARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (843, '08', '10', '00', 'PARURO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (844, '08', '10', '01', 'PARURO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (845, '08', '10', '02', 'ACCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (846, '08', '10', '03', 'CCAPI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (847, '08', '10', '04', 'COLCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (848, '08', '10', '05', 'HUANOQUITE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (849, '08', '10', '06', 'OMACHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (850, '08', '10', '07', 'PACCARITAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (851, '08', '10', '08', 'PILLPINTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (852, '08', '10', '09', 'YAURISQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (853, '08', '11', '00', 'PAUCARTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (854, '08', '11', '01', 'PAUCARTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (855, '08', '11', '02', 'CAICAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (856, '08', '11', '03', 'CHALLABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (857, '08', '11', '04', 'COLQUEPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (858, '08', '11', '05', 'HUANCARANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (859, '08', '11', '06', 'KOSÃ‘IPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (860, '08', '12', '00', 'QUISPICANCHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (861, '08', '12', '01', 'URCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (862, '08', '12', '02', 'ANDAHUAYLILLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (863, '08', '12', '03', 'CAMANTI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (864, '08', '12', '04', 'CCARHUAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (865, '08', '12', '05', 'CCATCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (866, '08', '12', '06', 'CUSIPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (867, '08', '12', '07', 'HUARO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (868, '08', '12', '08', 'LUCRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (869, '08', '12', '09', 'MARCAPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (870, '08', '12', '10', 'OCONGATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (871, '08', '12', '11', 'OROPESA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (872, '08', '12', '12', 'QUIQUIJANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (873, '08', '13', '00', 'URUBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (874, '08', '13', '01', 'URUBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (875, '08', '13', '02', 'CHINCHERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (876, '08', '13', '03', 'HUAYLLABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (877, '08', '13', '04', 'MACHUPICCHU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (878, '08', '13', '05', 'MARAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (879, '08', '13', '06', 'OLLANTAYTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (880, '08', '13', '07', 'YUCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (881, '09', '00', '00', 'HUANCAVELICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (882, '09', '01', '00', 'HUANCAVELICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (883, '09', '01', '01', 'HUANCAVELICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (884, '09', '01', '02', 'ACOBAMBILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (885, '09', '01', '03', 'ACORIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (886, '09', '01', '04', 'CONAYCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (887, '09', '01', '05', 'CUENCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (888, '09', '01', '06', 'HUACHOCOLPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (889, '09', '01', '07', 'HUAYLLAHUARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (890, '09', '01', '08', 'IZCUCHACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (891, '09', '01', '09', 'LARIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (892, '09', '01', '10', 'MANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (893, '09', '01', '11', 'MARISCAL CACERES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (894, '09', '01', '12', 'MOYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (895, '09', '01', '13', 'NUEVO OCCORO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (896, '09', '01', '14', 'PALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (897, '09', '01', '15', 'PILCHACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (898, '09', '01', '16', 'VILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (899, '09', '01', '17', 'YAULI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (900, '09', '01', '18', 'ASCENSION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (901, '09', '01', '19', 'HUANDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (902, '09', '02', '00', 'ACOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (903, '09', '02', '01', 'ACOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (904, '09', '02', '02', 'ANDABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (905, '09', '02', '03', 'ANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (906, '09', '02', '04', 'CAJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (907, '09', '02', '05', 'MARCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (908, '09', '02', '06', 'PAUCARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (909, '09', '02', '07', 'POMACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (910, '09', '02', '08', 'ROSARIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (911, '09', '03', '00', 'ANGARAES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (912, '09', '03', '01', 'LIRCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (913, '09', '03', '02', 'ANCHONGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (914, '09', '03', '03', 'CALLANMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (915, '09', '03', '04', 'CCOCHACCASA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (916, '09', '03', '05', 'CHINCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (917, '09', '03', '06', 'CONGALLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (918, '09', '03', '07', 'HUANCA-HUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (919, '09', '03', '08', 'HUAYLLAY GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (920, '09', '03', '09', 'JULCAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (921, '09', '03', '10', 'SAN ANTONIO DE ANTAPARCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (922, '09', '03', '11', 'SANTO TOMAS DE PATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (923, '09', '03', '12', 'SECCLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (924, '09', '04', '00', 'CASTROVIRREYNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (925, '09', '04', '01', 'CASTROVIRREYNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (926, '09', '04', '02', 'ARMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (927, '09', '04', '03', 'AURAHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (928, '09', '04', '04', 'CAPILLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (929, '09', '04', '05', 'CHUPAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (930, '09', '04', '06', 'COCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (931, '09', '04', '07', 'HUACHOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (932, '09', '04', '08', 'HUAMATAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (933, '09', '04', '09', 'MOLLEPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (934, '09', '04', '10', 'SAN JUAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (935, '09', '04', '11', 'SANTA ANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (936, '09', '04', '12', 'TANTARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (937, '09', '04', '13', 'TICRAPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (938, '09', '05', '00', 'CHURCAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (939, '09', '05', '01', 'CHURCAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (940, '09', '05', '02', 'ANCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (941, '09', '05', '03', 'CHINCHIHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (942, '09', '05', '04', 'EL CARMEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (943, '09', '05', '05', 'LA MERCED', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (944, '09', '05', '06', 'LOCROJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (945, '09', '05', '07', 'PAUCARBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (946, '09', '05', '08', 'SAN MIGUEL DE MAYOCC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (947, '09', '05', '09', 'SAN PEDRO DE CORIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (948, '09', '05', '10', 'PACHAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (949, '09', '05', '11', 'COSME', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (950, '09', '06', '00', 'HUAYTARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (951, '09', '06', '01', 'HUAYTARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (952, '09', '06', '02', 'AYAVI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (953, '09', '06', '03', 'CORDOVA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (954, '09', '06', '04', 'HUAYACUNDO ARMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (955, '09', '06', '05', 'LARAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (956, '09', '06', '06', 'OCOYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (957, '09', '06', '07', 'PILPICHACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (958, '09', '06', '08', 'QUERCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (959, '09', '06', '09', 'QUITO-ARMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (960, '09', '06', '10', 'SAN ANTONIO DE CUSICANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (961, '09', '06', '11', 'SAN FRANCISCO DE SANGAYAICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (962, '09', '06', '12', 'SAN ISIDRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (963, '09', '06', '13', 'SANTIAGO DE CHOCORVOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (964, '09', '06', '14', 'SANTIAGO DE QUIRAHUARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (965, '09', '06', '15', 'SANTO DOMINGO DE CAPILLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (966, '09', '06', '16', 'TAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (967, '09', '07', '00', 'TAYACAJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (968, '09', '07', '01', 'PAMPAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (969, '09', '07', '02', 'ACOSTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (970, '09', '07', '03', 'ACRAQUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (971, '09', '07', '04', 'AHUAYCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (972, '09', '07', '05', 'COLCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (973, '09', '07', '06', 'DANIEL HERNANDEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (974, '09', '07', '07', 'HUACHOCOLPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (975, '09', '07', '09', 'HUARIBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (976, '09', '07', '10', 'Ã‘AHUIMPUQUIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (977, '09', '07', '11', 'PAZOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (978, '09', '07', '13', 'QUISHUAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (979, '09', '07', '14', 'SALCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (980, '09', '07', '15', 'SALCAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (981, '09', '07', '16', 'SAN MARCOS DE ROCCHAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (982, '09', '07', '17', 'SURCUBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (983, '09', '07', '18', 'TINTAY PUNCU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (984, '10', '00', '00', 'HUANUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (985, '10', '01', '00', 'HUANUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (986, '10', '01', '01', 'HUANUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (987, '10', '01', '02', 'AMARILIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (988, '10', '01', '03', 'CHINCHAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (989, '10', '01', '04', 'CHURUBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (990, '10', '01', '05', 'MARGOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (991, '10', '01', '06', 'QUISQUI (KICHKI)', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (992, '10', '01', '07', 'SAN FRANCISCO DE CAYRAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (993, '10', '01', '08', 'SAN PEDRO DE CHAULAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (994, '10', '01', '09', 'SANTA MARIA DEL VALLE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (995, '10', '01', '10', 'YARUMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (996, '10', '01', '11', 'PILLCO MARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (997, '10', '01', '12', 'YACUS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (998, '10', '02', '00', 'AMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (999, '10', '02', '01', 'AMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1000, '10', '02', '02', 'CAYNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1001, '10', '02', '03', 'COLPAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1002, '10', '02', '04', 'CONCHAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1003, '10', '02', '05', 'HUACAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1004, '10', '02', '06', 'SAN FRANCISCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1005, '10', '02', '07', 'SAN RAFAEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1006, '10', '02', '08', 'TOMAY KICHWA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1007, '10', '03', '00', 'DOS DE MAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1008, '10', '03', '01', 'LA UNION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1009, '10', '03', '07', 'CHUQUIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1010, '10', '03', '11', 'MARIAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1011, '10', '03', '13', 'PACHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1012, '10', '03', '16', 'QUIVILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1013, '10', '03', '17', 'RIPAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1014, '10', '03', '21', 'SHUNQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1015, '10', '03', '22', 'SILLAPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1016, '10', '03', '23', 'YANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1017, '10', '04', '00', 'HUACAYBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1018, '10', '04', '01', 'HUACAYBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1019, '10', '04', '02', 'CANCHABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1020, '10', '04', '03', 'COCHABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1021, '10', '04', '04', 'PINRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1022, '10', '05', '00', 'HUAMALIES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1023, '10', '05', '01', 'LLATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1024, '10', '05', '02', 'ARANCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1025, '10', '05', '03', 'CHAVIN DE PARIARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1026, '10', '05', '04', 'JACAS GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1027, '10', '05', '05', 'JIRCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1028, '10', '05', '06', 'MIRAFLORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1029, '10', '05', '07', 'MONZON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1030, '10', '05', '08', 'PUNCHAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1031, '10', '05', '09', 'PUÃ‘OS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1032, '10', '05', '10', 'SINGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1033, '10', '05', '11', 'TANTAMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1034, '10', '06', '00', 'LEONCIO PRADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1035, '10', '06', '01', 'RUPA-RUPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1036, '10', '06', '02', 'DANIEL ALOMIA ROBLES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1037, '10', '06', '03', 'HERMILIO VALDIZAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1038, '10', '06', '04', 'JOSE CRESPO Y CASTILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1039, '10', '06', '05', 'LUYANDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1040, '10', '06', '06', 'MARIANO DAMASO BERAUN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1041, '10', '07', '00', 'MARAÃ‘ON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1042, '10', '07', '01', 'HUACRACHUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1043, '10', '07', '02', 'CHOLON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1044, '10', '07', '03', 'SAN BUENAVENTURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1045, '10', '08', '00', 'PACHITEA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1046, '10', '08', '01', 'PANAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1047, '10', '08', '02', 'CHAGLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1048, '10', '08', '03', 'MOLINO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1049, '10', '08', '04', 'UMARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1050, '10', '09', '00', 'PUERTO INCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1051, '10', '09', '01', 'PUERTO INCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1052, '10', '09', '02', 'CODO DEL POZUZO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1053, '10', '09', '03', 'HONORIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1054, '10', '09', '04', 'TOURNAVISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1055, '10', '09', '05', 'YUYAPICHIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1056, '10', '10', '00', 'LAURICOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1057, '10', '10', '01', 'JESUS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1058, '10', '10', '02', 'BAÃ‘OS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1059, '10', '10', '03', 'JIVIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1060, '10', '10', '04', 'QUEROPALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1061, '10', '10', '05', 'RONDOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1062, '10', '10', '06', 'SAN FRANCISCO DE ASIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1063, '10', '10', '07', 'SAN MIGUEL DE CAURI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1064, '10', '11', '00', 'YAROWILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1065, '10', '11', '01', 'CHAVINILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1066, '10', '11', '02', 'CAHUAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1067, '10', '11', '03', 'CHACABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1068, '10', '11', '04', 'APARICIO POMARES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1069, '10', '11', '05', 'JACAS CHICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1070, '10', '11', '06', 'OBAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1071, '10', '11', '07', 'PAMPAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1072, '10', '11', '08', 'CHORAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1073, '11', '00', '00', 'ICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1074, '11', '01', '00', 'ICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1075, '11', '01', '01', 'ICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1076, '11', '01', '02', 'LA TINGUIÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1077, '11', '01', '03', 'LOS AQUIJES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1078, '11', '01', '04', 'OCUCAJE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1079, '11', '01', '05', 'PACHACUTEC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1080, '11', '01', '06', 'PARCONA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1081, '11', '01', '07', 'PUEBLO NUEVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1082, '11', '01', '08', 'SALAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1083, '11', '01', '09', 'SAN JOSE DE LOS MOLINOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1084, '11', '01', '10', 'SAN JUAN BAUTISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1085, '11', '01', '11', 'SANTIAGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1086, '11', '01', '12', 'SUBTANJALLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1087, '11', '01', '13', 'TATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1088, '11', '01', '14', 'YAUCA DEL ROSARIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1089, '11', '02', '00', 'CHINCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1090, '11', '02', '01', 'CHINCHA ALTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1091, '11', '02', '02', 'ALTO LARAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1092, '11', '02', '03', 'CHAVIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1093, '11', '02', '04', 'CHINCHA BAJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1094, '11', '02', '05', 'EL CARMEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1095, '11', '02', '06', 'GROCIO PRADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1096, '11', '02', '07', 'PUEBLO NUEVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1097, '11', '02', '08', 'SAN JUAN DE YANAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1098, '11', '02', '09', 'SAN PEDRO DE HUACARPANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1099, '11', '02', '10', 'SUNAMPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1100, '11', '02', '11', 'TAMBO DE MORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1101, '11', '03', '00', 'NAZCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1102, '11', '03', '01', 'NAZCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1103, '11', '03', '02', 'CHANGUILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1104, '11', '03', '03', 'EL INGENIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1105, '11', '03', '04', 'MARCONA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1106, '11', '03', '05', 'VISTA ALEGRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1107, '11', '04', '00', 'PALPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1108, '11', '04', '01', 'PALPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1109, '11', '04', '02', 'LLIPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1110, '11', '04', '03', 'RIO GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1111, '11', '04', '04', 'SANTA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1112, '11', '04', '05', 'TIBILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1113, '11', '05', '00', 'PISCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1114, '11', '05', '01', 'PISCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1115, '11', '05', '02', 'HUANCANO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1116, '11', '05', '03', 'HUMAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1117, '11', '05', '04', 'INDEPENDENCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1118, '11', '05', '05', 'PARACAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1119, '11', '05', '06', 'SAN ANDRES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1120, '11', '05', '07', 'SAN CLEMENTE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1121, '11', '05', '08', 'TUPAC AMARU INCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1122, '12', '00', '00', 'JUNIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1123, '12', '01', '00', 'HUANCAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1124, '12', '01', '01', 'HUANCAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1125, '12', '01', '04', 'CARHUACALLANGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1126, '12', '01', '05', 'CHACAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1127, '12', '01', '06', 'CHICCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1128, '12', '01', '07', 'CHILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1129, '12', '01', '08', 'CHONGOS ALTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1130, '12', '01', '11', 'CHUPURO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1131, '12', '01', '12', 'COLCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1132, '12', '01', '13', 'CULLHUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1133, '12', '01', '14', 'EL TAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1134, '12', '01', '16', 'HUACRAPUQUIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1135, '12', '01', '17', 'HUALHUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1136, '12', '01', '19', 'HUANCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1137, '12', '01', '20', 'HUASICANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1138, '12', '01', '21', 'HUAYUCACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1139, '12', '01', '22', 'INGENIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1140, '12', '01', '24', 'PARIAHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1141, '12', '01', '25', 'PILCOMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1142, '12', '01', '26', 'PUCARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1143, '12', '01', '27', 'QUICHUAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1144, '12', '01', '28', 'QUILCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1145, '12', '01', '29', 'SAN AGUSTIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1146, '12', '01', '30', 'SAN JERONIMO DE TUNAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1147, '12', '01', '32', 'SAÃ‘O', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1148, '12', '01', '33', 'SAPALLANGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1149, '12', '01', '34', 'SICAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1150, '12', '01', '35', 'SANTO DOMINGO DE ACOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1151, '12', '01', '36', 'VIQUES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1152, '12', '02', '00', 'CONCEPCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1153, '12', '02', '01', 'CONCEPCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1154, '12', '02', '02', 'ACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1155, '12', '02', '03', 'ANDAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1156, '12', '02', '04', 'CHAMBARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1157, '12', '02', '05', 'COCHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1158, '12', '02', '06', 'COMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1159, '12', '02', '07', 'HEROINAS TOLEDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1160, '12', '02', '08', 'MANZANARES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1161, '12', '02', '09', 'MARISCAL CASTILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1162, '12', '02', '10', 'MATAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1163, '12', '02', '11', 'MITO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1164, '12', '02', '12', 'NUEVE DE JULIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1165, '12', '02', '13', 'ORCOTUNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1166, '12', '02', '14', 'SAN JOSE DE QUERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1167, '12', '02', '15', 'SANTA ROSA DE OCOPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1168, '12', '03', '00', 'CHANCHAMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1169, '12', '03', '01', 'CHANCHAMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1170, '12', '03', '02', 'PERENE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1171, '12', '03', '03', 'PICHANAQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1172, '12', '03', '04', 'SAN LUIS DE SHUARO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1173, '12', '03', '05', 'SAN RAMON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1174, '12', '03', '06', 'VITOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1175, '12', '04', '00', 'JAUJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1176, '12', '04', '01', 'JAUJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1177, '12', '04', '02', 'ACOLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1178, '12', '04', '03', 'APATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1179, '12', '04', '04', 'ATAURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1180, '12', '04', '05', 'CANCHAYLLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1181, '12', '04', '06', 'CURICACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1182, '12', '04', '07', 'EL MANTARO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1183, '12', '04', '08', 'HUAMALI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1184, '12', '04', '09', 'HUARIPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1185, '12', '04', '10', 'HUERTAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1186, '12', '04', '11', 'JANJAILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1187, '12', '04', '12', 'JULCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1188, '12', '04', '13', 'LEONOR ORDOÃ‘EZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1189, '12', '04', '14', 'LLOCLLAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1190, '12', '04', '15', 'MARCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1191, '12', '04', '16', 'MASMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1192, '12', '04', '17', 'MASMA CHICCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1193, '12', '04', '18', 'MOLINOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1194, '12', '04', '19', 'MONOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1195, '12', '04', '20', 'MUQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1196, '12', '04', '21', 'MUQUIYAUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1197, '12', '04', '22', 'PACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1198, '12', '04', '23', 'PACCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1199, '12', '04', '24', 'PANCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1200, '12', '04', '25', 'PARCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1201, '12', '04', '26', 'POMACANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1202, '12', '04', '27', 'RICRAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1203, '12', '04', '28', 'SAN LORENZO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1204, '12', '04', '29', 'SAN PEDRO DE CHUNAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1205, '12', '04', '30', 'SAUSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1206, '12', '04', '31', 'SINCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1207, '12', '04', '32', 'TUNAN MARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1208, '12', '04', '33', 'YAULI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1209, '12', '04', '34', 'YAUYOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1210, '12', '05', '00', 'JUNIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1211, '12', '05', '01', 'JUNIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1212, '12', '05', '02', 'CARHUAMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1213, '12', '05', '03', 'ONDORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1214, '12', '05', '04', 'ULCUMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1215, '12', '06', '00', 'SATIPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1216, '12', '06', '01', 'SATIPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1217, '12', '06', '02', 'COVIRIALI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1218, '12', '06', '03', 'LLAYLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1219, '12', '06', '05', 'PAMPA HERMOSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1220, '12', '06', '07', 'RIO NEGRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1221, '12', '06', '08', 'RIO TAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1222, '12', '06', '99', 'MAZAMARI - PANGOA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1223, '12', '07', '00', 'TARMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1224, '12', '07', '01', 'TARMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1225, '12', '07', '02', 'ACOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1226, '12', '07', '03', 'HUARICOLCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1227, '12', '07', '04', 'HUASAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1228, '12', '07', '05', 'LA UNION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1229, '12', '07', '06', 'PALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1230, '12', '07', '07', 'PALCAMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1231, '12', '07', '08', 'SAN PEDRO DE CAJAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1232, '12', '07', '09', 'TAPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1233, '12', '08', '00', 'YAULI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1234, '12', '08', '01', 'LA OROYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1235, '12', '08', '02', 'CHACAPALPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1236, '12', '08', '03', 'HUAY-HUAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1237, '12', '08', '04', 'MARCAPOMACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1238, '12', '08', '05', 'MOROCOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1239, '12', '08', '06', 'PACCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1240, '12', '08', '07', 'SANTA BARBARA DE CARHUACAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1241, '12', '08', '08', 'SANTA ROSA DE SACCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1242, '12', '08', '09', 'SUITUCANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1243, '12', '08', '10', 'YAULI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1244, '12', '09', '00', 'CHUPACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1245, '12', '09', '01', 'CHUPACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1246, '12', '09', '02', 'AHUAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1247, '12', '09', '03', 'CHONGOS BAJO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1248, '12', '09', '04', 'HUACHAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1249, '12', '09', '05', 'HUAMANCACA CHICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1250, '12', '09', '06', 'SAN JUAN DE ISCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1251, '12', '09', '07', 'SAN JUAN DE JARPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1252, '12', '09', '08', 'TRES DE DICIEMBRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1253, '12', '09', '09', 'YANACANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1254, '13', '00', '00', 'LA LIBERTAD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1255, '13', '01', '00', 'TRUJILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1256, '13', '01', '01', 'TRUJILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1257, '13', '01', '02', 'EL PORVENIR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1258, '13', '01', '03', 'FLORENCIA DE MORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1259, '13', '01', '04', 'HUANCHACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1260, '13', '01', '05', 'LA ESPERANZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1261, '13', '01', '06', 'LAREDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1262, '13', '01', '07', 'MOCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1263, '13', '01', '08', 'POROTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1264, '13', '01', '09', 'SALAVERRY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1265, '13', '01', '10', 'SIMBAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1266, '13', '01', '11', 'VICTOR LARCO HERRERA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1267, '13', '02', '00', 'ASCOPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1268, '13', '02', '01', 'ASCOPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1269, '13', '02', '02', 'CHICAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1270, '13', '02', '03', 'CHOCOPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1271, '13', '02', '04', 'MAGDALENA DE CAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1272, '13', '02', '05', 'PAIJAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1273, '13', '02', '06', 'RAZURI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1274, '13', '02', '07', 'SANTIAGO DE CAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1275, '13', '02', '08', 'CASA GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1276, '13', '03', '00', 'BOLIVAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1277, '13', '03', '01', 'BOLIVAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1278, '13', '03', '02', 'BAMBAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1279, '13', '03', '03', 'CONDORMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1280, '13', '03', '04', 'LONGOTEA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1281, '13', '03', '05', 'UCHUMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1282, '13', '03', '06', 'UCUNCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1283, '13', '04', '00', 'CHEPEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1284, '13', '04', '01', 'CHEPEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1285, '13', '04', '02', 'PACANGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1286, '13', '04', '03', 'PUEBLO NUEVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1287, '13', '05', '00', 'JULCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1288, '13', '05', '01', 'JULCAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1289, '13', '05', '02', 'CALAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1290, '13', '05', '03', 'CARABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1291, '13', '05', '04', 'HUASO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1292, '13', '06', '00', 'OTUZCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1293, '13', '06', '01', 'OTUZCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1294, '13', '06', '02', 'AGALLPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1295, '13', '06', '04', 'CHARAT', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1296, '13', '06', '05', 'HUARANCHAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1297, '13', '06', '06', 'LA CUESTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1298, '13', '06', '08', 'MACHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1299, '13', '06', '10', 'PARANDAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1300, '13', '06', '11', 'SALPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1301, '13', '06', '13', 'SINSICAP', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1302, '13', '06', '14', 'USQUIL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1303, '13', '07', '00', 'PACASMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1304, '13', '07', '01', 'SAN PEDRO DE LLOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1305, '13', '07', '02', 'GUADALUPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1306, '13', '07', '03', 'JEQUETEPEQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1307, '13', '07', '04', 'PACASMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1308, '13', '07', '05', 'SAN JOSE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1309, '13', '08', '00', 'PATAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1310, '13', '08', '01', 'TAYABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1311, '13', '08', '02', 'BULDIBUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1312, '13', '08', '03', 'CHILLIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1313, '13', '08', '04', 'HUANCASPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1314, '13', '08', '05', 'HUAYLILLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1315, '13', '08', '06', 'HUAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1316, '13', '08', '07', 'ONGON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1317, '13', '08', '08', 'PARCOY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1318, '13', '08', '09', 'PATAZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1319, '13', '08', '10', 'PIAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1320, '13', '08', '11', 'SANTIAGO DE CHALLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1321, '13', '08', '12', 'TAURIJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1322, '13', '08', '13', 'URPAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1323, '13', '09', '00', 'SANCHEZ CARRION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1324, '13', '09', '01', 'HUAMACHUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1325, '13', '09', '02', 'CHUGAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1326, '13', '09', '03', 'COCHORCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1327, '13', '09', '04', 'CURGOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1328, '13', '09', '05', 'MARCABAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1329, '13', '09', '06', 'SANAGORAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1330, '13', '09', '07', 'SARIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1331, '13', '09', '08', 'SARTIMBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1332, '13', '10', '00', 'SANTIAGO DE CHUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1333, '13', '10', '01', 'SANTIAGO DE CHUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1334, '13', '10', '02', 'ANGASMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1335, '13', '10', '03', 'CACHICADAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1336, '13', '10', '04', 'MOLLEBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1337, '13', '10', '05', 'MOLLEPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1338, '13', '10', '06', 'QUIRUVILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1339, '13', '10', '07', 'SANTA CRUZ DE CHUCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1340, '13', '10', '08', 'SITABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1341, '13', '11', '00', 'GRAN CHIMU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1342, '13', '11', '01', 'CASCAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1343, '13', '11', '02', 'LUCMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1344, '13', '11', '03', 'MARMOT', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1345, '13', '11', '04', 'SAYAPULLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1346, '13', '12', '00', 'VIRU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1347, '13', '12', '01', 'VIRU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1348, '13', '12', '02', 'CHAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1349, '13', '12', '03', 'GUADALUPITO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1350, '14', '00', '00', 'LAMBAYEQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1351, '14', '01', '00', 'CHICLAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1352, '14', '01', '01', 'CHICLAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1353, '14', '01', '02', 'CHONGOYAPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1354, '14', '01', '03', 'ETEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1355, '14', '01', '04', 'ETEN PUERTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1356, '14', '01', '05', 'JOSE LEONARDO ORTIZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1357, '14', '01', '06', 'LA VICTORIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1358, '14', '01', '07', 'LAGUNAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1359, '14', '01', '08', 'MONSEFU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1360, '14', '01', '09', 'NUEVA ARICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1361, '14', '01', '10', 'OYOTUN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1362, '14', '01', '11', 'PICSI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1363, '14', '01', '12', 'PIMENTEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1364, '14', '01', '13', 'REQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1365, '14', '01', '14', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1366, '14', '01', '15', 'SAÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1367, '14', '01', '16', 'CAYALTI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1368, '14', '01', '17', 'PATAPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1369, '14', '01', '18', 'POMALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1370, '14', '01', '19', 'PUCALA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1371, '14', '01', '20', 'TUMAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1372, '14', '02', '00', 'FERREÃ‘AFE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1373, '14', '02', '01', 'FERREÃ‘AFE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1374, '14', '02', '02', 'CAÃ‘ARIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1375, '14', '02', '03', 'INCAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1376, '14', '02', '04', 'MANUEL ANTONIO MESONES MURO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1377, '14', '02', '05', 'PITIPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1378, '14', '02', '06', 'PUEBLO NUEVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1379, '14', '03', '00', 'LAMBAYEQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1380, '14', '03', '01', 'LAMBAYEQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1381, '14', '03', '02', 'CHOCHOPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1382, '14', '03', '03', 'ILLIMO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1383, '14', '03', '04', 'JAYANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1384, '14', '03', '05', 'MOCHUMI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1385, '14', '03', '06', 'MORROPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1386, '14', '03', '07', 'MOTUPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1387, '14', '03', '08', 'OLMOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1388, '14', '03', '09', 'PACORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1389, '14', '03', '10', 'SALAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1390, '14', '03', '11', 'SAN JOSE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1391, '14', '03', '12', 'TUCUME', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1392, '15', '00', '00', 'LIMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1393, '15', '01', '00', 'LIMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1394, '15', '01', '01', 'LIMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1395, '15', '01', '02', 'ANCON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1396, '15', '01', '03', 'ATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1397, '15', '01', '04', 'BARRANCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1398, '15', '01', '05', 'BREÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1399, '15', '01', '06', 'CARABAYLLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1400, '15', '01', '07', 'CHACLACAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1401, '15', '01', '08', 'CHORRILLOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1402, '15', '01', '09', 'CIENEGUILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1403, '15', '01', '10', 'COMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1404, '15', '01', '11', 'EL AGUSTINO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1405, '15', '01', '12', 'INDEPENDENCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1406, '15', '01', '13', 'JESUS MARIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1407, '15', '01', '14', 'LA MOLINA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1408, '15', '01', '15', 'LA VICTORIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1409, '15', '01', '16', 'LINCE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1410, '15', '01', '17', 'LOS OLIVOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1411, '15', '01', '18', 'LURIGANCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1412, '15', '01', '19', 'LURIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1413, '15', '01', '20', 'MAGDALENA DEL MAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1414, '15', '01', '21', 'PUEBLO LIBRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1415, '15', '01', '22', 'MIRAFLORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1416, '15', '01', '23', 'PACHACAMAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1417, '15', '01', '24', 'PUCUSANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1418, '15', '01', '25', 'PUENTE PIEDRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1419, '15', '01', '26', 'PUNTA HERMOSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1420, '15', '01', '27', 'PUNTA NEGRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1421, '15', '01', '28', 'RIMAC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1422, '15', '01', '29', 'SAN BARTOLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1423, '15', '01', '30', 'SAN BORJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1424, '15', '01', '31', 'SAN ISIDRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1425, '15', '01', '32', 'SAN JUAN DE LURIGANCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1426, '15', '01', '33', 'SAN JUAN DE MIRAFLORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1427, '15', '01', '34', 'SAN LUIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1428, '15', '01', '35', 'SAN MARTIN DE PORRES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1429, '15', '01', '36', 'SAN MIGUEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1430, '15', '01', '37', 'SANTA ANITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1431, '15', '01', '38', 'SANTA MARIA DEL MAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1432, '15', '01', '39', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1433, '15', '01', '40', 'SANTIAGO DE SURCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1434, '15', '01', '41', 'SURQUILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1435, '15', '01', '42', 'VILLA EL SALVADOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1436, '15', '01', '43', 'VILLA MARIA DEL TRIUNFO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1437, '15', '02', '00', 'BARRANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1438, '15', '02', '01', 'BARRANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1439, '15', '02', '02', 'PARAMONGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1440, '15', '02', '03', 'PATIVILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1441, '15', '02', '04', 'SUPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1442, '15', '02', '05', 'SUPE PUERTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1443, '15', '03', '00', 'CAJATAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1444, '15', '03', '01', 'CAJATAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1445, '15', '03', '02', 'COPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1446, '15', '03', '03', 'GORGOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1447, '15', '03', '04', 'HUANCAPON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1448, '15', '03', '05', 'MANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1449, '15', '04', '00', 'CANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1450, '15', '04', '01', 'CANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1451, '15', '04', '02', 'ARAHUAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1452, '15', '04', '03', 'HUAMANTANGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1453, '15', '04', '04', 'HUAROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1454, '15', '04', '05', 'LACHAQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1455, '15', '04', '06', 'SAN BUENAVENTURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1456, '15', '04', '07', 'SANTA ROSA DE QUIVES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1457, '15', '05', '00', 'CAÃ‘ETE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1458, '15', '05', '01', 'SAN VICENTE DE CAÃ‘ETE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1459, '15', '05', '02', 'ASIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1460, '15', '05', '03', 'CALANGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1461, '15', '05', '04', 'CERRO AZUL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1462, '15', '05', '05', 'CHILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1463, '15', '05', '06', 'COAYLLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1464, '15', '05', '07', 'IMPERIAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1465, '15', '05', '08', 'LUNAHUANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1466, '15', '05', '09', 'MALA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1467, '15', '05', '10', 'NUEVO IMPERIAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1468, '15', '05', '11', 'PACARAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1469, '15', '05', '12', 'QUILMANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1470, '15', '05', '13', 'SAN ANTONIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1471, '15', '05', '14', 'SAN LUIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1472, '15', '05', '15', 'SANTA CRUZ DE FLORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1473, '15', '05', '16', 'ZUÃ‘IGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1474, '15', '06', '00', 'HUARAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1475, '15', '06', '01', 'HUARAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1476, '15', '06', '02', 'ATAVILLOS ALTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1477, '15', '06', '03', 'ATAVILLOS BAJO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1478, '15', '06', '04', 'AUCALLAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1479, '15', '06', '05', 'CHANCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1480, '15', '06', '06', 'IHUARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1481, '15', '06', '07', 'LAMPIAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1482, '15', '06', '08', 'PACARAOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1483, '15', '06', '09', 'SAN MIGUEL DE ACOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1484, '15', '06', '10', 'SANTA CRUZ DE ANDAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1485, '15', '06', '11', 'SUMBILCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1486, '15', '06', '12', 'VEINTISIETE DE NOVIEMBRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1487, '15', '07', '00', 'HUAROCHIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1488, '15', '07', '01', 'MATUCANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1489, '15', '07', '02', 'ANTIOQUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1490, '15', '07', '03', 'CALLAHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1491, '15', '07', '04', 'CARAMPOMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1492, '15', '07', '05', 'CHICLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1493, '15', '07', '06', 'CUENCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1494, '15', '07', '07', 'HUACHUPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1495, '15', '07', '08', 'HUANZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1496, '15', '07', '09', 'HUAROCHIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1497, '15', '07', '10', 'LAHUAYTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1498, '15', '07', '11', 'LANGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1499, '15', '07', '12', 'LARAOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1500, '15', '07', '13', 'MARIATANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1501, '15', '07', '14', 'RICARDO PALMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1502, '15', '07', '15', 'SAN ANDRES DE TUPICOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1503, '15', '07', '16', 'SAN ANTONIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1504, '15', '07', '17', 'SAN BARTOLOME', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1505, '15', '07', '18', 'SAN DAMIAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1506, '15', '07', '19', 'SAN JUAN DE IRIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1507, '15', '07', '20', 'SAN JUAN DE TANTARANCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1508, '15', '07', '21', 'SAN LORENZO DE QUINTI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1509, '15', '07', '22', 'SAN MATEO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1510, '15', '07', '23', 'SAN MATEO DE OTAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1511, '15', '07', '24', 'SAN PEDRO DE CASTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1512, '15', '07', '25', 'SAN PEDRO DE HUANCAYRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1513, '15', '07', '26', 'SANGALLAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1514, '15', '07', '27', 'SANTA CRUZ DE COCACHACRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1515, '15', '07', '28', 'SANTA EULALIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1516, '15', '07', '29', 'SANTIAGO DE ANCHUCAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1517, '15', '07', '30', 'SANTIAGO DE TUNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1518, '15', '07', '31', 'SANTO DOMINGO DE LOS OLLEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1519, '15', '07', '32', 'SURCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1520, '15', '08', '00', 'HUAURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1521, '15', '08', '01', 'HUACHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1522, '15', '08', '02', 'AMBAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1523, '15', '08', '03', 'CALETA DE CARQUIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1524, '15', '08', '04', 'CHECRAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1525, '15', '08', '05', 'HUALMAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1526, '15', '08', '06', 'HUAURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1527, '15', '08', '07', 'LEONCIO PRADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1528, '15', '08', '08', 'PACCHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1529, '15', '08', '09', 'SANTA LEONOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1530, '15', '08', '10', 'SANTA MARIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1531, '15', '08', '11', 'SAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1532, '15', '08', '12', 'VEGUETA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1533, '15', '09', '00', 'OYON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1534, '15', '09', '01', 'OYON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1535, '15', '09', '02', 'ANDAJES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1536, '15', '09', '03', 'CAUJUL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1537, '15', '09', '04', 'COCHAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1538, '15', '09', '05', 'NAVAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1539, '15', '09', '06', 'PACHANGARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1540, '15', '10', '00', 'YAUYOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1541, '15', '10', '01', 'YAUYOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1542, '15', '10', '02', 'ALIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1543, '15', '10', '03', 'ALLAUCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1544, '15', '10', '04', 'AYAVIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1545, '15', '10', '05', 'AZANGARO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1546, '15', '10', '06', 'CACRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1547, '15', '10', '07', 'CARANIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1548, '15', '10', '08', 'CATAHUASI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1549, '15', '10', '09', 'CHOCOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1550, '15', '10', '10', 'COCHAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1551, '15', '10', '11', 'COLONIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1552, '15', '10', '12', 'HONGOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1553, '15', '10', '13', 'HUAMPARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1554, '15', '10', '14', 'HUANCAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1555, '15', '10', '15', 'HUANGASCAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1556, '15', '10', '16', 'HUANTAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1557, '15', '10', '17', 'HUAÃ‘EC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1558, '15', '10', '18', 'LARAOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1559, '15', '10', '19', 'LINCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1560, '15', '10', '20', 'MADEAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1561, '15', '10', '21', 'MIRAFLORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1562, '15', '10', '22', 'OMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1563, '15', '10', '23', 'PUTINZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1564, '15', '10', '24', 'QUINCHES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1565, '15', '10', '25', 'QUINOCAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1566, '15', '10', '26', 'SAN JOAQUIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1567, '15', '10', '27', 'SAN PEDRO DE PILAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1568, '15', '10', '28', 'TANTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1569, '15', '10', '29', 'TAURIPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1570, '15', '10', '30', 'TOMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1571, '15', '10', '31', 'TUPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1572, '15', '10', '32', 'VIÃ‘AC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1573, '15', '10', '33', 'VITIS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1574, '16', '00', '00', 'LORETO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1575, '16', '01', '00', 'MAYNAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1576, '16', '01', '01', 'IQUITOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1577, '16', '01', '02', 'ALTO NANAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1578, '16', '01', '03', 'FERNANDO LORES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1579, '16', '01', '04', 'INDIANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1580, '16', '01', '05', 'LAS AMAZONAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1581, '16', '01', '06', 'MAZAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1582, '16', '01', '07', 'NAPO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1583, '16', '01', '08', 'PUNCHANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1584, '16', '01', '09', 'PUTUMAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1585, '16', '01', '10', 'TORRES CAUSANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1586, '16', '01', '12', 'BELEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1587, '16', '01', '13', 'SAN JUAN BAUTISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1588, '16', '01', '14', 'TENIENTE MANUEL CLAVERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1589, '16', '02', '00', 'ALTO AMAZONAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1590, '16', '02', '01', 'YURIMAGUAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1591, '16', '02', '02', 'BALSAPUERTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1592, '16', '02', '05', 'JEBEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1593, '16', '02', '06', 'LAGUNAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1594, '16', '02', '10', 'SANTA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1595, '16', '02', '11', 'TENIENTE CESAR LOPEZ ROJAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1596, '16', '03', '00', 'LORETO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1597, '16', '03', '01', 'NAUTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1598, '16', '03', '02', 'PARINARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1599, '16', '03', '03', 'TIGRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1600, '16', '03', '04', 'TROMPETEROS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1601, '16', '03', '05', 'URARINAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1602, '16', '04', '00', 'MARISCAL RAMON CASTILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1603, '16', '04', '01', 'RAMON CASTILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1604, '16', '04', '02', 'PEBAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1605, '16', '04', '03', 'YAVARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1606, '16', '04', '04', 'SAN PABLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1607, '16', '05', '00', 'REQUENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1608, '16', '05', '01', 'REQUENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1609, '16', '05', '02', 'ALTO TAPICHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1610, '16', '05', '03', 'CAPELO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1611, '16', '05', '04', 'EMILIO SAN MARTIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1612, '16', '05', '05', 'MAQUIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1613, '16', '05', '06', 'PUINAHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1614, '16', '05', '07', 'SAQUENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1615, '16', '05', '08', 'SOPLIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1616, '16', '05', '09', 'TAPICHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1617, '16', '05', '10', 'JENARO HERRERA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1618, '16', '05', '11', 'YAQUERANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1619, '16', '06', '00', 'UCAYALI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1620, '16', '06', '01', 'CONTAMANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1621, '16', '06', '02', 'INAHUAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1622, '16', '06', '03', 'PADRE MARQUEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1623, '16', '06', '04', 'PAMPA HERMOSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1624, '16', '06', '05', 'SARAYACU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1625, '16', '06', '06', 'VARGAS GUERRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1626, '16', '07', '00', 'DATEM DEL MARAÃ‘ON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1627, '16', '07', '01', 'BARRANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1628, '16', '07', '02', 'CAHUAPANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1629, '16', '07', '03', 'MANSERICHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1630, '16', '07', '04', 'MORONA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1631, '16', '07', '05', 'PASTAZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1632, '16', '07', '06', 'ANDOAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1633, '17', '00', '00', 'MADRE DE DIOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1634, '17', '01', '00', 'TAMBOPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1635, '17', '01', '01', 'TAMBOPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1636, '17', '01', '02', 'INAMBARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1637, '17', '01', '03', 'LAS PIEDRAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1638, '17', '01', '04', 'LABERINTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1639, '17', '02', '00', 'MANU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1640, '17', '02', '01', 'MANU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1641, '17', '02', '02', 'FITZCARRALD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1642, '17', '02', '03', 'MADRE DE DIOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1643, '17', '02', '04', 'HUEPETUHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1644, '17', '03', '00', 'TAHUAMANU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1645, '17', '03', '01', 'IÃ‘APARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1646, '17', '03', '02', 'IBERIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1647, '17', '03', '03', 'TAHUAMANU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1648, '18', '00', '00', 'MOQUEGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1649, '18', '01', '00', 'MARISCAL NIETO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1650, '18', '01', '01', 'MOQUEGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1651, '18', '01', '02', 'CARUMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1652, '18', '01', '03', 'CUCHUMBAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1653, '18', '01', '04', 'SAMEGUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1654, '18', '01', '05', 'SAN CRISTOBAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1655, '18', '01', '06', 'TORATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1656, '18', '02', '00', 'GENERAL SANCHEZ CERRO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1657, '18', '02', '01', 'OMATE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1658, '18', '02', '02', 'CHOJATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1659, '18', '02', '03', 'COALAQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1660, '18', '02', '04', 'ICHUÃ‘A', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1661, '18', '02', '05', 'LA CAPILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1662, '18', '02', '06', 'LLOQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1663, '18', '02', '07', 'MATALAQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1664, '18', '02', '08', 'PUQUINA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1665, '18', '02', '09', 'QUINISTAQUILLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1666, '18', '02', '10', 'UBINAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1667, '18', '02', '11', 'YUNGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1668, '18', '03', '00', 'ILO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1669, '18', '03', '01', 'ILO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1670, '18', '03', '02', 'EL ALGARROBAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1671, '18', '03', '03', 'PACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1672, '19', '00', '00', 'PASCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1673, '19', '01', '00', 'PASCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1674, '19', '01', '01', 'CHAUPIMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1675, '19', '01', '02', 'HUACHON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1676, '19', '01', '03', 'HUARIACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1677, '19', '01', '04', 'HUAYLLAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1678, '19', '01', '05', 'NINACACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1679, '19', '01', '06', 'PALLANCHACRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1680, '19', '01', '07', 'PAUCARTAMBO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1681, '19', '01', '08', 'SAN FRANCISCO DE ASIS DE YARUSYACAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1682, '19', '01', '09', 'SIMON BOLIVAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1683, '19', '01', '10', 'TICLACAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1684, '19', '01', '11', 'TINYAHUARCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1685, '19', '01', '12', 'VICCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1686, '19', '01', '13', 'YANACANCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1687, '19', '02', '00', 'DANIEL ALCIDES CARRION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1688, '19', '02', '01', 'YANAHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1689, '19', '02', '02', 'CHACAYAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1690, '19', '02', '03', 'GOYLLARISQUIZGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1691, '19', '02', '04', 'PAUCAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1692, '19', '02', '05', 'SAN PEDRO DE PILLAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1693, '19', '02', '06', 'SANTA ANA DE TUSI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1694, '19', '02', '07', 'TAPUC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1695, '19', '02', '08', 'VILCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1696, '19', '03', '00', 'OXAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1697, '19', '03', '01', 'OXAPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1698, '19', '03', '02', 'CHONTABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1699, '19', '03', '03', 'HUANCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1700, '19', '03', '04', 'PALCAZU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1701, '19', '03', '05', 'POZUZO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1702, '19', '03', '06', 'PUERTO BERMUDEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1703, '19', '03', '07', 'VILLA RICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1704, '19', '03', '08', 'CONSTITUCION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1705, '20', '00', '00', 'PIURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1706, '20', '01', '00', 'PIURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1707, '20', '01', '01', 'PIURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1708, '20', '01', '04', 'CASTILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1709, '20', '01', '05', 'CATACAOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1710, '20', '01', '07', 'CURA MORI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1711, '20', '01', '08', 'EL TALLAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1712, '20', '01', '09', 'LA ARENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1713, '20', '01', '10', 'LA UNION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1714, '20', '01', '11', 'LAS LOMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1715, '20', '01', '14', 'TAMBO GRANDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1716, '20', '02', '00', 'AYABACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1717, '20', '02', '01', 'AYABACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1718, '20', '02', '02', 'FRIAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1719, '20', '02', '03', 'JILILI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1720, '20', '02', '04', 'LAGUNAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1721, '20', '02', '05', 'MONTERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1722, '20', '02', '06', 'PACAIPAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1723, '20', '02', '07', 'PAIMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1724, '20', '02', '08', 'SAPILLICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1725, '20', '02', '09', 'SICCHEZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1726, '20', '02', '10', 'SUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1727, '20', '03', '00', 'HUANCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1728, '20', '03', '01', 'HUANCABAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1729, '20', '03', '02', 'CANCHAQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1730, '20', '03', '03', 'EL CARMEN DE LA FRONTERA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1731, '20', '03', '04', 'HUARMACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1732, '20', '03', '05', 'LALAQUIZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1733, '20', '03', '06', 'SAN MIGUEL DE EL FAIQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1734, '20', '03', '07', 'SONDOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1735, '20', '03', '08', 'SONDORILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1736, '20', '04', '00', 'MORROPON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1737, '20', '04', '01', 'CHULUCANAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1738, '20', '04', '02', 'BUENOS AIRES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1739, '20', '04', '03', 'CHALACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1740, '20', '04', '04', 'LA MATANZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1741, '20', '04', '05', 'MORROPON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1742, '20', '04', '06', 'SALITRAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1743, '20', '04', '07', 'SAN JUAN DE BIGOTE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1744, '20', '04', '08', 'SANTA CATALINA DE MOSSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1745, '20', '04', '09', 'SANTO DOMINGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1746, '20', '04', '10', 'YAMANGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1747, '20', '05', '00', 'PAITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1748, '20', '05', '01', 'PAITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1749, '20', '05', '02', 'AMOTAPE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1750, '20', '05', '03', 'ARENAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1751, '20', '05', '04', 'COLAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1752, '20', '05', '05', 'LA HUACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1753, '20', '05', '06', 'TAMARINDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1754, '20', '05', '07', 'VICHAYAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1755, '20', '06', '00', 'SULLANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1756, '20', '06', '01', 'SULLANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1757, '20', '06', '02', 'BELLAVISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1758, '20', '06', '03', 'IGNACIO ESCUDERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1759, '20', '06', '04', 'LANCONES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1760, '20', '06', '05', 'MARCAVELICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1761, '20', '06', '06', 'MIGUEL CHECA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1762, '20', '06', '07', 'QUERECOTILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1763, '20', '06', '08', 'SALITRAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1764, '20', '07', '00', 'TALARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1765, '20', '07', '01', 'PARIÃ‘AS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1766, '20', '07', '02', 'EL ALTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1767, '20', '07', '03', 'LA BREA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1768, '20', '07', '04', 'LOBITOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1769, '20', '07', '05', 'LOS ORGANOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1770, '20', '07', '06', 'MANCORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1771, '20', '08', '00', 'SECHURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1772, '20', '08', '01', 'SECHURA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1773, '20', '08', '02', 'BELLAVISTA DE LA UNION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1774, '20', '08', '03', 'BERNAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1775, '20', '08', '04', 'CRISTO NOS VALGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1776, '20', '08', '05', 'VICE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1777, '20', '08', '06', 'RINCONADA LLICUAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1778, '21', '00', '00', 'PUNO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1779, '21', '01', '00', 'PUNO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1780, '21', '01', '01', 'PUNO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1781, '21', '01', '02', 'ACORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1782, '21', '01', '03', 'AMANTANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1783, '21', '01', '04', 'ATUNCOLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1784, '21', '01', '05', 'CAPACHICA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1785, '21', '01', '06', 'CHUCUITO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1786, '21', '01', '07', 'COATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1787, '21', '01', '08', 'HUATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1788, '21', '01', '09', 'MAÃ‘AZO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1789, '21', '01', '10', 'PAUCARCOLLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1790, '21', '01', '11', 'PICHACANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1791, '21', '01', '12', 'PLATERIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1792, '21', '01', '13', 'SAN ANTONIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1793, '21', '01', '14', 'TIQUILLACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1794, '21', '01', '15', 'VILQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1795, '21', '02', '00', 'AZANGARO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1796, '21', '02', '01', 'AZANGARO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1797, '21', '02', '02', 'ACHAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1798, '21', '02', '03', 'ARAPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1799, '21', '02', '04', 'ASILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1800, '21', '02', '05', 'CAMINACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1801, '21', '02', '06', 'CHUPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1802, '21', '02', '07', 'JOSE DOMINGO CHOQUEHUANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1803, '21', '02', '08', 'MUÃ‘ANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1804, '21', '02', '09', 'POTONI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1805, '21', '02', '10', 'SAMAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1806, '21', '02', '11', 'SAN ANTON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1807, '21', '02', '12', 'SAN JOSE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1808, '21', '02', '13', 'SAN JUAN DE SALINAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1809, '21', '02', '14', 'SANTIAGO DE PUPUJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1810, '21', '02', '15', 'TIRAPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1811, '21', '03', '00', 'CARABAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1812, '21', '03', '01', 'MACUSANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1813, '21', '03', '02', 'AJOYANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1814, '21', '03', '03', 'AYAPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1815, '21', '03', '04', 'COASA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1816, '21', '03', '05', 'CORANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1817, '21', '03', '06', 'CRUCERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1818, '21', '03', '07', 'ITUATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1819, '21', '03', '08', 'OLLACHEA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1820, '21', '03', '09', 'SAN GABAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1821, '21', '03', '10', 'USICAYOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1822, '21', '04', '00', 'CHUCUITO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1823, '21', '04', '01', 'JULI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1824, '21', '04', '02', 'DESAGUADERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1825, '21', '04', '03', 'HUACULLANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1826, '21', '04', '04', 'KELLUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1827, '21', '04', '05', 'PISACOMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1828, '21', '04', '06', 'POMATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1829, '21', '04', '07', 'ZEPITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1830, '21', '05', '00', 'EL COLLAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1831, '21', '05', '01', 'ILAVE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1832, '21', '05', '02', 'CAPAZO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1833, '21', '05', '03', 'PILCUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1834, '21', '05', '04', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1835, '21', '05', '05', 'CONDURIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1836, '21', '06', '00', 'HUANCANE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1837, '21', '06', '01', 'HUANCANE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1838, '21', '06', '02', 'COJATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1839, '21', '06', '03', 'HUATASANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1840, '21', '06', '04', 'INCHUPALLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1841, '21', '06', '05', 'PUSI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1842, '21', '06', '06', 'ROSASPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1843, '21', '06', '07', 'TARACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1844, '21', '06', '08', 'VILQUE CHICO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1845, '21', '07', '00', 'LAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1846, '21', '07', '01', 'LAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1847, '21', '07', '02', 'CABANILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1848, '21', '07', '03', 'CALAPUJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1849, '21', '07', '04', 'NICASIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1850, '21', '07', '05', 'OCUVIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1851, '21', '07', '06', 'PALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1852, '21', '07', '07', 'PARATIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1853, '21', '07', '08', 'PUCARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1854, '21', '07', '09', 'SANTA LUCIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1855, '21', '07', '10', 'VILAVILA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1856, '21', '08', '00', 'MELGAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1857, '21', '08', '01', 'AYAVIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1858, '21', '08', '02', 'ANTAUTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1859, '21', '08', '03', 'CUPI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1860, '21', '08', '04', 'LLALLI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1861, '21', '08', '05', 'MACARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1862, '21', '08', '06', 'NUÃ‘OA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1863, '21', '08', '07', 'ORURILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1864, '21', '08', '08', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1865, '21', '08', '09', 'UMACHIRI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1866, '21', '09', '00', 'MOHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1867, '21', '09', '01', 'MOHO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1868, '21', '09', '02', 'CONIMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1869, '21', '09', '03', 'HUAYRAPATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1870, '21', '09', '04', 'TILALI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1871, '21', '10', '00', 'SAN ANTONIO DE PUTINA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1872, '21', '10', '01', 'PUTINA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1873, '21', '10', '02', 'ANANEA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1874, '21', '10', '03', 'PEDRO VILCA APAZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1875, '21', '10', '04', 'QUILCAPUNCU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1876, '21', '10', '05', 'SINA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1877, '21', '11', '00', 'SAN ROMAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1878, '21', '11', '01', 'JULIACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1879, '21', '11', '02', 'CABANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1880, '21', '11', '03', 'CABANILLAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1881, '21', '11', '04', 'CARACOTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1882, '21', '12', '00', 'SANDIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1883, '21', '12', '01', 'SANDIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1884, '21', '12', '02', 'CUYOCUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1885, '21', '12', '03', 'LIMBANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1886, '21', '12', '04', 'PATAMBUCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1887, '21', '12', '05', 'PHARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1888, '21', '12', '06', 'QUIACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1889, '21', '12', '07', 'SAN JUAN DEL ORO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1890, '21', '12', '08', 'YANAHUAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1891, '21', '12', '09', 'ALTO INAMBARI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1892, '21', '12', '10', 'SAN PEDRO DE PUTINA PUNCO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1893, '21', '13', '00', 'YUNGUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1894, '21', '13', '01', 'YUNGUYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1895, '21', '13', '02', 'ANAPIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1896, '21', '13', '03', 'COPANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1897, '21', '13', '04', 'CUTURAPI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1898, '21', '13', '05', 'OLLARAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1899, '21', '13', '06', 'TINICACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1900, '21', '13', '07', 'UNICACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1901, '22', '00', '00', 'SAN MARTIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1902, '22', '01', '00', 'MOYOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1903, '22', '01', '01', 'MOYOBAMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1904, '22', '01', '02', 'CALZADA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1905, '22', '01', '03', 'HABANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1906, '22', '01', '04', 'JEPELACIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1907, '22', '01', '05', 'SORITOR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1908, '22', '01', '06', 'YANTALO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1909, '22', '02', '00', 'BELLAVISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1910, '22', '02', '01', 'BELLAVISTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1911, '22', '02', '02', 'ALTO BIAVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1912, '22', '02', '03', 'BAJO BIAVO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1913, '22', '02', '04', 'HUALLAGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1914, '22', '02', '05', 'SAN PABLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1915, '22', '02', '06', 'SAN RAFAEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1916, '22', '03', '00', 'EL DORADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1917, '22', '03', '01', 'SAN JOSE DE SISA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1918, '22', '03', '02', 'AGUA BLANCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1919, '22', '03', '03', 'SAN MARTIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1920, '22', '03', '04', 'SANTA ROSA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1921, '22', '03', '05', 'SHATOJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1922, '22', '04', '00', 'HUALLAGA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1923, '22', '04', '01', 'SAPOSOA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1924, '22', '04', '02', 'ALTO SAPOSOA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1925, '22', '04', '03', 'EL ESLABON', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1926, '22', '04', '04', 'PISCOYACU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1927, '22', '04', '05', 'SACANCHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1928, '22', '04', '06', 'TINGO DE SAPOSOA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1929, '22', '05', '00', 'LAMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1930, '22', '05', '01', 'LAMAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1931, '22', '05', '02', 'ALONSO DE ALVARADO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1932, '22', '05', '03', 'BARRANQUITA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1933, '22', '05', '04', 'CAYNARACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1934, '22', '05', '05', 'CUÃ‘UMBUQUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1935, '22', '05', '06', 'PINTO RECODO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1936, '22', '05', '07', 'RUMISAPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1937, '22', '05', '08', 'SAN ROQUE DE CUMBAZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1938, '22', '05', '09', 'SHANAO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1939, '22', '05', '10', 'TABALOSOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1940, '22', '05', '11', 'ZAPATERO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1941, '22', '06', '00', 'MARISCAL CACERES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1942, '22', '06', '01', 'JUANJUI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1943, '22', '06', '02', 'CAMPANILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1944, '22', '06', '03', 'HUICUNGO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1945, '22', '06', '04', 'PACHIZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1946, '22', '06', '05', 'PAJARILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1947, '22', '07', '00', 'PICOTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1948, '22', '07', '01', 'PICOTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1949, '22', '07', '02', 'BUENOS AIRES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1950, '22', '07', '03', 'CASPISAPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1951, '22', '07', '04', 'PILLUANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1952, '22', '07', '05', 'PUCACACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1953, '22', '07', '06', 'SAN CRISTOBAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1954, '22', '07', '07', 'SAN HILARION', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1955, '22', '07', '08', 'SHAMBOYACU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1956, '22', '07', '09', 'TINGO DE PONASA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1957, '22', '07', '10', 'TRES UNIDOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1958, '22', '08', '00', 'RIOJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1959, '22', '08', '01', 'RIOJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1960, '22', '08', '02', 'AWAJUN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1961, '22', '08', '03', 'ELIAS SOPLIN VARGAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1962, '22', '08', '04', 'NUEVA CAJAMARCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1963, '22', '08', '05', 'PARDO MIGUEL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1964, '22', '08', '06', 'POSIC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1965, '22', '08', '07', 'SAN FERNANDO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1966, '22', '08', '08', 'YORONGOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1967, '22', '08', '09', 'YURACYACU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1968, '22', '09', '00', 'SAN MARTIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1969, '22', '09', '01', 'TARAPOTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1970, '22', '09', '02', 'ALBERTO LEVEAU', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1971, '22', '09', '03', 'CACATACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1972, '22', '09', '04', 'CHAZUTA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1973, '22', '09', '05', 'CHIPURANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1974, '22', '09', '06', 'EL PORVENIR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1975, '22', '09', '07', 'HUIMBAYOC', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1976, '22', '09', '08', 'JUAN GUERRA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1977, '22', '09', '09', 'LA BANDA DE SHILCAYO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1978, '22', '09', '10', 'MORALES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1979, '22', '09', '11', 'PAPAPLAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1980, '22', '09', '12', 'SAN ANTONIO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1981, '22', '09', '13', 'SAUCE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1982, '22', '09', '14', 'SHAPAJA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1983, '22', '10', '00', 'TOCACHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1984, '22', '10', '01', 'TOCACHE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1985, '22', '10', '02', 'NUEVO PROGRESO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1986, '22', '10', '03', 'POLVORA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1987, '22', '10', '04', 'SHUNTE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1988, '22', '10', '05', 'UCHIZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1989, '23', '00', '00', 'TACNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1990, '23', '01', '00', 'TACNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1991, '23', '01', '01', 'TACNA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1992, '23', '01', '02', 'ALTO DE LA ALIANZA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1993, '23', '01', '03', 'CALANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1994, '23', '01', '04', 'CIUDAD NUEVA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1995, '23', '01', '05', 'INCLAN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1996, '23', '01', '06', 'PACHIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1997, '23', '01', '07', 'PALCA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1998, '23', '01', '08', 'POCOLLAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (1999, '23', '01', '09', 'SAMA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2000, '23', '01', '10', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2001, '23', '02', '00', 'CANDARAVE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2002, '23', '02', '01', 'CANDARAVE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2003, '23', '02', '02', 'CAIRANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2004, '23', '02', '03', 'CAMILACA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2005, '23', '02', '04', 'CURIBAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2006, '23', '02', '05', 'HUANUARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2007, '23', '02', '06', 'QUILAHUANI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2008, '23', '03', '00', 'JORGE BASADRE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2009, '23', '03', '01', 'LOCUMBA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2010, '23', '03', '02', 'ILABAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2011, '23', '03', '03', 'ITE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2012, '23', '04', '00', 'TARATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2013, '23', '04', '01', 'TARATA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2014, '23', '04', '02', 'HEROES ALBARRACIN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2015, '23', '04', '03', 'ESTIQUE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2016, '23', '04', '04', 'ESTIQUE-PAMPA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2017, '23', '04', '05', 'SITAJARA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2018, '23', '04', '06', 'SUSAPAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2019, '23', '04', '07', 'TARUCACHI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2020, '23', '04', '08', 'TICACO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2021, '24', '00', '00', 'TUMBES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2022, '24', '01', '00', 'TUMBES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2023, '24', '01', '01', 'TUMBES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2024, '24', '01', '02', 'CORRALES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2025, '24', '01', '03', 'LA CRUZ', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2026, '24', '01', '04', 'PAMPAS DE HOSPITAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2027, '24', '01', '05', 'SAN JACINTO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2028, '24', '01', '06', 'SAN JUAN DE LA VIRGEN', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2029, '24', '02', '00', 'CONTRALMIRANTE VILLAR', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2030, '24', '02', '01', 'ZORRITOS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2031, '24', '02', '02', 'CASITAS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2032, '24', '02', '03', 'CANOAS DE PUNTA SAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2033, '24', '03', '00', 'ZARUMILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2034, '24', '03', '01', 'ZARUMILLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2035, '24', '03', '02', 'AGUAS VERDES', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2036, '24', '03', '03', 'MATAPALO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2037, '24', '03', '04', 'PAPAYAL', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2038, '25', '00', '00', 'UCAYALI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2039, '25', '01', '00', 'CORONEL PORTILLO', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2040, '25', '01', '01', 'CALLERIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2041, '25', '01', '02', 'CAMPOVERDE', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2042, '25', '01', '03', 'IPARIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2043, '25', '01', '04', 'MASISEA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2044, '25', '01', '05', 'YARINACOCHA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2045, '25', '01', '06', 'NUEVA REQUENA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2046, '25', '01', '07', 'MANANTAY', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2047, '25', '02', '00', 'ATALAYA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2048, '25', '02', '01', 'RAYMONDI', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2049, '25', '02', '02', 'SEPAHUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2050, '25', '02', '03', 'TAHUANIA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2051, '25', '02', '04', 'YURUA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2052, '25', '03', '00', 'PADRE ABAD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2053, '25', '03', '01', 'PADRE ABAD', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2054, '25', '03', '02', 'IRAZOLA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2055, '25', '03', '03', 'CURIMANA', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2056, '25', '04', '00', 'PURUS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2057, '25', '04', '01', 'PURUS', 193);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2058, '', '', '', 'BOUVET ISLAND', 1);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2059, '', '', '', 'COTE D IVOIRE', 2);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2060, '', '', '', 'FALKLAND ISLANDS (MA', 3);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2061, '', '', '', 'FRANCE, METROPOLITAN', 4);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2062, '', '', '', 'FRENCH SOUTHERN TERR', 5);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2063, '', '', '', 'HEARD AND MC DONALD ', 6);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2064, '', '', '', 'MAYOTTE', 7);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2065, '', '', '', 'SOUTH GEORGIA AND TH', 8);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2066, '', '', '', 'SVALBARD AND JAN MAY', 9);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2067, '', '', '', 'UNITED STATES MINOR ', 10);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2068, '', '', '', 'OTROS PAISES O LUGAR', 11);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2069, '', '', '', 'AFGANISTAN', 12);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2070, '', '', '', 'ALBANIA', 13);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2071, '', '', '', 'ALDERNEY', 14);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2072, '', '', '', 'ALEMANIA', 15);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2073, '', '', '', 'ARMENIA', 16);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2074, '', '', '', 'ARUBA', 17);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2075, '', '', '', 'ASCENCION', 18);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2076, '', '', '', 'BOSNIA-HERZEGOVINA', 19);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2077, '', '', '', 'BURKINA FASO', 20);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2078, '', '', '', 'ANDORRA', 21);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2079, '', '', '', 'ANGOLA', 22);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2080, '', '', '', 'ANGUILLA', 23);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2081, '', '', '', 'ANTIGUA Y BARBUDA', 24);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2082, '', '', '', 'ANTILLAS HOLANDESAS', 25);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2083, '', '', '', 'ARABIA SAUDITA', 26);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2084, '', '', '', 'ARGELIA', 27);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2085, '', '', '', 'ARGENTINA', 28);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2086, '', '', '', 'AUSTRALIA', 29);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2087, '', '', '', 'AUSTRIA', 30);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2088, '', '', '', 'AZERBAIJAN', 31);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2089, '', '', '', 'BAHAMAS', 32);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2090, '', '', '', 'BAHREIN', 33);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2091, '', '', '', 'BANGLADESH', 34);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2092, '', '', '', 'BARBADOS', 35);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2093, '', '', '', 'BELGICA', 36);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2094, '', '', '', 'BELICE', 37);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2095, '', '', '', 'BERMUDAS', 38);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2096, '', '', '', 'BELARUS', 39);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2097, '', '', '', 'MYANMAR', 40);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2098, '', '', '', 'BOLIVIA', 41);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2099, '', '', '', 'BOTSWANA', 42);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2100, '', '', '', 'BRASIL', 43);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2101, '', '', '', 'BRUNEI DARUSSALAM', 44);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2102, '', '', '', 'BULGARIA', 45);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2103, '', '', '', 'BURUNDI', 46);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2104, '', '', '', 'BUTAN', 47);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2105, '', '', '', 'CABO VERDE', 48);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2106, '', '', '', 'CAIMAN,ISLAS', 49);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2107, '', '', '', 'CAMBOYA', 50);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2108, '', '', '', 'CAMERUN,REPUBLICA UN', 51);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2109, '', '', '', 'CAMPIONE D TALIA', 52);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2110, '', '', '', 'CANADA', 53);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2111, '', '', '', 'CANAL (NORMANDAS), I', 54);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2112, '', '', '', 'CANTON Y ENDERBURRY', 55);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2113, '', '', '', 'SANTA SEDE', 56);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2114, '', '', '', 'COCOS (KEELING),ISLA', 57);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2115, '', '', '', 'COLOMBIA', 58);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2116, '', '', '', 'COMORAS', 59);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2117, '', '', '', 'CONGO', 60);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2118, '', '', '', 'COOK, ISLAS', 61);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2119, '', '', '', 'COREA (NORTE), REPUB', 62);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2120, '', '', '', 'COREA (SUR), REPUBLI', 63);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2121, '', '', '', 'COSTA DE MARFIL', 64);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2122, '', '', '', 'COSTA RICA', 65);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2123, '', '', '', 'CROACIA', 66);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2124, '', '', '', 'CUBA', 67);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2125, '', '', '', 'CHAD', 68);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2126, '', '', '', 'CHECOSLOVAQUIA', 69);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2127, '', '', '', 'CHILE', 70);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2128, '', '', '', 'CHINA', 71);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2129, '', '', '', 'TAIWAN (FORMOSA)', 72);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2130, '', '', '', 'CHIPRE', 73);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2131, '', '', '', 'BENIN', 74);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2132, '', '', '', 'DINAMARCA', 75);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2133, '', '', '', 'DOMINICA', 76);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2134, '', '', '', 'ECUADOR', 77);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2135, '', '', '', 'EGIPTO', 78);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2136, '', '', '', 'EL SALVADOR', 79);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2137, '', '', '', 'ERITREA', 80);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2138, '', '', '', 'EMIRATOS ARABES UNID', 81);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2139, '', '', '', 'ESPANA', 82);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2140, '', '', '', 'ESLOVAQUIA', 83);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2141, '', '', '', 'ESLOVENIA', 84);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2142, '', '', '', 'ESTADOS UNIDOS', 85);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2143, '', '', '', 'ESTONIA', 86);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2144, '', '', '', 'ETIOPIA', 87);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2145, '', '', '', 'FEROE, ISLAS', 88);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2146, '', '', '', 'FILIPINAS', 89);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2147, '', '', '', 'FINLANDIA', 90);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2148, '', '', '', 'FRANCIA', 91);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2149, '', '', '', 'GABON', 92);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2150, '', '', '', 'GAMBIA', 93);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2151, '', '', '', 'GAZA Y JERICO', 94);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2152, '', '', '', 'GEORGIA', 95);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2153, '', '', '', 'GHANA', 96);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2154, '', '', '', 'GIBRALTAR', 97);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2155, '', '', '', 'GRANADA', 98);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2156, '', '', '', 'GRECIA', 99);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2157, '', '', '', 'GROENLANDIA', 100);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2158, '', '', '', 'GUADALUPE', 101);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2159, '', '', '', 'GUAM', 102);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2160, '', '', '', 'GUATEMALA', 103);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2161, '', '', '', 'GUAYANA FRANCESA', 104);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2162, '', '', '', 'GUERNSEY', 105);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2163, '', '', '', 'GUINEA', 106);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2164, '', '', '', 'GUINEA ECUATORIAL', 107);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2165, '', '', '', 'GUINEA-BISSAU', 108);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2166, '', '', '', 'GUYANA', 109);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2167, '', '', '', 'HAITI', 110);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2168, '', '', '', 'HONDURAS', 111);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2169, '', '', '', 'HONDURAS BRITANICAS', 112);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2170, '', '', '', 'HONG KONG', 113);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2171, '', '', '', 'HUNGRIA', 114);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2172, '', '', '', 'INDIA', 115);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2173, '', '', '', 'INDONESIA', 116);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2174, '', '', '', 'IRAK', 117);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2175, '', '', '', 'IRAN, REPUBLICA ISLA', 118);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2176, '', '', '', 'IRLANDA (EIRE)', 119);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2177, '', '', '', 'ISLA AZORES', 120);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2178, '', '', '', 'ISLA DEL MAN', 121);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2179, '', '', '', 'ISLANDIA', 122);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2180, '', '', '', 'ISLAS CANARIAS', 123);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2181, '', '', '', 'ISLAS DE CHRISTMAS', 124);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2182, '', '', '', 'ISLAS QESHM', 125);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2183, '', '', '', 'ISRAEL', 126);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2184, '', '', '', 'ITALIA', 127);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2185, '', '', '', 'JAMAICA', 128);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2186, '', '', '', 'JONSTON, ISLAS', 129);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2187, '', '', '', 'JAPON', 130);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2188, '', '', '', 'JERSEY', 131);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2189, '', '', '', 'JORDANIA', 132);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2190, '', '', '', 'KAZAJSTAN', 133);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2191, '', '', '', 'KENIA', 134);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2192, '', '', '', 'KIRIBATI', 135);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2193, '', '', '', 'KIRGUIZISTAN', 136);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2194, '', '', '', 'KUWAIT', 137);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2195, '', '', '', 'LABUN', 138);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2196, '', '', '', 'LAOS, REPUBLICA POPU', 139);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2197, '', '', '', 'LESOTHO', 140);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2198, '', '', '', 'LETONIA', 141);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2199, '', '', '', 'LIBANO', 142);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2200, '', '', '', 'LIBERIA', 143);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2201, '', '', '', 'LIBIA', 144);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2202, '', '', '', 'LIECHTENSTEIN', 145);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2203, '', '', '', 'LITUANIA', 146);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2204, '', '', '', 'LUXEMBURGO', 147);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2205, '', '', '', 'MACAO', 148);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2206, '', '', '', 'MACEDONIA', 149);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2207, '', '', '', 'MADAGASCAR', 150);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2208, '', '', '', 'MADEIRA', 151);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2209, '', '', '', 'MALAYSIA', 152);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2210, '', '', '', 'MALAWI', 153);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2211, '', '', '', 'MALDIVAS', 154);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2212, '', '', '', 'MALI', 155);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2213, '', '', '', 'MALTA', 156);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2214, '', '', '', 'MARIANAS DEL NORTE, ', 157);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2215, '', '', '', 'MARSHALL, ISLAS', 158);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2216, '', '', '', 'MARRUECOS', 159);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2217, '', '', '', 'MARTINICA', 160);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2218, '', '', '', 'MAURICIO', 161);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2219, '', '', '', 'MAURITANIA', 162);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2220, '', '', '', 'MEXICO', 163);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2221, '', '', '', 'MICRONESIA, ESTADOS ', 164);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2222, '', '', '', 'MIDWAY ISLAS', 165);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2223, '', '', '', 'MOLDAVIA', 166);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2224, '', '', '', 'MONGOLIA', 167);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2225, '', '', '', 'MONACO', 168);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2226, '', '', '', 'MONTSERRAT, ISLA', 169);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2227, '', '', '', 'MOZAMBIQUE', 170);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2228, '', '', '', 'NAMIBIA', 171);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2229, '', '', '', 'NAURU', 172);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2230, '', '', '', 'NAVIDAD (CHRISTMAS),', 173);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2231, '', '', '', 'NEPAL', 174);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2232, '', '', '', 'NICARAGUA', 175);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2233, '', '', '', 'NIGER', 176);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2234, '', '', '', 'NIGERIA', 177);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2235, '', '', '', 'NIUE, ISLA', 178);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2236, '', '', '', 'NORFOLK, ISLA', 179);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2237, '', '', '', 'NORUEGA', 180);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2238, '', '', '', 'NUEVA CALEDONIA', 181);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2239, '', '', '', 'PAPUASIA NUEVA GUINE', 182);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2240, '', '', '', 'NUEVA ZELANDA', 183);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2241, '', '', '', 'VANUATU', 184);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2242, '', '', '', 'OMAN', 185);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2243, '', '', '', 'PACIFICO, ISLAS DEL', 186);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2244, '', '', '', 'PAISES BAJOS', 187);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2245, '', '', '', 'PAKISTAN', 188);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2246, '', '', '', 'PALAU, ISLAS', 189);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2247, '', '', '', 'TERRITORIO AUTONOMO ', 190);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2248, '', '', '', 'PANAMA', 191);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2249, '', '', '', 'PARAGUAY', 192);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2251, '', '', '', 'PITCAIRN, ISLA', 194);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2252, '', '', '', 'POLINESIA FRANCESA', 195);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2253, '', '', '', 'POLONIA', 196);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2254, '', '', '', 'PORTUGAL', 197);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2255, '', '', '', 'PUERTO RICO', 198);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2256, '', '', '', 'QATAR', 199);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2257, '', '', '', 'REINO UNIDO', 200);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2258, '', '', '', 'ESCOCIA', 201);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2259, '', '', '', 'REPUBLICA ARABE UNID', 202);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2260, '', '', '', 'REPUBLICA CENTROAFRI', 203);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2261, '', '', '', 'REPUBLICA CHECA', 204);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2262, '', '', '', 'REPUBLICA DE SWAZILA', 205);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2263, '', '', '', 'REPUBLICA DE TUNEZ', 206);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2264, '', '', '', 'REPUBLICA DOMINICANA', 207);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2265, '', '', '', 'REUNION', 208);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2266, '', '', '', 'ZIMBABWE', 209);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2267, '', '', '', 'RUMANIA', 210);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2268, '', '', '', 'RUANDA', 211);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2269, '', '', '', 'RUSIA', 212);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2270, '', '', '', 'SALOMON, ISLAS', 213);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2271, '', '', '', 'SAHARA OCCIDENTAL', 214);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2272, '', '', '', 'SAMOA OCCIDENTAL', 215);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2273, '', '', '', 'SAMOA NORTEAMERICANA', 216);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2274, '', '', '', 'SAN CRISTOBAL Y NIEV', 217);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2275, '', '', '', 'SAN MARINO', 218);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2276, '', '', '', 'SAN PEDRO Y MIQUELON', 219);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2277, '', '', '', 'SAN VICENTE Y LAS GR', 220);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2278, '', '', '', 'SANTA ELENA', 221);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2279, '', '', '', 'SANTA LUCIA', 222);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2280, '', '', '', 'SANTO TOME Y PRINCIP', 223);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2281, '', '', '', 'SENEGAL', 224);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2282, '', '', '', 'SEYCHELLES', 225);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2283, '', '', '', 'SIERRA LEONA', 226);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2284, '', '', '', 'SINGAPUR', 227);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2285, '', '', '', 'SIRIA, REPUBLICA ARA', 228);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2286, '', '', '', 'SOMALIA', 229);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2287, '', '', '', 'SRI LANKA', 230);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2288, '', '', '', 'SUDAFRICA, REPUBLICA', 231);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2289, '', '', '', 'SUDAN', 232);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2290, '', '', '', 'SUECIA', 233);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2291, '', '', '', 'SUIZA', 234);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2292, '', '', '', 'SURINAM', 235);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2293, '', '', '', 'SAWSILANDIA', 236);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2294, '', '', '', 'TADJIKISTAN', 237);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2295, '', '', '', 'TAILANDIA', 238);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2296, '', '', '', 'TANZANIA, REPUBLICA ', 239);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2297, '', '', '', 'DJIBOUTI', 240);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2298, '', '', '', 'TERRITORIO ANTARTICO', 241);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2299, '', '', '', 'TERRITORIO BRITANICO', 242);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2300, '', '', '', 'TIMOR DEL ESTE', 243);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2301, '', '', '', 'TOGO', 244);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2302, '', '', '', 'TOKELAU', 245);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2303, '', '', '', 'TONGA', 246);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2304, '', '', '', 'TRINIDAD Y TOBAGO', 247);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2305, '', '', '', 'TRISTAN DA CUNHA', 248);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2306, '', '', '', 'TUNICIA', 249);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2307, '', '', '', 'TURCAS Y CAICOS, ISL', 250);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2308, '', '', '', 'TURKMENISTAN', 251);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2309, '', '', '', 'TURQUIA', 252);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2310, '', '', '', 'TUVALU', 253);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2311, '', '', '', 'UCRANIA', 254);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2312, '', '', '', 'UGANDA', 255);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2313, '', '', '', 'URSS', 256);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2314, '', '', '', 'URUGUAY', 257);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2315, '', '', '', 'UZBEKISTAN', 258);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2316, '', '', '', 'VENEZUELA', 259);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2317, '', '', '', 'VIET NAM', 260);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2318, '', '', '', 'VIETNAM (DEL NORTE)', 261);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2319, '', '', '', 'VIRGENES, ISLAS (BRI', 262);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2320, '', '', '', 'VIRGENES, ISLAS (NOR', 263);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2321, '', '', '', 'FIJI', 264);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2322, '', '', '', 'WAKE, ISLA', 265);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2323, '', '', '', 'WALLIS Y FORTUNA, IS', 266);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2324, '', '', '', 'YEMEN', 267);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2325, '', '', '', 'YUGOSLAVIA', 268);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2326, '', '', '', 'ZAIRE', 269);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2327, '', '', '', 'ZAMBIA', 270);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2328, '', '', '', 'ZONA DEL CANAL DE PA', 271);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2329, '', '', '', 'ZONA LIBRE OSTRAVA', 272);
INSERT INTO ubigeos (idubigeo, codigo_region, codigo_provincia, codigo_distrito, descripcion, idpais) VALUES (2330, '', '', '', 'ZONA NEUTRAL (PALEST', 273);


--
-- TOC entry 2578 (class 0 OID 873976)
-- Dependencies: 180
-- Data for Name: unidadmedida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (1, 'UNIDAD', 'UNID', 1, 1, 0);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (3, 'SACO 50', 'SAC50', 1, 50, 2);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (6, 'PAQUETE 12', 'PAQ12', 1, 12, 1);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (8, 'PAQUETE 9', 'PAQ9', 1, 9, 1);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (2, 'KILOGRAMO', 'KG', 1, 1, 0);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (0, 'UNIDAD BASE', 'UB', 0, 0, 0);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (5, 'SACO 30', 'SAC30', 1, 30, 2);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (4, 'PAQUETE 15', 'PAQ15', 1, 15, 1);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (10, 'CAJA 12', 'CAJ12', 1, 12, 1);
INSERT INTO unidadmedida (id_unidadmedida, descripcion, prefijo, estado, cant_unidad, equivalenteunidad) VALUES (11, 'BLISTER6', 'BLIST6', 1, 6, 1);


--
-- TOC entry 2604 (class 0 OID 874118)
-- Dependencies: 229
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO venta (id_venta, idcliente, id_empleado, id_tipopago, fechaventa, estado, subtotal, igv, id_tipocomprobante, nrodoc, estadopago, id_almacen) VALUES (30, 2, 2, 1, '2013-11-21 12:20:25', 1, 30.00, 0.00, 1, '001-0000011', '2', 1);
INSERT INTO venta (id_venta, idcliente, id_empleado, id_tipopago, fechaventa, estado, subtotal, igv, id_tipocomprobante, nrodoc, estadopago, id_almacen) VALUES (31, 1, 2, 1, '2013-11-21 12:32:01', 1, 15.00, 0.00, 1, '001-0000012', '2', 1);
INSERT INTO venta (id_venta, idcliente, id_empleado, id_tipopago, fechaventa, estado, subtotal, igv, id_tipocomprobante, nrodoc, estadopago, id_almacen) VALUES (32, 2, 2, 1, '2013-11-21 18:30:14', 1, 6.00, 0.00, 1, '001-0000013', '2', 1);


--
-- TOC entry 2358 (class 2606 OID 874148)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2330 (class 2606 OID 874150)
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 2391 (class 2606 OID 874152)
-- Name: paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (idpais);


--
-- TOC entry 2332 (class 2606 OID 874154)
-- Name: perfil_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfil_key PRIMARY KEY (id_perfil);


--
-- TOC entry 2393 (class 2606 OID 874156)
-- Name: permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id_perfil, idmodulo);


--
-- TOC entry 2353 (class 2606 OID 874158)
-- Name: pk_almacen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT pk_almacen PRIMARY KEY (id_almacen);


--
-- TOC entry 2356 (class 2606 OID 874160)
-- Name: pk_caja; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caja
    ADD CONSTRAINT pk_caja PRIMARY KEY (id_caja);


--
-- TOC entry 2334 (class 2606 OID 874162)
-- Name: pk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (id_categoria);


--
-- TOC entry 2360 (class 2606 OID 874164)
-- Name: pk_compra; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT pk_compra PRIMARY KEY (id_compra);


--
-- TOC entry 2362 (class 2606 OID 874166)
-- Name: pk_concepto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (id_concepto);


--
-- TOC entry 2364 (class 2606 OID 874168)
-- Name: pk_cronogcobro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cronogcobro
    ADD CONSTRAINT pk_cronogcobro PRIMARY KEY (id_cronogcobro);


--
-- TOC entry 2366 (class 2606 OID 874170)
-- Name: pk_cronogpago; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cronogpago
    ADD CONSTRAINT pk_cronogpago PRIMARY KEY (id_cronogpago);


--
-- TOC entry 2368 (class 2606 OID 874172)
-- Name: pk_detamortizacioncobro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detamortizacioncobro
    ADD CONSTRAINT pk_detamortizacioncobro PRIMARY KEY (id_movimiento, id_cronogcobro);


--
-- TOC entry 2370 (class 2606 OID 874174)
-- Name: pk_detamortizacionpago; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detamortizacionpago
    ADD CONSTRAINT pk_detamortizacionpago PRIMARY KEY (id_cronogpago, id_movimiento);


--
-- TOC entry 2373 (class 2606 OID 874176)
-- Name: pk_detcompraproducto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detcompraproducto
    ADD CONSTRAINT pk_detcompraproducto PRIMARY KEY (id_compra, id_producto);


--
-- TOC entry 2375 (class 2606 OID 874178)
-- Name: pk_detprodalm; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detprodalm
    ADD CONSTRAINT pk_detprodalm PRIMARY KEY (id_almacen, id_producto);


--
-- TOC entry 2377 (class 2606 OID 874180)
-- Name: pk_detproductounidmedida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detproductounidmedida
    ADD CONSTRAINT pk_detproductounidmedida PRIMARY KEY (id_unidadmedida, id_producto);


--
-- TOC entry 2381 (class 2606 OID 874182)
-- Name: pk_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT pk_empleado PRIMARY KEY (id_empleado);


--
-- TOC entry 2383 (class 2606 OID 874184)
-- Name: pk_formapago; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formapago
    ADD CONSTRAINT pk_formapago PRIMARY KEY (id_formapago);


--
-- TOC entry 2328 (class 2606 OID 874186)
-- Name: pk_informacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY informacion
    ADD CONSTRAINT pk_informacion PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 874188)
-- Name: pk_kardex; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex_producto
    ADD CONSTRAINT pk_kardex PRIMARY KEY (id_kardex);


--
-- TOC entry 2336 (class 2606 OID 874190)
-- Name: pk_marca; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (id_marca);


--
-- TOC entry 2415 (class 2606 OID 876102)
-- Name: pk_marcas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY marcas
    ADD CONSTRAINT pk_marcas PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 876152)
-- Name: pk_motivomovimiento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY motivomovimiento
    ADD CONSTRAINT pk_motivomovimiento PRIMARY KEY (id_motivomovimiento);


--
-- TOC entry 2389 (class 2606 OID 874192)
-- Name: pk_movimiento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT pk_movimiento PRIMARY KEY (id_movimiento);


--
-- TOC entry 2338 (class 2606 OID 874194)
-- Name: pk_param; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY param
    ADD CONSTRAINT pk_param PRIMARY KEY (id_param);


--
-- TOC entry 2397 (class 2606 OID 874196)
-- Name: pk_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT pk_producto PRIMARY KEY (id_producto);


--
-- TOC entry 2342 (class 2606 OID 874198)
-- Name: pk_proveedor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor);


--
-- TOC entry 2400 (class 2606 OID 874200)
-- Name: pk_seriecomprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY seriecomprobante
    ADD CONSTRAINT pk_seriecomprobante PRIMARY KEY (id_seriecomprobante);


--
-- TOC entry 2402 (class 2606 OID 874202)
-- Name: pk_subcategoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subcategoria
    ADD CONSTRAINT pk_subcategoria PRIMARY KEY (id_subcategoria);


--
-- TOC entry 2346 (class 2606 OID 874204)
-- Name: pk_sucursal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal);


--
-- TOC entry 2404 (class 2606 OID 874206)
-- Name: pk_tipocliente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipocliente
    ADD CONSTRAINT pk_tipocliente PRIMARY KEY (id_tipocliente);


--
-- TOC entry 2406 (class 2606 OID 874208)
-- Name: pk_tipocomprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipocomprobante
    ADD CONSTRAINT pk_tipocomprobante PRIMARY KEY (id_tipocomprobante);


--
-- TOC entry 2348 (class 2606 OID 874210)
-- Name: pk_tipoconcepto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoconcepto
    ADD CONSTRAINT pk_tipoconcepto PRIMARY KEY (id_tipoconcepto);


--
-- TOC entry 2417 (class 2606 OID 876144)
-- Name: pk_tipomovimiento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipomovimiento
    ADD CONSTRAINT pk_tipomovimiento PRIMARY KEY (id_tipomovimiento);


--
-- TOC entry 2408 (class 2606 OID 874212)
-- Name: pk_tipopago; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipopago
    ADD CONSTRAINT pk_tipopago PRIMARY KEY (id_tipopago);


--
-- TOC entry 2350 (class 2606 OID 874214)
-- Name: pk_unidadmedida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidadmedida
    ADD CONSTRAINT pk_unidadmedida PRIMARY KEY (id_unidadmedida);


--
-- TOC entry 2413 (class 2606 OID 874216)
-- Name: pk_venta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT pk_venta PRIMARY KEY (id_venta);


--
-- TOC entry 2326 (class 2606 OID 874218)
-- Name: productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 874220)
-- Name: profesiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profesiones
    ADD CONSTRAINT profesiones_pkey PRIMARY KEY (idprofesion);


--
-- TOC entry 2344 (class 2606 OID 874222)
-- Name: ubigeos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ubigeos
    ADD CONSTRAINT ubigeos_pkey PRIMARY KEY (idubigeo);


--
-- TOC entry 2384 (class 1259 OID 874223)
-- Name: fki_almacen_kardex_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_almacen_kardex_producto ON kardex_producto USING btree (id_almacen);


--
-- TOC entry 2409 (class 1259 OID 874224)
-- Name: fki_almacen_venta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_almacen_venta ON venta USING btree (id_almacen);


--
-- TOC entry 2385 (class 1259 OID 876168)
-- Name: fki_motivomovimiento_kardex_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_motivomovimiento_kardex_producto ON kardex_producto USING btree (id_motivomovimiento);


--
-- TOC entry 2378 (class 1259 OID 874225)
-- Name: fki_perfil_empleado; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_perfil_empleado ON empleado USING btree (id_perfil);


--
-- TOC entry 2394 (class 1259 OID 874226)
-- Name: fki_producto_marca; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_producto_marca ON producto USING btree (id_marca);


--
-- TOC entry 2395 (class 1259 OID 874227)
-- Name: fki_producto_tipoproducto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_producto_tipoproducto ON producto USING btree (id_subcategoria);


--
-- TOC entry 2398 (class 1259 OID 874228)
-- Name: fki_seriecomprobante_tipocomprobante; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_seriecomprobante_tipocomprobante ON seriecomprobante USING btree (id_tipocomprobante);


--
-- TOC entry 2351 (class 1259 OID 874229)
-- Name: fki_sucursal_almacen; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_sucursal_almacen ON almacen USING btree (id_sucursal);


--
-- TOC entry 2354 (class 1259 OID 874230)
-- Name: fki_sucursal_caja; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_sucursal_caja ON caja USING btree (id_sucursal);


--
-- TOC entry 2379 (class 1259 OID 874231)
-- Name: fki_sucursal_empleado; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_sucursal_empleado ON empleado USING btree (id_sucursal);


--
-- TOC entry 2410 (class 1259 OID 874232)
-- Name: fki_tipocomprobante_venta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_tipocomprobante_venta ON venta USING btree (id_tipocomprobante);


--
-- TOC entry 2371 (class 1259 OID 874233)
-- Name: fki_unidadmedida_detcompraproducto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_unidadmedida_detcompraproducto ON detcompraproducto USING btree (id_unidadmedida);


--
-- TOC entry 2411 (class 1259 OID 874234)
-- Name: fki_venta_cliente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_venta_cliente ON venta USING btree (idcliente);


--
-- TOC entry 2490 (class 2606 OID 874235)
-- Name: cliente_idprofesion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idprofesion_fkey FOREIGN KEY (idprofesion) REFERENCES profesiones(idprofesion);


--
-- TOC entry 2503 (class 2606 OID 874240)
-- Name: fk_almacen_detprodalm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detprodalm
    ADD CONSTRAINT fk_almacen_detprodalm FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);


--
-- TOC entry 2510 (class 2606 OID 874245)
-- Name: fk_almacen_kardex_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_producto
    ADD CONSTRAINT fk_almacen_kardex_producto FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);


--
-- TOC entry 2564 (class 2606 OID 874250)
-- Name: fk_almacen_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_almacen_venta FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);


--
-- TOC entry 2559 (class 2606 OID 874255)
-- Name: fk_categoria_subcategoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subcategoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);


--
-- TOC entry 2494 (class 2606 OID 874260)
-- Name: fk_compra_cronogpago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogpago
    ADD CONSTRAINT fk_compra_cronogpago FOREIGN KEY (id_compra) REFERENCES compra(id_compra);


--
-- TOC entry 2501 (class 2606 OID 874265)
-- Name: fk_compra_detcompraproducto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detcompraproducto
    ADD CONSTRAINT fk_compra_detcompraproducto FOREIGN KEY (id_compra) REFERENCES compra(id_compra);


--
-- TOC entry 2512 (class 2606 OID 874270)
-- Name: fk_concepto_movimiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT fk_concepto_movimiento FOREIGN KEY (id_concepto) REFERENCES concepto(id_concepto);


--
-- TOC entry 2496 (class 2606 OID 874275)
-- Name: fk_cronogcobro_detamortizacioncobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detamortizacioncobro
    ADD CONSTRAINT fk_cronogcobro_detamortizacioncobro FOREIGN KEY (id_cronogcobro) REFERENCES cronogcobro(id_cronogcobro);


--
-- TOC entry 2498 (class 2606 OID 874280)
-- Name: fk_cronogpago_detamortizacionpago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detamortizacionpago
    ADD CONSTRAINT fk_cronogpago_detamortizacionpago FOREIGN KEY (id_cronogpago) REFERENCES cronogpago(id_cronogpago);


--
-- TOC entry 2489 (class 2606 OID 874285)
-- Name: fk_empleado_caja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caja
    ADD CONSTRAINT fk_empleado_caja FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);


--
-- TOC entry 2563 (class 2606 OID 874290)
-- Name: fk_empleado_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_empleado_venta FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);


--
-- TOC entry 2511 (class 2606 OID 874295)
-- Name: fk_formapago_movimirnto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT fk_formapago_movimirnto FOREIGN KEY (id_formapago) REFERENCES formapago(id_formapago);


--
-- TOC entry 2508 (class 2606 OID 876163)
-- Name: fk_motivomovimiento_kardex_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_producto
    ADD CONSTRAINT fk_motivomovimiento_kardex_producto FOREIGN KEY (id_motivomovimiento) REFERENCES motivomovimiento(id_motivomovimiento);


--
-- TOC entry 2495 (class 2606 OID 874300)
-- Name: fk_movimiento_detamortizacioncobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detamortizacioncobro
    ADD CONSTRAINT fk_movimiento_detamortizacioncobro FOREIGN KEY (id_movimiento) REFERENCES movimiento(id_movimiento);


--
-- TOC entry 2497 (class 2606 OID 874305)
-- Name: fk_movimiento_detamortizacionpago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detamortizacionpago
    ADD CONSTRAINT fk_movimiento_detamortizacionpago FOREIGN KEY (id_movimiento) REFERENCES movimiento(id_movimiento);


--
-- TOC entry 2507 (class 2606 OID 874310)
-- Name: fk_perfil_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT fk_perfil_empleado FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2500 (class 2606 OID 874315)
-- Name: fk_producto_detcompraproducto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detcompraproducto
    ADD CONSTRAINT fk_producto_detcompraproducto FOREIGN KEY (id_producto) REFERENCES producto(id_producto);


--
-- TOC entry 2502 (class 2606 OID 874320)
-- Name: fk_producto_detprodalm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detprodalm
    ADD CONSTRAINT fk_producto_detprodalm FOREIGN KEY (id_producto) REFERENCES producto(id_producto);


--
-- TOC entry 2504 (class 2606 OID 874325)
-- Name: fk_producto_detproductounidmedida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detproductounidmedida
    ADD CONSTRAINT fk_producto_detproductounidmedida FOREIGN KEY (id_producto) REFERENCES producto(id_producto);


--
-- TOC entry 2509 (class 2606 OID 874330)
-- Name: fk_producto_kardex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_producto
    ADD CONSTRAINT fk_producto_kardex FOREIGN KEY (id_producto) REFERENCES producto(id_producto);


--
-- TOC entry 2557 (class 2606 OID 874335)
-- Name: fk_producto_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT fk_producto_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca);


--
-- TOC entry 2558 (class 2606 OID 874340)
-- Name: fk_seriecomprobante_tipocomprobante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seriecomprobante
    ADD CONSTRAINT fk_seriecomprobante_tipocomprobante FOREIGN KEY (id_tipocomprobante) REFERENCES tipocomprobante(id_tipocomprobante);


--
-- TOC entry 2556 (class 2606 OID 874345)
-- Name: fk_subcategoria_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT fk_subcategoria_producto FOREIGN KEY (id_subcategoria) REFERENCES subcategoria(id_subcategoria);


--
-- TOC entry 2487 (class 2606 OID 874350)
-- Name: fk_sucursal_almacen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT fk_sucursal_almacen FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);


--
-- TOC entry 2488 (class 2606 OID 874355)
-- Name: fk_sucursal_caja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caja
    ADD CONSTRAINT fk_sucursal_caja FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);


--
-- TOC entry 2506 (class 2606 OID 874360)
-- Name: fk_sucursal_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT fk_sucursal_empleado FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);


--
-- TOC entry 2562 (class 2606 OID 874365)
-- Name: fk_tipocomprobante_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_tipocomprobante_venta FOREIGN KEY (id_tipocomprobante) REFERENCES tipocomprobante(id_tipocomprobante);


--
-- TOC entry 2492 (class 2606 OID 874370)
-- Name: fk_tipoconcepto_cconcepto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY concepto
    ADD CONSTRAINT fk_tipoconcepto_cconcepto FOREIGN KEY (id_tipoconcepto) REFERENCES tipoconcepto(id_tipoconcepto);


--
-- TOC entry 2565 (class 2606 OID 876153)
-- Name: fk_tipomovimiento_motivomovimiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivomovimiento
    ADD CONSTRAINT fk_tipomovimiento_motivomovimiento FOREIGN KEY (id_tipomovimiento) REFERENCES tipomovimiento(id_tipomovimiento);


--
-- TOC entry 2491 (class 2606 OID 874375)
-- Name: fk_tipopago_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_tipopago_compra FOREIGN KEY (id_tipopago) REFERENCES tipopago(id_tipopago);


--
-- TOC entry 2561 (class 2606 OID 874380)
-- Name: fk_tipopago_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_tipopago_venta FOREIGN KEY (id_tipopago) REFERENCES tipopago(id_tipopago);


--
-- TOC entry 2499 (class 2606 OID 874385)
-- Name: fk_unidadmedida_detcompraproducto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detcompraproducto
    ADD CONSTRAINT fk_unidadmedida_detcompraproducto FOREIGN KEY (id_unidadmedida) REFERENCES unidadmedida(id_unidadmedida);


--
-- TOC entry 2560 (class 2606 OID 874390)
-- Name: fk_venta_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2493 (class 2606 OID 874395)
-- Name: fk_venta_cronogcobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogcobro
    ADD CONSTRAINT fk_venta_cronogcobro FOREIGN KEY (id_venta) REFERENCES venta(id_venta);


--
-- TOC entry 2505 (class 2606 OID 874400)
-- Name: fk_venta_detventa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detventa
    ADD CONSTRAINT fk_venta_detventa FOREIGN KEY (id_venta) REFERENCES venta(id_venta);


--
-- TOC entry 2481 (class 2606 OID 874405)
-- Name: modulos_idmodulo_padre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2480 (class 2606 OID 874410)
-- Name: modulos_idmodulo_padre_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey1 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2479 (class 2606 OID 874415)
-- Name: modulos_idmodulo_padre_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey10 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2478 (class 2606 OID 874420)
-- Name: modulos_idmodulo_padre_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey11 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2477 (class 2606 OID 874425)
-- Name: modulos_idmodulo_padre_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey12 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2476 (class 2606 OID 874430)
-- Name: modulos_idmodulo_padre_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey13 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2475 (class 2606 OID 874435)
-- Name: modulos_idmodulo_padre_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey14 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2474 (class 2606 OID 874440)
-- Name: modulos_idmodulo_padre_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey15 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2473 (class 2606 OID 874445)
-- Name: modulos_idmodulo_padre_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey16 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2472 (class 2606 OID 874450)
-- Name: modulos_idmodulo_padre_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey17 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2471 (class 2606 OID 874455)
-- Name: modulos_idmodulo_padre_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey18 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2470 (class 2606 OID 874460)
-- Name: modulos_idmodulo_padre_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey19 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2469 (class 2606 OID 874465)
-- Name: modulos_idmodulo_padre_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey2 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2468 (class 2606 OID 874470)
-- Name: modulos_idmodulo_padre_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey20 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2467 (class 2606 OID 874475)
-- Name: modulos_idmodulo_padre_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey21 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2466 (class 2606 OID 874480)
-- Name: modulos_idmodulo_padre_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey22 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2465 (class 2606 OID 874485)
-- Name: modulos_idmodulo_padre_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey23 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2464 (class 2606 OID 874490)
-- Name: modulos_idmodulo_padre_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey24 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2463 (class 2606 OID 874495)
-- Name: modulos_idmodulo_padre_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey25 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2462 (class 2606 OID 874500)
-- Name: modulos_idmodulo_padre_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey26 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2461 (class 2606 OID 874505)
-- Name: modulos_idmodulo_padre_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey27 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2460 (class 2606 OID 874510)
-- Name: modulos_idmodulo_padre_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey28 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2459 (class 2606 OID 874515)
-- Name: modulos_idmodulo_padre_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey29 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2458 (class 2606 OID 874520)
-- Name: modulos_idmodulo_padre_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey3 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2457 (class 2606 OID 874525)
-- Name: modulos_idmodulo_padre_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey30 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2456 (class 2606 OID 874530)
-- Name: modulos_idmodulo_padre_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey31 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2455 (class 2606 OID 874535)
-- Name: modulos_idmodulo_padre_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey32 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2454 (class 2606 OID 874540)
-- Name: modulos_idmodulo_padre_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey33 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2453 (class 2606 OID 874545)
-- Name: modulos_idmodulo_padre_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey34 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2452 (class 2606 OID 874550)
-- Name: modulos_idmodulo_padre_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey35 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2451 (class 2606 OID 874555)
-- Name: modulos_idmodulo_padre_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey36 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2450 (class 2606 OID 874560)
-- Name: modulos_idmodulo_padre_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey37 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2449 (class 2606 OID 874565)
-- Name: modulos_idmodulo_padre_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey38 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2448 (class 2606 OID 874570)
-- Name: modulos_idmodulo_padre_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey39 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2447 (class 2606 OID 874575)
-- Name: modulos_idmodulo_padre_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey4 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2446 (class 2606 OID 874580)
-- Name: modulos_idmodulo_padre_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey40 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2445 (class 2606 OID 874585)
-- Name: modulos_idmodulo_padre_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey41 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2444 (class 2606 OID 874590)
-- Name: modulos_idmodulo_padre_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey42 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2443 (class 2606 OID 874595)
-- Name: modulos_idmodulo_padre_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey43 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2442 (class 2606 OID 874600)
-- Name: modulos_idmodulo_padre_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey44 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2441 (class 2606 OID 874605)
-- Name: modulos_idmodulo_padre_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey45 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2440 (class 2606 OID 874610)
-- Name: modulos_idmodulo_padre_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey46 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2439 (class 2606 OID 874615)
-- Name: modulos_idmodulo_padre_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey47 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2438 (class 2606 OID 874620)
-- Name: modulos_idmodulo_padre_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey48 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2437 (class 2606 OID 874625)
-- Name: modulos_idmodulo_padre_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey49 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2436 (class 2606 OID 874630)
-- Name: modulos_idmodulo_padre_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey5 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2435 (class 2606 OID 874635)
-- Name: modulos_idmodulo_padre_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey50 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2434 (class 2606 OID 874640)
-- Name: modulos_idmodulo_padre_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey51 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2433 (class 2606 OID 874645)
-- Name: modulos_idmodulo_padre_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey52 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2432 (class 2606 OID 874650)
-- Name: modulos_idmodulo_padre_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey53 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2431 (class 2606 OID 874655)
-- Name: modulos_idmodulo_padre_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey54 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2430 (class 2606 OID 874660)
-- Name: modulos_idmodulo_padre_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey55 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2429 (class 2606 OID 874665)
-- Name: modulos_idmodulo_padre_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey56 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2428 (class 2606 OID 874670)
-- Name: modulos_idmodulo_padre_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey57 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2427 (class 2606 OID 874675)
-- Name: modulos_idmodulo_padre_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey58 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2426 (class 2606 OID 874680)
-- Name: modulos_idmodulo_padre_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey59 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2425 (class 2606 OID 874685)
-- Name: modulos_idmodulo_padre_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey6 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2424 (class 2606 OID 874690)
-- Name: modulos_idmodulo_padre_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey60 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2423 (class 2606 OID 874695)
-- Name: modulos_idmodulo_padre_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey61 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2422 (class 2606 OID 874700)
-- Name: modulos_idmodulo_padre_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey7 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2421 (class 2606 OID 874705)
-- Name: modulos_idmodulo_padre_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey8 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2420 (class 2606 OID 874710)
-- Name: modulos_idmodulo_padre_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_idmodulo_padre_fkey9 FOREIGN KEY (idmodulo_padre) REFERENCES modulos(idmodulo);


--
-- TOC entry 2555 (class 2606 OID 874715)
-- Name: permisos_id_perfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2554 (class 2606 OID 874720)
-- Name: permisos_id_perfil_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey1 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2553 (class 2606 OID 874725)
-- Name: permisos_id_perfil_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey10 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2552 (class 2606 OID 874730)
-- Name: permisos_id_perfil_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey11 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2551 (class 2606 OID 874735)
-- Name: permisos_id_perfil_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey12 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2550 (class 2606 OID 874740)
-- Name: permisos_id_perfil_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey13 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2549 (class 2606 OID 874745)
-- Name: permisos_id_perfil_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey14 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2548 (class 2606 OID 874750)
-- Name: permisos_id_perfil_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey15 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2547 (class 2606 OID 874755)
-- Name: permisos_id_perfil_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey16 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2546 (class 2606 OID 874760)
-- Name: permisos_id_perfil_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey17 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2545 (class 2606 OID 874765)
-- Name: permisos_id_perfil_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey18 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2544 (class 2606 OID 874770)
-- Name: permisos_id_perfil_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey19 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2543 (class 2606 OID 874775)
-- Name: permisos_id_perfil_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey2 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2542 (class 2606 OID 874780)
-- Name: permisos_id_perfil_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey20 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2541 (class 2606 OID 874785)
-- Name: permisos_id_perfil_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey3 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2540 (class 2606 OID 874790)
-- Name: permisos_id_perfil_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey4 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2539 (class 2606 OID 874795)
-- Name: permisos_id_perfil_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey5 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2538 (class 2606 OID 874800)
-- Name: permisos_id_perfil_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey6 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2537 (class 2606 OID 874805)
-- Name: permisos_id_perfil_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey7 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2536 (class 2606 OID 874810)
-- Name: permisos_id_perfil_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey8 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2535 (class 2606 OID 874815)
-- Name: permisos_id_perfil_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_id_perfil_fkey9 FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil);


--
-- TOC entry 2534 (class 2606 OID 874820)
-- Name: permisos_idmodulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2533 (class 2606 OID 874825)
-- Name: permisos_idmodulo_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey1 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2532 (class 2606 OID 874830)
-- Name: permisos_idmodulo_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey10 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2531 (class 2606 OID 874835)
-- Name: permisos_idmodulo_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey11 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2530 (class 2606 OID 874840)
-- Name: permisos_idmodulo_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey12 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2529 (class 2606 OID 874845)
-- Name: permisos_idmodulo_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey13 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2528 (class 2606 OID 874850)
-- Name: permisos_idmodulo_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey14 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2527 (class 2606 OID 874855)
-- Name: permisos_idmodulo_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey15 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2526 (class 2606 OID 874860)
-- Name: permisos_idmodulo_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey16 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2525 (class 2606 OID 874865)
-- Name: permisos_idmodulo_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey17 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2524 (class 2606 OID 874870)
-- Name: permisos_idmodulo_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey18 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2523 (class 2606 OID 874875)
-- Name: permisos_idmodulo_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey19 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2522 (class 2606 OID 874880)
-- Name: permisos_idmodulo_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey2 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2521 (class 2606 OID 874885)
-- Name: permisos_idmodulo_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey20 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2520 (class 2606 OID 874890)
-- Name: permisos_idmodulo_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey21 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2519 (class 2606 OID 874895)
-- Name: permisos_idmodulo_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey3 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2518 (class 2606 OID 874900)
-- Name: permisos_idmodulo_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey4 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2517 (class 2606 OID 874905)
-- Name: permisos_idmodulo_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey5 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2516 (class 2606 OID 874910)
-- Name: permisos_idmodulo_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey6 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2515 (class 2606 OID 874915)
-- Name: permisos_idmodulo_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey7 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2514 (class 2606 OID 874920)
-- Name: permisos_idmodulo_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey8 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2513 (class 2606 OID 874925)
-- Name: permisos_idmodulo_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_idmodulo_fkey9 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 2486 (class 2606 OID 874930)
-- Name: ubigeos_idpais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubigeos
    ADD CONSTRAINT ubigeos_idpais_fkey FOREIGN KEY (idpais) REFERENCES paises(idpais);


--
-- TOC entry 2485 (class 2606 OID 874935)
-- Name: ubigeos_idpais_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubigeos
    ADD CONSTRAINT ubigeos_idpais_fkey1 FOREIGN KEY (idpais) REFERENCES paises(idpais);


--
-- TOC entry 2484 (class 2606 OID 874940)
-- Name: ubigeos_idpais_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubigeos
    ADD CONSTRAINT ubigeos_idpais_fkey2 FOREIGN KEY (idpais) REFERENCES paises(idpais);


--
-- TOC entry 2483 (class 2606 OID 874945)
-- Name: ubigeos_idpais_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubigeos
    ADD CONSTRAINT ubigeos_idpais_fkey3 FOREIGN KEY (idpais) REFERENCES paises(idpais);


--
-- TOC entry 2482 (class 2606 OID 874950)
-- Name: ubigeos_idpais_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubigeos
    ADD CONSTRAINT ubigeos_idpais_fkey4 FOREIGN KEY (idpais) REFERENCES paises(idpais);


--
-- TOC entry 2614 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-11-23 21:58:07

--
-- PostgreSQL database dump complete
--

