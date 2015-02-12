<%@ page import="livebill.Requests" %>



<div class="fieldcontain ${hasErrors(bean: requestsInstance, field: 'request', 'error')} required">
	<label for="request">
		<g:message code="requests.request.label" default="Request" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="request" required="" value="${requestsInstance?.request}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: requestsInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="requests.status.label" default="Status" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${requestsInstance?.status?}" var="s">
    <li><g:link controller="requestsStatus" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requestsStatus" action="create" params="['requests.id': requestsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requestsStatus.label', default: 'RequestsStatus')])}</g:link>
</li>
</ul>


</div>

