
<%@ page import="livebill.Tonners" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tonners.label', default: 'Tonners')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tonners" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tonners" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tonners">
			
				<g:if test="${tonnersInstance?.referenceModel}">
				<li class="fieldcontain">
					<span id="referenceModel-label" class="property-label"><g:message code="tonners.referenceModel.label" default="Reference Model" /></span>
					
						<span class="property-value" aria-labelledby="referenceModel-label"><g:fieldValue bean="${tonnersInstance}" field="referenceModel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tonnersInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="tonners.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${tonnersInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tonnersInstance?.printer}">
				<li class="fieldcontain">
					<span id="printer-label" class="property-label"><g:message code="tonners.printer.label" default="Printer" /></span>
					
						<g:each in="${tonnersInstance.printer}" var="p">
						<span class="property-value" aria-labelledby="printer-label"><g:link controller="printers" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tonnersInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tonnersInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
