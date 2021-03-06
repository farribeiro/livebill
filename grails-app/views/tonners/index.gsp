
<%@ page import="livebill.Tonners" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tonners.label', default: 'Tonners')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tonners" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tonners" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="referenceModel" title="${message(code: 'tonners.referenceModel.label', default: 'Reference Model')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'tonners.amount.label', default: 'Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tonnersInstanceList}" status="i" var="tonnersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tonnersInstance.id}">${fieldValue(bean: tonnersInstance, field: "referenceModel")}</g:link></td>
					
						<td>${fieldValue(bean: tonnersInstance, field: "amount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tonnersInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
