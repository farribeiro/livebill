package livebill



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrintersSuppliesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PrintersSupplies.list(params), model:[printersSuppliesInstanceCount: PrintersSupplies.count()]
    }

    def show(PrintersSupplies printersSuppliesInstance) {
        respond printersSuppliesInstance
    }

    def create() {
        respond new PrintersSupplies(params)
    }

    @Transactional
    def save(PrintersSupplies printersSuppliesInstance) {
        if (printersSuppliesInstance == null) {
            notFound()
            return
        }

        if (printersSuppliesInstance.hasErrors()) {
            respond printersSuppliesInstance.errors, view:'create'
            return
        }

        printersSuppliesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'printersSupplies.label', default: 'PrintersSupplies'), printersSuppliesInstance.id])
                redirect printersSuppliesInstance
            }
            '*' { respond printersSuppliesInstance, [status: CREATED] }
        }
    }

    def edit(PrintersSupplies printersSuppliesInstance) {
        respond printersSuppliesInstance
    }

    @Transactional
    def update(PrintersSupplies printersSuppliesInstance) {
        if (printersSuppliesInstance == null) {
            notFound()
            return
        }

        if (printersSuppliesInstance.hasErrors()) {
            respond printersSuppliesInstance.errors, view:'edit'
            return
        }

        printersSuppliesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PrintersSupplies.label', default: 'PrintersSupplies'), printersSuppliesInstance.id])
                redirect printersSuppliesInstance
            }
            '*'{ respond printersSuppliesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PrintersSupplies printersSuppliesInstance) {

        if (printersSuppliesInstance == null) {
            notFound()
            return
        }

        printersSuppliesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PrintersSupplies.label', default: 'PrintersSupplies'), printersSuppliesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'printersSupplies.label', default: 'PrintersSupplies'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
