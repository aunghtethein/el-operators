<%@page import="com.jdc.el.MyData"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Expressions</title>
<style>
	button {
		padding: 0.4rem 1rem;
		background-color: purple;
		color: white;
		border: none;
		border-radius: 4px;
		box-shadow: 2px 2px gray;
		margin-top: 20px;
	}
	button:hover {
		background-color: blue;
	}
</style>
</head>
<body>
	<h1>El Expressions</h1>
		
	<c:set var ="data1" scope="page" value="1000"></c:set>

	<%
		pageContext.setAttribute("data", new MyData(100, 50));
		
		request.setAttribute("data1", 100);
		
		session.setAttribute("data1", 50);
		
		application.setAttribute("data1", 20);
		
		request.setAttribute("data2", 200);
		
		request.setAttribute("list",  List.of("Java", "JavaScript", "Kotlin", "TypeScript"));
		request.setAttribute("map", Map.of("key1","Servlet","key2","JSP"));
		
		
	%>
	
	<h3>Arithmetics Operators</h3>
	<table>
		<tr>
			<td>[A + B]</td>
			<td>
				${data.data1}+ ${data.data2} = ${data.data1 + data.data2}
			</td>
		</tr>
		
		<tr>
			<td>[A - B]</td>
			<td>
				${data1} - ${data2} = ${data1 - data2}
			</td>
		</tr>
		
		<tr>
			<td>[A * B]</td>
			<td>
				${data1} * ${data2} = ${data1 * data2}
			</td>
		</tr>
		
		<tr>
			<td>[A / B]</td>
			<td>
				${data1} / ${data2} = ${data1 div data2}
			</td>
		</tr>
		
		<tr>
			<td>[A % B]</td>
			<td>
				${data1} % ${data2} = ${data1 mod data2}
			</td>
		</tr>
	</table>
	
	
	<h3>Relational Operator</h3>
	<table>
	
		<tr>
			<td>Equal</td>
			<td>
				${(data1 + 100) eq data2 ? "Data 1 is equal Data 2" : "Data 1 is equal not Data 2"}
			</td>
		</tr>
		
		<tr>
			<td>Not Equal</td>
			<td>
				${data1 ne data2 ? "Data 1 is not equal Data 2" : "Data 1 is equal  Data 2"}
			</td>
		</tr>
		
		<tr>
			<td>Greater Than</td>
			<td>
				${data1 gt data2 ? "Data 1 is greater than Data 2" : "Data 1 is not greater than Data 2"}
			</td>
		</tr>
		
		<tr>
			<td>Less Than</td>
			<td>
				${data1 lt  data2 ? "Data 1 is  less than Data 2" : "Data 1 is not less than Data 2" }
			</td>
		</tr>
		
		<tr>
			<td>List [1]</td>
			<td>
				${ list[1]}
			</td>
		</tr>
		
		<tr>
			<td>List</td>
			<td>
				<ul>
					<c:forEach var="data" items="${list}">
						<li>
							<c:out value="${data}"></c:out>
						</li>
					</c:forEach>
				</ul>
			</td>
		</tr>
		
		
			<tr>
			<td>Map ['key1']</td>
			<td>
				${ map['key1'] }
			</td>
		</tr>
	</table>


	<h3>Request Parameter</h3>
	<form>
		<div style="display: flex; flex-direction: column; align-items: flex-start; " >
			<label>Name</label>
			<input type="text" name="name" />
		</div>
		
		<div style="display: flex; flex-direction: column; margin-top: 10px">
			<label>Courses</label>
			
			<div>
				<input id="Java" value="Java" type="checkbox" name="course" />
				<label for="Java" style="margin-right: 8px">Java</label>
				
				<input id="JavaScript" value="JavaScript" type="checkbox" name="course" />
				<label for="JavaScript" style="margin-right: 8px">JavaScript</label>
				
				<input id="Kotlin" value="Kotlin" type="checkbox" name="course" />
				<label for="Kotlin" style="margin-right: 8px">Kotlin</label>
				
				<input id="TypeScript" value="TypeScript" type="checkbox" name="course" />
				<label for="TypeScript" style="margin-right: 8px">TypeScript</label>
				
			</div>
		</div>
		
		<div>
				<button type="submit">Send</button>
		</div>
		
	</form>
	
	<div>
		${param.name}
	</div>
	
	<div>
		${param['name'] }
	</div>
	
	<div>
		${paramValues.course[0] }
	</div>
	<div>
		${paramValues.course[1] }
	</div>
</body>
</html>