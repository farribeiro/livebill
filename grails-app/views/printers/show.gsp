
<%@ page import="livebill.Printers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'printers.label', default: 'Printers')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-printers" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-printers" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list printers">
			
				<g:if test="${printersInstance?.createdAt}">
				<li class="fieldcontain">
					<span id="createdAt-label" class="property-label"><g:message code="printers.createdAt.label" default="Created At" /></span>
					
						<span class="property-value" aria-labelledby="createdAt-label"><g:formatDate date="${printersInstance?.createdAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersInstance?.departament}">
				<li class="fieldcontain">
					<span id="departament-label" class="property-label"><g:message code="printers.departament.label" default="Departament" /></span>
					
						<span class="property-value" aria-labelledby="departament-label"><g:fieldValue bean="${printersInstance}" field="departament"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="printers.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:fieldValue bean="${printersInstance}" field="manufacturer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="printers.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${printersInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersInstance?.pages}">
				<li class="fieldcontain">
					<span id="pages-label" class="property-label"><g:message code="printers.pages.label" default="Pages" /></span>
					
						<g:each in="${printersInstance.pages}" var="p">
						<span class="property-value" aria-labelledby="pages-label"><g:link controller="null" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${printersInstance?.printedPages}">
				<li class="fieldcontain">
					<span id="printedPages-label" class="property-label"><g:message code="printers.printedPages.label" default="Printed Pages" /></span>
					
						<span class="property-value" aria-labelledby="printedPages-label"><g:fieldValue bean="${printersInstance}" field="printedPages"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${printersInstance?.updatedAt}">
				<li class="fieldcontain">
					<span id="updatedAt-label" class="property-label"><g:message code="printers.updatedAt.label" default="Updated At" /></span>
					
						<span class="property-value" aria-labelledby="updatedAt-label"><g:formatDate date="${printersInstance?.updatedAt}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:printersInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${printersInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
