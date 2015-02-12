
<%@ page import="livebill.TonnersAmounts" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tonnersAmounts.label', default: 'TonnersAmounts')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tonnersAmounts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tonnersAmounts" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tonnersAmounts">
			
				<g:if test="${tonnersAmountsInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="tonnersAmounts.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${tonnersAmountsInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tonnersAmountsInstance?.collectedAt}">
				<li class="fieldcontain">
					<span id="collectedAt-label" class="property-label"><g:message code="tonnersAmounts.collectedAt.label" default="Collected At" /></span>
					
						<span class="property-value" aria-labelledby="collectedAt-label"><g:formatDate date="${tonnersAmountsInstance?.collectedAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tonnersAmountsInstance?.tonner}">
				<li class="fieldcontain">
					<span id="tonner-label" class="property-label"><g:message code="tonnersAmounts.tonner.label" default="Tonner" /></span>
					
						<span class="property-value" aria-labelledby="tonner-label"><g:link controller="tonners" action="show" id="${tonnersAmountsInstance?.tonner?.id}">${tonnersAmountsInstance?.tonner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tonnersAmountsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tonnersAmountsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
