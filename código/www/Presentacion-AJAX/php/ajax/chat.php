<?php
/*
////////////////////////////////////////////////////////////////////////////////
Este sript se encarga de enviar los mensajes a los clientes o subirlos a la base
de datos en función de los parámetros de la petición.
////////////////////////////////////////////////////////////////////////////////
 */
require_once dirname(dirname(__FILE__)).'/config.php';

if (isset($_POST['method']) && !empty($_POST['method'])) {
	$metodo = trim($_POST['method']);

	if ($metodo == METODO_LEER_MENSAJES) {
		$mensajes = obtener_mensajes();

		if (empty($mensajes)) {
			echo 'No hay mensajes';
		} else {
			echo $twig->render('chat.html', ['mensajes' => $mensajes]);
		}
	} else if ($metodo == METODO_ENVIAR_MENSAJE && isset($_POST['mensaje'])) {
		$mensaje = trim($_POST['mensaje']);

		if (!empty($mensaje)) {
			if (enviar_mensaje($mensaje) == null) {
				echo "No se ha podido enviar el mensaje";
			} else {
				echo "Mensaje enviado";
			}
		}

	}
}
?>
