package member.engine.admin


class SettingsController {
	def grailsApplication
	def settingsService
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

		render(template:"settingsViewer", model:[env:session.currentEnv,isAdmin:session.isAdmin,activeSettings:session.currentSettings,editable:true])
	}
	def cancel(){
		render(template:"settingsViewer", model:[env:session.currentEnv,isAdmin:session.isAdmin,activeSettings:session.currentSettings])
	}
	def refresh(){
		def activeSettings=settingsService.getSettings(session.currentEnv)

		if(!activeSettings){
			throw new Exception("Failed to load settings")
		}
		session.currentSettings=activeSettings
		render(template:"settingsViewer", model:[env:session.currentEnv,isAdmin:session.isAdmin,activeSettings:session.currentSettings])
	}
	def getSettings() {
		if(!params.env){
			render( "No Envirnment Selected")
		}
		
		session.currentEnv=params.env
		def activeSettings=settingsService.getSettings(session.currentEnv)

		if(!activeSettings){
			throw new Exception("Failed to load settings")
		}
		session.currentSettings=activeSettings

		render(template:"settingsViewer", model:[env:session.currentEnv,isAdmin:session.isAdmin,activeSettings:session.currentSettings])
	}
	def applySettings() {
		if(!session.currentSettings){
			throw new Exception ("Current settings doesn't exists!!")
		}
		def currentSettings=session.currentSettings
		session.currentSettings.activeSettings.bamSettings.each(){item->
			item.wsaToValue=params[item.id]
		}
		session.currentSettings.activeSettings.flexBilingSettings.queues.each(){item->
			item.value=params["${currentSettings.activeSettings.flexBilingSettings.id}:${item.name}"]
		}
		session.currentSettings.activeSettings.policyInfoSettings.queues.each(){item->
			item.value=params["${currentSettings.activeSettings.policyInfoSettings.id}:${item.name}"]
		}
	
		def success=settingsService.applySettings(session.currentSettings,session.currentEnv)
		if(success){
			sendApplySettingsEmail(session.currentSettings)
		}
		else{
			throw new Exception("Failed to apply settings")
		}		

		render(template:"settingsViewer", model:[env:session.currentEnv,isAdmin:session.isAdmin,activeSettings:session.currentSettings,editable:false])
	}
	
	def sendEmail(){
		def activeSettings=session.currentSettings
		render view:"confirmationEmail" ,model:[env:session.currentEnv,activeSettings:activeSettings]
	}

	private sendApplySettingsEmail(activeSettings){		
		sendMail {
			async true
			from grailsApplication.config.email.from
			to grailsApplication.config.email.to
			subject grailsApplication.config.email.subject
			html view:"confirmationEmail" ,model:[env:session.currentEnv,activeSettings:activeSettings]
		}
		log.info  "EMail sent successfully "
	}
}

