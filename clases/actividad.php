<?php

class Actividad{
	public $conexion;

	function __construct(){
		$this->conexion = new Conexion();
	}

	public function listarActividad(){
		$query = "SELECT * FROM actividad";
		$resultado = $this->conexion->ejecutarQuery($query,"convertirArray");
		return $resultado;
	}

	public function generarTablaActividad(){
		$actividades = $this->listarActividad();
		$nombreCampos = array("fechaActividad","horaActividad","descripcionActividad");
		$htmlGenerado = $this->conexion->generarFilasRegistro($actividades,$nombreCampos);
		return $htmlGenerado;
	}
}