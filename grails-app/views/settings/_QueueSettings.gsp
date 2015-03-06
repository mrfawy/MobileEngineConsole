<div class="root">
	<g:if test="${!hideMutiEdit}">
		<div class="row">
			<div class="panel panel-info">
				<div class="panel-heading">Multi Editing</div>
				<div id="settingsPanel" class="panel-body">
					<div class="container">
						<div class="col-md-2">
							<g:checkBox class="multiEditingCheck" name="mutiEditing" />
							Multi Editing
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<g:textField name="prefix" class="form-control prefix"
									disabled="true" placeholder="Prefix"
									aria-describedby="basic-addon1" />
								<span class="input-group-addon" id="basic-addon1">.INQUIRE</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</g:if>
	<div class="row">
		<g:each in="${settings.queues}">
			<div class="panel panel-info">

				<div id="settingsPanel" class="panel-body">
					<div class="container">
						<div class="row">
							<div class="col-md-2">Queue Name:</div>
							<div class="col-md-8">
								${it.name}
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">Queue Value:</div>
							<div class="col-md-8">
								<g:if test="${editable}">
									<g:textField name="${settings.id}:${it.name}"
										value="${it.value}" class="form-control editableQueue"
										placeholder="Region" aria-describedby="basic-addon1" />
								</g:if>
								<g:else>
									${it.value}
								</g:else>

							</div>
						</div>
					</div>
				</div>
			</div>

		</g:each>
	</div>
</div>