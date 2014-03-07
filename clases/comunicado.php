<?php
	require_once('actividad.php');

class Comunicado extends Actividad{

	public function generarTabla(){
		$actividades = $this->listarActividad();
		$nombreCampos = array("fechaActividad","horaActividad","descripcionActividad");
		$htmlGenerado = $this->conexion->generarFilasRegistro($actividades,$nombreCampos);
		return $htmlGenerado;
	}
	
	public function nuevo(){
		$query = "INSERT INTO actividad(fechaActividad,horaActividad,estadoActividad,descripcionActividad,tipoActividad) 
		values(
			'".$this->fechaActividad."'
			,'".$this->horaActividad."'
			,'0'
			,'".$this->descripcionActividad."'
			,'Comunicado')";
		$resultado = $this->conexion->ejecutarQuery($query,false);
		return $resultado;
	}
}