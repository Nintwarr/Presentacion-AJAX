<?php

function get_conexion() {
	if ($_SESSION['db'] == null) {
		set_conexion(mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME));
	}
	return $_SESSION['db'];
}

function set_conexion($conexion) {
	$_SESSION['db'] = $conexion;
}

function abrir_conexion() {
	set_conexion(mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME));

	if (!get_conexion()) {
		exit("Error: no se pudo conectar a la base de datos.");
	}
}

function cerrar_conexion() {
	mysqli_close(get_conexion());
	$_SESSION['db'] = null;
}

function consultar($consulta) { //true para INSERT, false para SELECT
	if (get_conexion() == null) {
		abrir_conexion();
	}

	$res = mysqli_query(get_conexion(),$consulta);
	return $res;
}

function filas($resultado_consulta) {
	$num_filas = mysqli_num_rows($resultado_consulta);
	$filas = array();

	for ($i=0; $i<$num_filas; $i++)
		$filas[] = mysqli_fetch_assoc($resultado_consulta);

	return $filas;
}

function escapar($string) {
	return mysqli_real_escape_string(get_conexion(),htmlentities($string));
}

function buscar_usuario_por_nick($nick) {
	$id_usuario = 0;
	$consulta =
	'SELECT `ID_Usuario`'.
	'	FROM `Usuarios`'.
	'		WHERE `Nick` = \''. escapar($nick) .'\';';

	$resultado = consultar($consulta);

	if (mysqli_num_rows($resultado) != 0) {
		$id_usuario = filas($resultado)[0]['ID_Usuario'];
	}

	return $id_usuario;
}

function filtrar_uri() {
	// $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

	$tmp = array_filter(explode('/', $_SERVER['REQUEST_URI']));
	$pagina_con_params = array();
	foreach($tmp as $param) {
	    $pagina_con_params[count($pagina_con_params)] = $param;
	}
	$pagina = array_shift($pagina_con_params);
	$params = $pagina_con_params;

	$_SESSION['params_pagina'] = $params;
}

function get_servidor() {
	if (isset($_SERVER['HTTP_HOST']))
		return $_SERVER['HTTP_HOST'];
}

function get_resto_uri() {
	if (isset($_SERVER['REQUEST_URI']))
		return $_SERVER['REQUEST_URI'];
}

function redirigir($url, $permanente = false) {
    header('Location: ' . $url, true, $permanente ? 301 : 302);
    exit();
}
 ?>
