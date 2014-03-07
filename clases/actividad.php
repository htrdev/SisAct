<?php
<<<<<<< HEAD
	require_once('conexion.php');

abstract class Actividad{
	public $conexion;
	public $fechaActividad;
	public $horaActividad;
	public $descripcionActividad;
=======

class Actividad{
	public $conexion;
>>>>>>> 1758d4923d4fef768416ce04fa1b3ce7737be41b

	function __construct(){
		$this->conexion = new Conexion();
	}

	public function listarActividad(){
		$query = "SELECT * FROM actividad";
		$resultado = $this->conexion->ejecutarQuery($query,"convertirArray");
		return $resultado;
	}

<<<<<<< HEAD
	public abstract function generarTabla();

	
=======
	public function generarTablaActividad(){
		$actividades = $this->listarActividad();
		$nombreCampos = array("fechaActividad","horaActividad","descripcionActividad");
		$htmlGenerado = $this->conexion->generarFilasRegistro($actividades,$nombreCampos);
		return $htmlGenerado;
	}
>>>>>>> 1758d4923d4fef768416ce04fa1b3ce7737be41b
}