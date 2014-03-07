<?php

class Conexion{

	public $servidor;
	public $basedatos;
	public $usuario;
	public $password;
	public $conexion;

	function __construct(){
		$this->servidor = "localhost";
		$this->basedatos = "sistemaactividades";
		$this->usuario = "htrdev";
		$this->password = "12345";
		$this->conectar();
	}

	public function conectar(){
		$this->conexion = mysql_connect($this->servidor,$this->usuario,$this->password);
		mysql_select_db($this->basedatos,$this->conexion);
	}

	public function ejecutarQuery($query,$convertirArray){
		$resultado = mysql_query($query,$this->conexion);
		// SI ES UN SELECT ( SI ME DEVUELVE ALGUN REGISTRO )
		// $RESULTADO = REGISTROS

		// SI ES UN INSERT, UPDATE, DELETE
		//$RESULTADO TRUE O FALSE
<<<<<<< HEAD
		if($convertirArray){
=======
		if($convertirArray=="convertirArray"){
>>>>>>> 1758d4923d4fef768416ce04fa1b3ce7737be41b
			$resultadoArray = $this->convertirArray($resultado);
			return $resultadoArray;
		}
		else{
			return $resultado;
		}
	}

	public function convertirArray($resultado){
		$array = array();
		//DECLARANDO UN ARRY EN BLANCO
		while($registro = mysql_fetch_assoc($resultado)){
			//MAPEAR LOS NOMBRES DE LOS CAMPOS Y LES VA PONER EL NOMBRE A LOS INDICES EN EL ARRAY
			//EJEMPLO 2 REGISTROS CON idPersona = 1 y 2
			//$array(0=>array("idPersona"=>1),1=>array("idPersona"=>2));
			$array[] = $registro;
		}
		return $array;
	}

	public function generarFilasRegistro($arrayRegistros,$nombreCampos){
		$html = "";
		foreach($arrayRegistros as $registro){
			$html .="<tr>";
			foreach($nombreCampos as $nombreCampo){
				$html .="<td>".$registro[$nombreCampo]."</td>";
			}
			$html .="</tr>";						
		}
		return $html;			
	}

}