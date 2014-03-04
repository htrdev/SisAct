<?php
	session_start();
	if(is_null($_SESSION["nombreUsuario"])){
		header('Location: ../vistas/login.php');
	}
?>