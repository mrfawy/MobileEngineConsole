<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Member Engine Admin</title>
<style>
table,th,td {
	border: 1px solid black;
	border-collapse: collapse;
}

h1 {
	color: maroon;
}

h2 {
	color: blue;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">Mobile engine settings have been changed successfully , please check the new settings</div>
		<div class="row">
			<h1>
				Environment :
				${env}
			</h1>
		</div>

		<h2>BAM Settings</h2>
		<table>
			<tr>
				<th>Service Name</th>
				<th>Region</th>
			</tr>
			<g:each in="${activeSettings.activeSettings.bamSettings}">

				<tr>
					<td>
						${it.service}
					</td>
					<td>
						${it.wsaToValue}
					</td>

				</tr>
			</g:each>
		</table>

		<h2>Flex Settings</h2>
		<table>
			<tr>
				<th>Queue Name</th>
				<th>Value</th>
			</tr>
			<g:each
				in="${activeSettings.activeSettings.flexBilingSettings.queues}">
				<tr>
					<td>
						${it.name}
					</td>
					<td>
						${it.value}
					</td>

				</tr>
			</g:each>
		</table>

		<h2>Policy Info Settings</h2>
		<table>
			<tr>
				<th>Queue Name</th>
				<th>Value</th>
			</tr>
			<g:each
				in="${activeSettings.activeSettings.policyInfoSettings.queues}">
				<tr>
					<td>
						${it.name}
					</td>
					<td>
						${it.value}
					</td>

				</tr>
			</g:each>
		</table>


	</div>


</body>
</html>
