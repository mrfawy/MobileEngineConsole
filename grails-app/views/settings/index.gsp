<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Member Engine Admin</title>
<asset:javascript src="settings.js" />
<asset:stylesheet href="settings.css" />
</head>
<body>
	<g:form controller="settings">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-default ">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navHeaderCollapse">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a id="home" class="navbar-brand" href="#">Environment</a>
						</div>

						<div class="collapse navbar-collapse navHeaderCollapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav ">
								<g:each in="${envList}">
									<li><g:link class="changeEnvLink" id="${it}" env="${it}">
											${it}
										</g:link></li>
								</g:each>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<g:if test="${session.isAdmin}">

									<li><g:link controller="login" action="logout">
											<span class="glyphicon glyphicon-log-out btnIcon "
												aria-hidden="true"></span>Sign out</g:link></li>

								</g:if>
								<g:else>

									<li><g:link controller="login" action="index">
											<span class="glyphicon glyphicon-home btnIcon "
												aria-hidden="true"></span>Home</g:link></li>


								</g:else>

							</ul>


						</div>

					</div>
				</nav>
			</div>

			<div class="row">
				<div id="settingsPanelPlaceHolder">

					<div class="panel panel-info">

						<div class="panel-heading">Settings</div>

						<div id="settingsPanel" class="panel-body ">

							<div>Please select an environment .</div>
						</div>


					</div>

				</div>
			</div>
		</div>
	</g:form>

</body>
</html>
