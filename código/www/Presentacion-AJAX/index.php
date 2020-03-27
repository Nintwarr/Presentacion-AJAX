<?php
session_start();

require_once dirname(__FILE__).'/php/config.php';
// Función propia para conectarnos a la base de datos
abrir_conexion();

// Recuperamos el nombre de usuario de la variable $_GET
$nombre_usuario = (isset($_GET['usuario'])) ? $_GET['usuario'] : 0;
// Buscamos a ver si existe ese usuario
$id_usuario = (int)buscar_usuario_por_nick($nombre_usuario);

// Ponemos el id del usuario en la variable global $_SESSION para utilizarlo más adelante
$_SESSION['usuario'] = $id_usuario;

// Si $id_usuario es 0, quiere decir que no está en la base de datos
if ($id_usuario == 0) {
	// Vamos al login porque ahí puede registar
	echo $twig->render("login.html");
} else {
	// Nos vamos al chat
	echo $twig->render("index.html",['usuario_actual' => $nombre_usuario]);
}

cerrar_conexion();
?>
