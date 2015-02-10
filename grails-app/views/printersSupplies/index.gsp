
<%@ page import="livebill.PrintersSupplies" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'printersSupplies.label', default: 'PrintersSupplies')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-printersSupplies" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-printersSupplies" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'printersSupplies.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="black" title="${message(code: 'printersSupplies.black.label', default: 'Black')}" />
					
						<g:sortableColumn property="colletedAt" title="${message(code: 'printersSupplies.colletedAt.label', default: 'Colleted At')}" />
					
						<g:sortableColumn property="cyan" title="${message(code: 'printersSupplies.cyan.label', default: 'Cyan')}" />
					
						<g:sortableColumn property="magenta" title="${message(code: 'printersSupplies.magenta.label', default: 'Magenta')}" />
					
						<th><g:message code="printersSupplies.printer.label" default="Printer" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${printersSuppliesInstanceList}" status="i" var="printersSuppliesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${printersSuppliesInstance.id}">${fieldValue(bean: printersSuppliesInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: printersSuppliesInstance, field: "black")}</td>
					
						<td><g:formatDate date="${printersSuppliesInstance.colletedAt}" /></td>
					
						<td>${fieldValue(bean: printersSuppliesInstance, field: "cyan")}</td>
					
						<td>${fieldValue(bean: printersSuppliesInstance, field: "magenta")}</td>
					
						<td>${fieldValue(bean: printersSuppliesInstance, field: "printer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${printersSuppliesInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
