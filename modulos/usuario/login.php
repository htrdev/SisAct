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
	$_SESSION["nombreUsuario"] = $resultado[0]["usuario"];
	header('Location: '.$rutaVistas.'/index.php');
}
