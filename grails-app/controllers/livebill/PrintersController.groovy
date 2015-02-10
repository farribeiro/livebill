package livebill



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrintersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Printers.list(params), model:[printersInstanceCount: Printers.count()]
    }

    def show(Printers printersInstance) {
        respond printersInstance
    }

    def create() {
        respond new Printers(params)
    }

    @Transactional
    def save(Printers printersInstance) {
        if (printersInstance == null) {
            notFound()
            return
        }

        if (printersInstance.hasErrors()) {
            respond printersInstance.errors, view:'create'
            return
        }

        printersInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'printers.label', default: 'Printers'), printersInstance.id])
                redirect printersInstance
            }
            '*' { respond printersInstance, [status: CREATED] }
        }
    }

    def edit(Printers printersInstance) {
        respond printersInstance
    }

    @Transactional
    def update(Printers printersInstance) {
        if (printersInstance == null) {
            notFound()
            return
        }

        if (printersInstance.hasErrors()) {
            respond printersInstance.errors, view:'edit'
            return
        }

        printersInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Printers.label', default: 'Printers'), printersInstance.id])
                redirect printersInstance
            }
            '*'{ respond printersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Printers printersInstance) {

        if (printersInstance == null) {
            notFound()
            return
        }

        printersInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Printers.label', default: 'Printers'), printersInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'printers.label', default: 'Printers'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
