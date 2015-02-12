package livebill



import grails.test.mixin.*
import spock.lang.*

@TestFor(TonnersAmountsController)
@Mock(TonnersAmounts)
class TonnersAmountsControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.tonnersAmountsInstanceList
            model.tonnersAmountsInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tonnersAmountsInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def tonnersAmounts = new TonnersAmounts()
            tonnersAmounts.validate()
            controller.save(tonnersAmounts)

        then:"The create view is rendered again with the correct model"
            model.tonnersAmountsInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tonnersAmounts = new TonnersAmounts(params)

            controller.save(tonnersAmounts)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tonnersAmounts/show/1'
            controller.flash.message != null
            TonnersAmounts.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tonnersAmounts = new TonnersAmounts(params)
            controller.show(tonnersAmounts)

        then:"A model is populated containing the domain instance"
            model.tonnersAmountsInstance == tonnersAmounts
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tonnersAmounts = new TonnersAmounts(params)
            controller.edit(tonnersAmounts)

        then:"A model is populated containing the domain instance"
            model.tonnersAmountsInstance == tonnersAmounts
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/tonnersAmounts/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tonnersAmounts = new TonnersAmounts()
            tonnersAmounts.validate()
            controller.update(tonnersAmounts)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tonnersAmountsInstance == tonnersAmounts

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tonnersAmounts = new TonnersAmounts(params).save(flush: true)
            controller.update(tonnersAmounts)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/tonnersAmounts/show/$tonnersAmounts.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/tonnersAmounts/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def tonnersAmounts = new TonnersAmounts(params).save(flush: true)

        then:"It exists"
            TonnersAmounts.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tonnersAmounts)

        then:"The instance is deleted"
            TonnersAmounts.count() == 0
            response.redirectedUrl == '/tonnersAmounts/index'
            flash.message != null
    }
}
