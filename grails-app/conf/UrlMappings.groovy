class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		"/settings/resetSettings"(controller:"settings",parseRequest:true)

        "/"(controller:"login" , action:"index")
        "500"(view:'/error')
	}
}
