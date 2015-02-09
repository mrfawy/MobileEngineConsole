<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><g:layoutTitle default="Memeber Engine Admin" /></title>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<asset:javascript src="jquery.js" />
<asset:javascript src="jquery-ui.min.js" />
<!-- Include all compiled plugins (below), or include individual files as needed -->
<asset:javascript src="bootstrap.min.js" />
<!-- Bootstrap -->
<asset:stylesheet href="bootstrap.min.css" />
<asset:stylesheet href="jquery-ui.css" />
<asset:stylesheet href=" jquery-ui.theme.css" />
<asset:stylesheet href="jquery-ui.structure.css" />


<asset:stylesheet href="modal_alert.css" />



<asset:javascript src="loading-overlay.min.js" />





<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<g:layoutHead />
</head>
<body>
	<div>
		<g:render template="/common/modal_alert" />
	</div>
	<g:layoutBody />



</body>
</html>
