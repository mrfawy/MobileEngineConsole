<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Member Engine Admin</title>
</head>
<body>
	<g:form controller="login">
		<div class="container">
			<div class="jumbotron-info">
				<h1>Welcome To Member Engine Console</h1>
				<p>A tool to view or change active settings for Member Engine.</p>
			</div>
			<g:if test="${error}">
				<div class="alert alert-danger" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
					${error}
				</div>
			</g:if>

			<div class="panel panel-info">
				<!-- Default panel contents -->
				<div class="panel-heading">Authentication</div>

				<!-- Table -->
				<table class="table">
					<tr>
						<td><g:textField name="userName" value="${userName}"
								class="form-control" placeholder="Username"
								aria-describedby="basic-addon1" /> <g:passwordField
								name="password" value="${password}" class="form-control"
								placeholder="password" aria-describedby="basic-addon1" />
					</tr>
					<tr>
						<td><g:actionSubmit value="Admin Login " action="login"
								class="btn btn-info btn-md" /> <g:actionSubmit
								value="Login As Guest" action="loginAsGuest"
								class="btn btn-success btn-md" />
					</tr>
				</table>
			</div>



		</div>



	</g:form>

</body>
</html>
