
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
							<g:textField name="${settings.id}:${it.name}" value="${it.value}"
								class="form-control" placeholder="Region"
								aria-describedby="basic-addon1" />
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

