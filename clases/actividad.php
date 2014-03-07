<?php
	require_once('conexion.php');

abstract class Actividad{
	public $conexion;
	public $fechaActividad;
	public $horaActividad;
	public $descripcionActividad;

	function __construct(){
		$this->conexion = new Conexion();
	}

	public function listarActividad(){
		$query = "SELECT * FROM actividad";
		$resultado = $this->conexion->ejecutarQuery($query,"convertirArray");
		return $resultado;
	}

	public abstract function generarTabla();

	
}