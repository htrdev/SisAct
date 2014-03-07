<?php 
	require_once('../../modulos/usuario/validarUsuario.php');
	require_once('../../clases/comunicado.php');
	$objComunicado = new Comunicado(); 
	require_once('../header.php');
?>
<div class="container">
	<h3 style="display:inline-block">Comunicados</h3>
	<a href="/sisact/vistas/comunicado/nuevo.php" class="btn btn-info col-xs-offset-1">Nuevo Comunicado</a>
	<table class="table" style="margin-top:20px">
		<thead>
			<tr>
				<th>Fecha</th>
				<th>Hora</th>
				<th>Contenido Comunicado</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php
				echo $objComunicado->generarTabla();
			?>
		</tbody>
	</table>
</div>
<?php
	require_once('../footer.php');
?>