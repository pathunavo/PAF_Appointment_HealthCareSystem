<%@page import="com.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/style.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/appointments.js"></script>

</head>
<body>
<div class="container">
	<div class="row" >
		<div class="col-6">
			<h1>MAKE AN APPOINTMENT</h1>
			
			<form id="formAppointment" name="formAppointment" method="post" action="appointments.jsp">

				Register No:
				<input id="patientRegNo" name="patientRegNo" type="text" class="form-control form-control-sm">
				<br>
				 
				Date:
				<input id="appoDate" name="appoDate" type="Date" class="form-control form-control-sm">
				<br>
				
				Time:
				<input id="appoTime" name="appoTime" type="Time" class="form-control form-control-sm">
				<br>
				 
				CheckupNeed:
				<input id="checkupNeed" name="checkupNeed" type="text" class="form-control form-control-sm">
				<br>
				
				Doctor Name:
				<input id="docName" name="docName" type="text" class="form-control form-control-sm">
				<br>
				
				<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
				<input type="hidden" id="hidAppoIDSave" name="hidAppoIDSave" value="">
				
				
			</form>
			
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			<br>

			<div id="divItemsGrid">
				<%
					Appointment appoObj = new Appointment();
					out.print(appoObj.readAppointment());
				%>
			</div>
		</div>
	</div>
</div>
</body>
</html>