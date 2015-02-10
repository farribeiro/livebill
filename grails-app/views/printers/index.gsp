
<%@ page import="livebill.Printers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'printers.label', default: 'Printers')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-printers" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-printers" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdAt" title="${message(code: 'printers.createdAt.label', default: 'Created At')}" />
					
						<g:sortableColumn property="departament" title="${message(code: 'printers.departament.label', default: 'Departament')}" />
					
						<g:sortableColumn property="manufacturer" title="${message(code: 'printers.manufacturer.label', default: 'Manufacturer')}" />
					
						<g:sortableColumn property="model" title="${message(code: 'printers.model.label', default: 'Model')}" />
					
						<g:sortableColumn property="printedPages" title="${message(code: 'printers.printedPages.label', default: 'Printed Pages')}" />
					
						<g:sortableColumn property="updatedAt" title="${message(code: 'printers.updatedAt.label', default: 'Updated At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${printersInstanceList}" status="i" var="printersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${printersInstance.id}">${fieldValue(bean: printersInstance, field: "createdAt")}</g:link></td>
					
						<td>${fieldValue(bean: printersInstance, field: "departament")}</td>
					
						<td>${fieldValue(bean: printersInstance, field: "manufacturer")}</td>
					
						<td>${fieldValue(bean: printersInstance, field: "model")}</td>
					
						<td>${fieldValue(bean: printersInstance, field: "printedPages")}</td>
					
						<td><g:formatDate date="${printersInstance.updatedAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${printersInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
