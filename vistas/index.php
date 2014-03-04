<?php 
	require_once('../modulos/usuario/validarUsuario.php');
	require_once('../clases/usuario.php');
	require_once('../clases/actividad.php');
	$objActividad = new Actividad();
	$objUsuario = new Usuario(); 
?>
<html>
<head>
	<title>Bienvenido al Sistema SisAct</title>
</head>
<body>
	<h1 style="display:inline-block">BIENVENIDO !</h1>
	<h5 style="float:right">Hola, <?php echo $_SESSION["nombreUsuario"];?></h5>
	<table>
		<thead>
			<tr>
				<th>Usuario</th>
				<th>Password</th>
				<th>tipoUsuario</th>
			</tr>
		</thead>
		<tbody>
			<?php
				echo $objUsuario->generarTablaUsuarios();
			?>
		</tbody>
	</table>
	<table>
		<thead>
			<tr>
				<th>Fecha</th>
				<th>Hora</th>
				<th>Descripcion</th>
			</tr>
		</thead>
		<tbody>
			<?php
				echo $objActividad->generarTablaActividad();
			?>
		</tbody>
	</table>
</body>
</html>