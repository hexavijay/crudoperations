<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Person Page</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
    $( "#datepicker" ).datepicker();
  });

</script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
</head>
<body>
	<h1>Add a Person</h1>

	<c:url var="addAction" value="/person/add"></c:url>

	<form:form action="${addAction}" commandName="person">
		<table>
			<c:if test="${!empty person.name}">
				<tr>
					<td><form:label path="personid">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="personid" readonly="true" size="8"
							disabled="true" /> <form:hidden path="personid" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="country">
						<spring:message text="country" />
					</form:label></td>
				<td>
					<%--   <form:input path="country" /> --%> <form:select
						path="country">
						<form:option value="india">INDIA</form:option>
						<form:option value="japan">JAPAN</form:option>
						<form:option value="usa">USA</form:option>
						<form:option value="china">CHINA</form:option>
					</form:select>
				</td>
			</tr>

			<tr>
				<td><form:label path="salary">
						<spring:message text="Salary" />
					</form:label></td>
				<td><form:input path="salary" /></td>
			</tr>
			<tr>
				<td><form:label path="DOB">
						<spring:message text="DOB" />
					</form:label></td>
				<td><form:input path="DBO" /></td>
			</tr>

			<tr>
				<td colspan="2"><c:if test="${!empty person.name}">
						<input type="submit" value="<spring:message text="Edit Person"/>" />
					</c:if> <c:if test="${empty person.name}">
						<input type="submit" value="<spring:message text="Add Person"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br>
	<h3>Persons List</h3>
	<c:if test="${!empty listPersons}">
		<table class="tg">
			<tr>
				<th width="80">Person ID</th>
				<th width="80">Person EID</th>
				<th width="120">Person Name</th>
				<th width="120">Person Country</th>
				<th width="80">Person Salary</th>
				<th width="80">Person DOB</th>

				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listPersons}" var="person">
				<tr>
					<td>${person.personid}</td>
					<td>${person.eId}</td>
					<td>${person.name}</td>
					<td>${person.country}</td>
					<td>${person.salary}</td>
					<td>${person.DOB}</td>
					
					<td><a href="<c:url value='/edit/${person.personid}' />">Edit</a></td>
					<td><a href="<c:url value='/remove/${person.personid}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
