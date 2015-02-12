package livebill



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TonnersAmountsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TonnersAmounts.list(params), model:[tonnersAmountsInstanceCount: TonnersAmounts.count()]
    }

    def show(TonnersAmounts tonnersAmountsInstance) {
        respond tonnersAmountsInstance
    }

    def create() {
        respond new TonnersAmounts(params)
    }

    @Transactional
    def save(TonnersAmounts tonnersAmountsInstance) {
        if (tonnersAmountsInstance == null) {
            notFound()
            return
        }

        if (tonnersAmountsInstance.hasErrors()) {
            respond tonnersAmountsInstance.errors, view:'create'
            return
        }

        tonnersAmountsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tonnersAmounts.label', default: 'TonnersAmounts'), tonnersAmountsInstance.id])
                redirect tonnersAmountsInstance
            }
            '*' { respond tonnersAmountsInstance, [status: CREATED] }
        }
    }

    def edit(TonnersAmounts tonnersAmountsInstance) {
        respond tonnersAmountsInstance
    }

    @Transactional
    def update(TonnersAmounts tonnersAmountsInstance) {
        if (tonnersAmountsInstance == null) {
            notFound()
            return
        }

        if (tonnersAmountsInstance.hasErrors()) {
            respond tonnersAmountsInstance.errors, view:'edit'
            return
        }

        tonnersAmountsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TonnersAmounts.label', default: 'TonnersAmounts'), tonnersAmountsInstance.id])
                redirect tonnersAmountsInstance
            }
            '*'{ respond tonnersAmountsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TonnersAmounts tonnersAmountsInstance) {

        if (tonnersAmountsInstance == null) {
            notFound()
            return
        }

        tonnersAmountsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TonnersAmounts.label', default: 'TonnersAmounts'), tonnersAmountsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tonnersAmounts.label', default: 'TonnersAmounts'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
