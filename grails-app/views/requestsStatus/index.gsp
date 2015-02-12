
<%@ page import="livebill.RequestsStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requestsStatus.label', default: 'RequestsStatus')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requestsStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-requestsStatus" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdAt" title="${message(code: 'requestsStatus.createdAt.label', default: 'Created At')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'requestsStatus.description.label', default: 'Description')}" />
					
						<th><g:message code="requestsStatus.request.label" default="Request" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requestsStatusInstanceList}" status="i" var="requestsStatusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requestsStatusInstance.id}">${fieldValue(bean: requestsStatusInstance, field: "createdAt")}</g:link></td>
					
						<td>${fieldValue(bean: requestsStatusInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: requestsStatusInstance, field: "request")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requestsStatusInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
