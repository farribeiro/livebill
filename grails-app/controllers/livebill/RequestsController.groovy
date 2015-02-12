package livebill



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RequestsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Requests.list(params), model:[requestsInstanceCount: Requests.count()]
    }

    def show(Requests requestsInstance) {
        respond requestsInstance
    }

    def create() {
        respond new Requests(params)
    }

    @Transactional
    def save(Requests requestsInstance) {
        if (requestsInstance == null) {
            notFound()
            return
        }

        if (requestsInstance.hasErrors()) {
            respond requestsInstance.errors, view:'create'
            return
        }

        requestsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requests.label', default: 'Requests'), requestsInstance.id])
                redirect requestsInstance
            }
            '*' { respond requestsInstance, [status: CREATED] }
        }
    }

    def edit(Requests requestsInstance) {
        respond requestsInstance
    }

    @Transactional
    def update(Requests requestsInstance) {
        if (requestsInstance == null) {
            notFound()
            return
        }

        if (requestsInstance.hasErrors()) {
            respond requestsInstance.errors, view:'edit'
            return
        }

        requestsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Requests.label', default: 'Requests'), requestsInstance.id])
                redirect requestsInstance
            }
            '*'{ respond requestsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Requests requestsInstance) {

        if (requestsInstance == null) {
            notFound()
            return
        }

        requestsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Requests.label', default: 'Requests'), requestsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'requests.label', default: 'Requests'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
