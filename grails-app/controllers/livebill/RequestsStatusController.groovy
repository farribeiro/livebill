package livebill



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RequestsStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RequestsStatus.list(params), model:[requestsStatusInstanceCount: RequestsStatus.count()]
    }

    def show(RequestsStatus requestsStatusInstance) {
        respond requestsStatusInstance
    }

    def create() {
        respond new RequestsStatus(params)
    }

    @Transactional
    def save(RequestsStatus requestsStatusInstance) {
        if (requestsStatusInstance == null) {
            notFound()
            return
        }

        if (requestsStatusInstance.hasErrors()) {
            respond requestsStatusInstance.errors, view:'create'
            return
        }

        requestsStatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requestsStatus.label', default: 'RequestsStatus'), requestsStatusInstance.id])
                redirect requestsStatusInstance
            }
            '*' { respond requestsStatusInstance, [status: CREATED] }
        }
    }

    def edit(RequestsStatus requestsStatusInstance) {
        respond requestsStatusInstance
    }

    @Transactional
    def update(RequestsStatus requestsStatusInstance) {
        if (requestsStatusInstance == null) {
            notFound()
            return
        }

        if (requestsStatusInstance.hasErrors()) {
            respond requestsStatusInstance.errors, view:'edit'
            return
        }

        requestsStatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RequestsStatus.label', default: 'RequestsStatus'), requestsStatusInstance.id])
                redirect requestsStatusInstance
            }
            '*'{ respond requestsStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RequestsStatus requestsStatusInstance) {

        if (requestsStatusInstance == null) {
            notFound()
            return
        }

        requestsStatusInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RequestsStatus.label', default: 'RequestsStatus'), requestsStatusInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestsStatus.label', default: 'RequestsStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
