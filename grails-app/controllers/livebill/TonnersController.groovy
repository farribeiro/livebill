package livebill



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TonnersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tonners.list(params), model:[tonnersInstanceCount: Tonners.count()]
    }

    def show(Tonners tonnersInstance) {
        respond tonnersInstance
    }

    def create() {
        respond new Tonners(params)
    }

    @Transactional
    def save(Tonners tonnersInstance) {
        if (tonnersInstance == null) {
            notFound()
            return
        }

        if (tonnersInstance.hasErrors()) {
            respond tonnersInstance.errors, view:'create'
            return
        }

        tonnersInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tonners.label', default: 'Tonners'), tonnersInstance.id])
                redirect tonnersInstance
            }
            '*' { respond tonnersInstance, [status: CREATED] }
        }
    }

    def edit(Tonners tonnersInstance) {
        respond tonnersInstance
    }

    @Transactional
    def update(Tonners tonnersInstance) {
        if (tonnersInstance == null) {
            notFound()
            return
        }

        if (tonnersInstance.hasErrors()) {
            respond tonnersInstance.errors, view:'edit'
            return
        }

        tonnersInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tonners.label', default: 'Tonners'), tonnersInstance.id])
                redirect tonnersInstance
            }
            '*'{ respond tonnersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tonners tonnersInstance) {

        if (tonnersInstance == null) {
            notFound()
            return
        }

        tonnersInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tonners.label', default: 'Tonners'), tonnersInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tonners.label', default: 'Tonners'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
