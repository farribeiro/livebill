
<%@ page import="livebill.TonnersAmounts" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tonnersAmounts.label', default: 'TonnersAmounts')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tonnersAmounts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tonnersAmounts" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'tonnersAmounts.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="collectedAt" title="${message(code: 'tonnersAmounts.collectedAt.label', default: 'Collected At')}" />
					
						<th><g:message code="tonnersAmounts.tonner.label" default="Tonner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tonnersAmountsInstanceList}" status="i" var="tonnersAmountsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tonnersAmountsInstance.id}">${fieldValue(bean: tonnersAmountsInstance, field: "amount")}</g:link></td>
					
						<td><g:formatDate date="${tonnersAmountsInstance.collectedAt}" /></td>
					
						<td>${fieldValue(bean: tonnersAmountsInstance, field: "tonner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tonnersAmountsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
