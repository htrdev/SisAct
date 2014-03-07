<?php
require_once('../../clases/comunicado.php');

$rutaVistas = "../../vistas";
$objComunicado = new Comunicado();
$objComunicado->fechaActividad= $_POST["fechaActividad"];
$objComunicado->horaActividad= $_POST["horaActividad"];
$objComunicado->descripcionActividad= $_POST["descripcionActividad"];

$resultado = $objComunicado->nuevo();

if($resultado==false){
	echo "Problemas";
}
else{
	header('Location: '.$rutaVistas.'/comunicado/comunicado.php');
}
