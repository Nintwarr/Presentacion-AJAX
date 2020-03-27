<?php
function obtener_mensajes() {
	$consulta =
	'SELECT m.`Texto`, u.`ID_Usuario`, u.`Nick`'.
	'	FROM `Mensajes` m'.
	'	JOIN `Usuarios` u'.
	'		ON m.`ID_Usuario` = u.`ID_Usuario`'.
	'			ORDER BY `Marca_temporal` ASC;';

	$resultado = consultar($consulta);
	return $mensajes = filas($resultado);
}

function enviar_mensaje($mensaje) {
	$consulta_interna =
	'SELECT `ID_Usuario`'.
	'	FROM `Usuarios`'.
	'		WHERE `ID_Usuario` = \''. $_SESSION['usuario'] .'\'';

	$consulta =
	'INSERT INTO Mensajes(`ID_Usuario`, `Texto`)'.
	'	VALUES(('. $consulta_interna .'),\''. escapar($mensaje) .'\');';

	$resultado = consultar($consulta);

	return $resultado;
}
 ?>
