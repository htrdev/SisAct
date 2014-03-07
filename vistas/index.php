<?php 
	require_once('../modulos/usuario/validarUsuario.php');
	require_once('../clases/usuario.php');
<<<<<<< HEAD
	$objUsuario = new Usuario(); 
	require_once('header.php');
?>
	<table class="table">
=======
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
>>>>>>> 1758d4923d4fef768416ce04fa1b3ce7737be41b
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
<<<<<<< HEAD
<?php
	require_once('footer.php');
?>
=======
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
>>>>>>> 1758d4923d4fef768416ce04fa1b3ce7737be41b
