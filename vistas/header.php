<html>
	<head>
		<meta charset="utf-8">
		<title>Sistema de Actividades</title>
		<link rel="stylesheet" href="/sisact/css/bootstrap.min.css">
		<link rel="stylesheet" href="/sisact/css/bootstrap-dark.min.css">
		<link rel="stylesheet" href="/sisact/css/estilo.css">
	</head>
<body>
	<header id="header" class="">
		<div id="menu" class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header col-xs-3 col-xs-offset-1">
				<button class="btn btn-success navbar-toggle"
				data-toggle="collapse"
				data-target=".navbar-collapse"><span class="glyphicon glyphicon-chevron-down"></span> </button>
				<div id="logo">
					<a href="."><h4>Sistema Actividades EPIS</h4></a>
				</div>
			</div>
			<div class="navbar-collapse collapse col-xs-4 col-xs-offset-3">
				<ul class="nav navbar-nav navbar-right">
					<li class="nav"><a href=".">Actividad</a></li>
					<li class="nav"><a href="/sisact/vistas/comunicado/comunicado.php">Comunicado</a></li>
				</ul>

			</div>
			<div id="usuario" class="btn-group col-xs-offset-1">
			  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			    Hola, <?php echo $_SESSION["nombreUsuario"];?><span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#">Salir</a></li>
			  </ul>
			</div>
		</div>
	</header><!-- /header -->
	<div id="main" class="container">

