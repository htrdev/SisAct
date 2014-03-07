<?php 
	require_once('../../modulos/usuario/validarUsuario.php');
	require_once('../../clases/comunicado.php');
	$objComunicado = new Comunicado(); 
	require_once('../header.php');
?>
<div class="container">
	<h3 style="display:inline-block">Comunicados <span class="glyphicon glyphicon-chevron-right"></span><h4 style="display:inline-block;margin-left:8px">Nuevo Comunicado</h4></h3>
	<div style="margin-top:40px">
		<form action="/sisact/modulos/comunicado/nuevo.php" method="post" accept-charset="utf-8">
			<div class="form-group col-xs-4">
				<label for="fechaActividad">Fecha</label>
				<input type="date" class="form-control" name="fechaActividad" value="">
			</div>
			<div class="form-group col-xs-4">
				<label for="horaActividad">Hora</label>
				<input type="time" class="form-control" name="horaActividad" value="">
			</div>
			<div class="form-group col-xs-8">
				<label for="descripcionActividad">Contenido Comunicado</label>
				<textarea class="form-control" name="descripcionActividad" value="" style="height:250px"></textarea>
			</div>
			<div class="form-group col-xs-4 col-xs-offset-6">
				<button class="btn btn-success"type="submit">
					Guardar
				</button>
				<button class="btn btn-danger" type="reset">
					Cancelar
				</button>
			</div>
		</form>
	</div>
</div>
<?php
	require_once('../footer.php');
?>