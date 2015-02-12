<%@ page import="livebill.Tonners" %>



<div class="fieldcontain ${hasErrors(bean: tonnersInstance, field: 'referenceModel', 'error')} required">
	<label for="referenceModel">
		<g:message code="tonners.referenceModel.label" default="Reference Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="referenceModel" required="" value="${tonnersInstance?.referenceModel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tonnersInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="tonners.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${tonnersInstance.amount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: tonnersInstance, field: 'printer', 'error')} ">
	<label for="printer">
		<g:message code="tonners.printer.label" default="Printer" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tonnersInstance?.printer?}" var="p">
    <li><g:link controller="printers" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="printers" action="create" params="['tonners.id': tonnersInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'printers.label', default: 'Printers')])}</g:link>
</li>
</ul>


</div>

