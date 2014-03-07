<?php 
	require_once('../modulos/usuario/validarUsuario.php');
	require_once('../clases/usuario.php');
	$objUsuario = new Usuario(); 
	require_once('header.php');
?>
	<table class="table">
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
<?php
	require_once('footer.php');
?>