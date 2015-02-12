<%@ page import="livebill.TonnersAmounts" %>



<div class="fieldcontain ${hasErrors(bean: tonnersAmountsInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="tonnersAmounts.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${tonnersAmountsInstance.amount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: tonnersAmountsInstance, field: 'collectedAt', 'error')} required">
	<label for="collectedAt">
		<g:message code="tonnersAmounts.collectedAt.label" default="Collected At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="collectedAt" precision="day"  value="${tonnersAmountsInstance?.collectedAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: tonnersAmountsInstance, field: 'tonner', 'error')} required">
	<label for="tonner">
		<g:message code="tonnersAmounts.tonner.label" default="Tonner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tonner" name="tonner.id" from="${livebill.Tonners.list()}" optionKey="id" required="" value="${tonnersAmountsInstance?.tonner?.id}" class="many-to-one"/>

</div>

