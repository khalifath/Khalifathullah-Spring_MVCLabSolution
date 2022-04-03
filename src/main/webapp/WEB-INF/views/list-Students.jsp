<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
h2 {
	text-align: center;
}
</style>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #276d9d;
  color: white;
}
</style>
<title>Student List</title>
</head>

<body>
	<br>
	<br>
	<div class="container">

		<h2 style="background-color:#276d9d; color: White">Registered
			Student(s)</h2>
		<hr>

		<!-- Add a search form -->

		<form action="/Student-Registration/students/search"
			class="form-inline">

			<!-- Add a button -->
			<a href="/Student-Registration/students/addStudent"
				class="btn btn-primary btn-sm mb-3"> Add Student </a> <input
				type="search" name="name" placeholder="Name"
				class="form-control-sm ml-5 mr-2 mb-3" /> <input type="search"
				name="department" placeholder="Department"
				class="form-control-sm mr-2 mb-3" />

			<button type="submit" class="btn btn-success btn-sm mb-3">Search</button>

		</form>
		<hr>
		<table  id="customers">
			
				<tr style="background-color: #008CBA; color: White">
					<th>Name</th>
					<th>Department</th>
					<th>Country</th>
					<th style="text-align: center;">Action</th>
				</tr>
			

			<tbody>
				<c:forEach items="${Students}" var="tempStudent">
					<tr>
						<td><c:out value="${tempStudent.name}" /></td>
						<td><c:out value="${tempStudent.department}" /></td>
						<td><c:out value="${tempStudent.country}" /></td>
						<td style="text-align: center;">
							<!-- Add "update" button/link --> <a
							href="/Student-Registration/students/updateStudent?studentId=${tempStudent.id}"
							class="btn btn-success btn-sm"> Update </a> <!-- Add "delete" button/link -->
							<a
							href="/Student-Registration/students/delete?studentId=${tempStudent.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this Student?'))) return false">
								Delete </a>

						</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>

</body>
</html>



