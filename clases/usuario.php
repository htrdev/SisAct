<?php
require_once('conexion.php');

class Usuario{

	public $conexion;

	function __construct(){
		$this->conexion = new Conexion();
	}

	public function login($usuario,$password){
		$query ="SELECT * FROM usuario WHERE usuario.usuario = '".$usuario."' AND usuario.password = '".$password."'";
		//$query = "CALL usp_login('".$usuario."','".$password."')";
		$resultado = $this->conexion->ejecutarQuery($query,"convertirArray");
		return $resultado;
	}

	public function listarUsuarios(){
		$query = "SELECT * FROM usuario";
		$resultado = $this->conexion->ejecutarQuery($query,"convertirArray");
		return $resultado;
	}

	public function generarTablaUsuarios(){
		$usuarios = $this->listarUsuarios();
		$nombreCampos = array("usuario","password","tipoUsuario");
		$htmlGenerado = $this->conexion->generarFilasRegistro($usuarios,$nombreCampos);
		return $htmlGenerado;
	}
}