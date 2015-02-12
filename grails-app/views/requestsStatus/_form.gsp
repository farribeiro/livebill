<%@ page import="livebill.RequestsStatus" %>



<div class="fieldcontain ${hasErrors(bean: requestsStatusInstance, field: 'createdAt', 'error')} required">
	<label for="createdAt">
		<g:message code="requestsStatus.createdAt.label" default="Created At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdAt" precision="day"  value="${requestsStatusInstance?.createdAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: requestsStatusInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="requestsStatus.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${requestsStatusInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: requestsStatusInstance, field: 'request', 'error')} required">
	<label for="request">
		<g:message code="requestsStatus.request.label" default="Request" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="request" name="request.id" from="${livebill.Requests.list()}" optionKey="id" required="" value="${requestsStatusInstance?.request?.id}" class="many-to-one"/>

</div>

