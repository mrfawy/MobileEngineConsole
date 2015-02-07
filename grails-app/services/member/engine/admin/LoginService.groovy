package member.engine.admin

import org.codehaus.groovy.grails.commons.GrailsApplication;

import grails.transaction.Transactional

@Transactional
class LoginService {
	def grailsApplication

    def authneticateUser(userName,password) {
		def auth=grailsApplication.config.auth
		return (auth.userName==userName && auth.password==password)
		
    }
}
