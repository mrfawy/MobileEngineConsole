package member.engine.admin

import grails.transaction.Transactional
import groovy.json.JsonSlurper
import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.Method.*
import static groovyx.net.http.ContentType.JSON

@Transactional
class SettingsService {
	def grailsApplication

	def getStubSettings(){
		def stg="""{"activeSettings":{"bamSettings":[{"id":"RA","service":"Retrieve Accounts","beanName":"retrieveAccountsDaoImpl","wsaToValue":"TCICSAA"},{"id":"RP","service":"Retrieve Payment","beanName":"retrievePaymentInquiryDaoImpl","wsaToValue":"TCICSAA_PM"},{"id":"OTP","service":"Make a Payment","beanName":"oneTimePaymentDaoImpl","wsaToValue":"TCICSAA_RPM"},{"id":"RPM","service":"Retrieve Payment Method Pay Plan","beanName":"retrievePaymentMethodPayPlanDaoImpl","wsaToValue":"CICSAA_RPM"}],"flexBilingSettings":{"id":"FLXBLNG","service":"Flex Billing","beanName":"billingInquiryAdapter","queues":[{"name":"sQueue","value":"queue://NT02/FX.INQUIRE.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"rQueue","value":"queue://NT02/FX.INQUIRE.RES"}]},"policyInfoSettings":{"id":"PLCYINF","service":"Policy Information","beanName":"policyInfoAdapter","queues":[{"name":"homeSQueue","value":"queue://NT02/HOS.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"homeRQueue","value":"queue://NT02/HOS.INQUIRY.RES"},{"name":"dwelSQueue","value":"queue://NT02/DFS.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"dwelRQueue","value":"queue://NT02/DFS.INQUIRY.RES"},{"name":"umbSQueue","value":"queue://NT02/PES.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"umbSQueue","value":"queue://NT02/PES.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"umbRQueue","value":"queue://NT02/PES.INQUIRY.RES"},{"name":"autoSQueue","value":"queue://NT02/PAS.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"autoRQueue","value":"queue://NT02/PAS.INQUIRY.RES"},{"name":"rvmsaSQueue","value":"queue://NT02/PAS.MOTORCYCLE.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"rvmsaRQueue","value":"queue://NT02/PAS.MOTORCYCLE.INQUIRY.RES"},{"name":"boatSQueue","value":"queue://NT02/PAS.WATERCRAFT.INQUIRY.REQ?targetClient=1&CCSID=437&encoding=273&expiry=30000"},{"name":"boatRQueue","value":"queue://NT02/PAS.WATERCRAFT.INQUIRY.RES"}]}}}"""
			
		def slurper = new JsonSlurper()
		return slurper.parseText(stg)
	}

	def getSettings(env) {
			
		if(true){
			sleep(2000);
			
		}

		return getStubSettings()
		/*def url=grailsApplication.config.mobileEngine."${env}".Url


		def http = new HTTPBuilder(url)
		def result

		http.request(GET, JSON) {
			uri.path='/customer/admin/settings'
			response.success = { resp, json ->

				result=json
			}
			// called only for a 404 (not found) status code:
			response.'404' = { resp ->
				log.info 'Not found'
				return
			}
		}
		return result*/

	}

	def applySettings(settings,env){
		def url=grailsApplication.config.mobileEngine."${env}".Url


		def http = new HTTPBuilder(url)
		def result

		http.request( POST, JSON ) { req ->
			body = settings
			uri.path='/customer/admin/settings'
			response.success = { resp, json ->
				result=true
			}
		}
		return result
	}
}
