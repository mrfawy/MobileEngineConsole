package member.engine.admin


class SettingsController {
	def grailsApplication
	def settingsService
	def currentEnv
	def currentSettings
	def envList

	def index() {
		if(!envList){
			envList=[]
			grailsApplication.config.mobileEngine.each(){item->
				if(item.key!='null'){
					envList<<"${item.key}"
				}
				
			}			
		}
		
		render(view:"index" , model:[envList:envList])
	}
	def editSettings(){
		if(!session.isAdmin){
			throw new Exception("You are not allowed to Edit ")
		}

		render(template:"settingsViewer", model:[activeSettings:currentSettings,editable:true])
	}
	def cancel(){
		render(template:"settingsViewer", model:[activeSettings:currentSettings])
	}
	def refresh(){
		def activeSettings=settingsService.getSettings(currentEnv)

		if(!activeSettings){
			throw new Exception("Failed to load settings")
		}
		currentSettings=activeSettings
		render(template:"settingsViewer", model:[activeSettings:currentSettings])
	}
	def getSettings() {
		if(!params.env){
			render( "No Envirnment Selected")
		}
		currentEnv=params.env
		session.currentEnv=currentEnv
		def activeSettings=settingsService.getSettings(currentEnv)

		if(!activeSettings){
			throw new Exception("Failed to load settings")
		}
		currentSettings=activeSettings

		render(template:"settingsViewer", model:[activeSettings:currentSettings])
	}
	def applySettings() {

		currentSettings.activeSettings.bamSettings.each(){item->
			item.wsaToValue=params[item.id]
		}
		currentSettings.activeSettings.flexBilingSettings.queues.each(){item->
			item.value=params["${currentSettings.activeSettings.flexBilingSettings.id}:${item.name}"]
		}
		currentSettings.activeSettings.policyInfoSettings.queues.each(){item->
			item.value=params["${currentSettings.activeSettings.policyInfoSettings.id}:${item.name}"]
		}
		//def success=settingsService.applySettings(currentSettings,currentEnv)
		def success=true
		if(!success){
			throw new Exception("Failed to apply settings")
		}

		render(template:"settingsViewer", model:[activeSettings:currentSettings,editable:false])
	}
}