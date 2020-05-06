<%@page import="com.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/style.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/appointments.js"></script>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<div class="container">
</div>
	<div class="row">
	
         <div class="column">
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
				 <div class="column">
			 
			<h1>DOCTOR'S AVAILABILITY</h1>
			
			<form id="formDocShedule" name="formDocShedule" method="post" action="appointments.jsp">
			 
			 
<table>
  <tr>
    <th>Checkup Type</th>
    <th>Doctor Name</th>
    <th>Avaiable Days</th>
    <th>Available Time</th>
  </tr>
  <tr>
    <td>Health checks for your heart</td>
    <td>Dr.Swarna Pathirana</td>
    <td>Monday</td>
    <td>2.30PM-8.30PM</td>
  </tr>
  <tr>
    <td>Health checks for diabetest</td>
    <td>Dr.Kumara Raj</td>
    <td>Monday and Tuesday</td>
    <td>4.30PM-10.30PM</td>
  </tr>
  <tr>
    <td>Health checks for eye conditions</td>
    <td>Dr.Rukmani Pannila</td>
    <td>Wednessday and Friday</td>
    <td>8.00AM-1.30PM</td>
  </tr>
  <tr>
    <td>Health checks for your bones</td>
    <td>Dr.Palitha Kumar</td>
    <td>Wednessday and Sunday</td>
    <td>2.30PM-8.30PM</td>
  </tr>
  <tr>
    <td>Breast cancer screening</td>
    <td>Dr.Naduni Ganga</td>
    <td>Saturday and Sunday</td>
    <td>4.30PM-11.30PM</td>
  </tr>
  <tr>
    <td>Cervical Screening Test</td>
    <td>Dr.Maduri Fernando</td>
    <td>Moday</td>
    <td>9.30AM-5.30PM</td>
  </tr>
  <tr>
    <td>STI screening</td>
    <td>Dr.Naduni Jaya</td>
    <td>Thursday and Friday</td>
    <td>10.30AM-6.30PM</td>
  </tr>
  <tr>
    <td>Pregnancy</td>
    <td>Dr.francy Jaya</td>
    <td>Thursday and Friday</td>
    <td>10.30AM-6.30PM</td>
  </tr>
</table>
</form>
</div>
</body>
</html>