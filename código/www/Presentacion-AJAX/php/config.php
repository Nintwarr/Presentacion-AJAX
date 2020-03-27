<?php
session_start();

// Twig
////////////////////////////////////////////////////////////////////////////////
require_once '/usr/local/lib/php/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('/var/www/html/Presentacion-AJAX/templates');
$twig = new \Twig\Environment($loader);
////////////////////////////////////////////////////////////////////////////////

require_once dirname(dirname(__FILE__)).'/php/constants.php';
require_once _ROOT_.'/php/functions/Principales.php'; // _ROOT_ == /var/www/html
require_once _ROOT_.'/php/functions/Chat.php';
require_once _ROOT_.'/php/functions/Login.php';
?>
