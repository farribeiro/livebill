
<%@ page import="livebill.PrintersSupplies" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'printersSupplies.label', default: 'PrintersSupplies')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-printersSupplies" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-printersSupplies" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list printersSupplies">
			
				<g:if test="${printersSuppliesInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="printersSupplies.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${printersSuppliesInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersSuppliesInstance?.black}">
				<li class="fieldcontain">
					<span id="black-label" class="property-label"><g:message code="printersSupplies.black.label" default="Black" /></span>
					
						<span class="property-value" aria-labelledby="black-label"><g:fieldValue bean="${printersSuppliesInstance}" field="black"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersSuppliesInstance?.colletedAt}">
				<li class="fieldcontain">
					<span id="colletedAt-label" class="property-label"><g:message code="printersSupplies.colletedAt.label" default="Colleted At" /></span>
					
						<span class="property-value" aria-labelledby="colletedAt-label"><g:formatDate date="${printersSuppliesInstance?.colletedAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersSuppliesInstance?.cyan}">
				<li class="fieldcontain">
					<span id="cyan-label" class="property-label"><g:message code="printersSupplies.cyan.label" default="Cyan" /></span>
					
						<span class="property-value" aria-labelledby="cyan-label"><g:fieldValue bean="${printersSuppliesInstance}" field="cyan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersSuppliesInstance?.magenta}">
				<li class="fieldcontain">
					<span id="magenta-label" class="property-label"><g:message code="printersSupplies.magenta.label" default="Magenta" /></span>
					
						<span class="property-value" aria-labelledby="magenta-label"><g:fieldValue bean="${printersSuppliesInstance}" field="magenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersSuppliesInstance?.printer}">
				<li class="fieldcontain">
					<span id="printer-label" class="property-label"><g:message code="printersSupplies.printer.label" default="Printer" /></span>
					
						<span class="property-value" aria-labelledby="printer-label"><g:link controller="printers" action="show" id="${printersSuppliesInstance?.printer?.id}">${printersSuppliesInstance?.printer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersSuppliesInstance?.yellow}">
				<li class="fieldcontain">
					<span id="yellow-label" class="property-label"><g:message code="printersSupplies.yellow.label" default="Yellow" /></span>
					
						<span class="property-value" aria-labelledby="yellow-label"><g:fieldValue bean="${printersSuppliesInstance}" field="yellow"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:printersSuppliesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${printersSuppliesInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
