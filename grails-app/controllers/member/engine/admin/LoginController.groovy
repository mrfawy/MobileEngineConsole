package member.engine.admin

class LoginController {
	def loginService;

    def index() { }
	def login(){
		def adminAuthticated=loginService.authneticateUser(params.userName,params.password)
		if (adminAuthticated){
			session.isAdmin=true
			redirect(controller:"settings");
		}
		else{
			request.error="Invalid user name or passowrd ."
			render(view: "index")
		}
		
	}
	def loginAsGuest(){
		redirect(controller:"settings");
	}
	def logout(){
		session.invalidate()
		redirect(action:"index")
	}
}
