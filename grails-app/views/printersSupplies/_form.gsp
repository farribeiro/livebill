<%@ page import="livebill.PrintersSupplies" %>



<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="printersSupplies.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${printersSuppliesInstance.amount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'black', 'error')} required">
	<label for="black">
		<g:message code="printersSupplies.black.label" default="Black" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="black" type="number" value="${printersSuppliesInstance.black}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'colletedAt', 'error')} required">
	<label for="colletedAt">
		<g:message code="printersSupplies.colletedAt.label" default="Colleted At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="colletedAt" precision="day"  value="${printersSuppliesInstance?.colletedAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'cyan', 'error')} required">
	<label for="cyan">
		<g:message code="printersSupplies.cyan.label" default="Cyan" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cyan" type="number" value="${printersSuppliesInstance.cyan}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'magenta', 'error')} required">
	<label for="magenta">
		<g:message code="printersSupplies.magenta.label" default="Magenta" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="magenta" type="number" value="${printersSuppliesInstance.magenta}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'printer', 'error')} required">
	<label for="printer">
		<g:message code="printersSupplies.printer.label" default="Printer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="printer" name="printer.id" from="${livebill.Printers.list()}" optionKey="id" required="" value="${printersSuppliesInstance?.printer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: printersSuppliesInstance, field: 'yellow', 'error')} required">
	<label for="yellow">
		<g:message code="printersSupplies.yellow.label" default="Yellow" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="yellow" type="number" value="${printersSuppliesInstance.yellow}" required=""/>

</div>

