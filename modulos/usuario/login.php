<?php
require_once('../../clases/usuario.php');

$rutaVistas = "../../vistas";
$usuario = $_POST['usuario'];
$password = $_POST['password'];

$objUsuario = new Usuario();

$resultado = $objUsuario->login($usuario,$password);

if($resultado==false){
	echo "Usuario invalido";
}
else{
	session_start();
<<<<<<< HEAD
	$_SESSION["nombreUsuario"] = $resultado[0]["usuario"];
=======
	$_SESSION["nombreUsuario"] = $resultado[0]["nombreUsuario"];
>>>>>>> 1758d4923d4fef768416ce04fa1b3ce7737be41b
	header('Location: '.$rutaVistas.'/index.php');
}
