<?php
require_once dirname(dirname(__FILE__)).'/config.php';

if (isset($_POST['usuario'])) {
	$nick = trim($_POST['usuario']);
	if (!empty($nick)) {

		$id_usuario = (int)buscar_usuario_por_nick($nick);

		if ($id_usuario == 0) {
			registrar_usuario($nick);
		}
	}
}
 ?>
