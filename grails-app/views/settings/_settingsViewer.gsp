<asset:javascript src="settings.js" />
<div id="view" class="panel panel-info">

	<div class="panel-heading">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2 col-lg-4">Settings <span class="badge"> ${env}</span></div>
				<div class="col-sm-1 col-lg-5">
					<g:link name="refreshSettings" class="refreshSettings">
						<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
					</g:link>
				</div>

				<g:if test="${isAdmin}">
					<g:if test="${editable==true}">


						<div class="col-sm-2 col-lg-2">
							<g:link class=" btn btn-danger applySettings">
								<span class="glyphicon glyphicon-cloud-upload btnIcon"
									aria-hidden="true"></span>Override Settings</g:link>
						</div>
						<div class="col-sm-1 col-lg-1">
							<g:remoteLink action="cancel" update="view" params="['env':env]"
								class="btn-group btn btn-success" role="group">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Cancel </g:remoteLink>
						</div>

					</g:if>
					<g:else>
						<g:remoteLink action="editSettings" update="view" 
							onSuccess="refresh();" class="pull-right" >
							<span class="glyphicon glyphicon-pencil btnIcon "
								aria-hidden="true"></span>Edit</g:remoteLink>
					</g:else>
				</g:if>

			</div>

		</div>

	</div>
	<div id="settingsPanel" class="panel-body">
		<div id="accordion">
			<h1>BAM Settings</h1>
			<div>
				<g:render template="/settings/BASettings" var="ba"
					model="['settings':activeSettings.activeSettings.bamSettings, 'editable':editable]" />
			</div>
			<h1>Flex Settings</h1>
			<div>
				<g:render template="/settings/QueueSettings" var="queueSettings"
					model="['settings':activeSettings.activeSettings.flexBilingSettings,'editable':editable]" />
			</div>
			<h1>Policy Info Settings</h1>
			<div>
				<g:render template="/settings/QueueSettings" var="queueSettings"
					model="['settings':activeSettings.activeSettings.policyInfoSettings,'editable':editable]" />
			</div>
		</div>
	</div>
	<div class="panel-Footer"></div>

</div>
