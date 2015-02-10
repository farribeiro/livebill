<%@ page import="livebill.Printers" %>



<div class="fieldcontain ${hasErrors(bean: printersInstance, field: 'createdAt', 'error')} required">
	<label for="createdAt">
		<g:message code="printers.createdAt.label" default="Created At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdAt" precision="day"  value="${printersInstance?.createdAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: printersInstance, field: 'departament', 'error')} required">
	<label for="departament">
		<g:message code="printers.departament.label" default="Departament" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="departament" required="" value="${printersInstance?.departament}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
		<g:message code="printers.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="manufacturer" required="" value="${printersInstance?.manufacturer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersInstance, field: 'model', 'error')} required">
	<label for="model">
		<g:message code="printers.model.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="model" required="" value="${printersInstance?.model}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersInstance, field: 'pages', 'error')} ">
	<label for="pages">
		<g:message code="printers.pages.label" default="Pages" />
		