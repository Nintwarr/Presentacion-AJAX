<?php
function registrar_usuario($nick) {
	$id_usuario = 0;

	$consulta =
	'INSERT INTO `Usuarios`(Nick)'.
	'	VALUES(\''. escapar($nick) .'\');';

	if (consultar($consulta) != null) {
		$id_usuairo = buscar_usuario_por_nick($nick);
	}

	return $id_usuario;
}
 ?>
