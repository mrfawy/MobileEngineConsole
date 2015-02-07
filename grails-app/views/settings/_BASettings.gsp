
<g:each in="${settings}">
	<div class="panel panel-info">

		<div class="panel-heading">
			${it.service}
		</div>
		<div id="settingsPanel" class="panel-body">
			<div class="container">
				<div class="row">
					<div class="col-md-2">Bean:</div>
					<div class="col-md-8">
						${it.beanName}
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">Region:</div>
					<div class="col-md-8">
						<g:if test="${editable}">
							<g:textField name="${it.id}" value="${it.wsaToValue}"
								class="form-control" placeholder="Region"
								aria-describedby="basic-addon1" />
						</g:if>
						<g:else>
							${it.wsaToValue}
						</g:else>

					</div>
				</div>
			</div>
		</div>
	</div>

</g:each>
