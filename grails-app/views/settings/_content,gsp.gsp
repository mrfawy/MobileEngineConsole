<asset:javascript src="settings.js" />
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