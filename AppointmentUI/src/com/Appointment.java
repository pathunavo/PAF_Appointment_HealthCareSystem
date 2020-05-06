package com;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.util.TimeZone;


public class Appointment {

	private Connection connect(){
		
	Connection con = null;
			try
				{
				Class.forName("com.mysql.cj.jdbc.Driver");
				//Provide the correct details: DBServer/DBName, username, password
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=" + TimeZone.getDefault().getID(), "root", "");
				}
			catch (Exception e){
				e.printStackTrace();
			}
	return con;
	
	}
	
	//insert-----------------------------------------------------------------------------------------------------------------------------
	
	public String insertAppointment(String patientRegNo, String appoDate, String appoTime, String checkupNeed,String docName)
    {
			String output = "";
			try
			{
				Connection con = connect();
				if (con == null)
				{    
					return "Error while connecting to the database for inserting.";
				}
				// create a prepared statement
				String query = " insert into appointments (`appoID`,`patientRegNo`,`appoDate`,`appoTime`,`checkupNeed`,`docName`)"
						+ " values (?, ?, ?, ?, ?,?)";
				

				PreparedStatement preparedStmt = con.prepareStatement(query);
				// binding values
				preparedStmt.setInt(1, 0);
				preparedStmt.setString(2, patientRegNo);
				preparedStmt.setString(3, appoDate);
				preparedStmt.setString(4, appoTime);
				preparedStmt.setString(5, checkupNeed);
				preparedStmt.setString(6, docName);; 
	
				// execute the statement
				preparedStmt.execute();
				con.close();
				
				String newAppointments = readAppointment();
				output = "{\"status\":\"success\", \"data\": \"" +newAppointments + "\"}";
			}
				catch (Exception e)
			{
					output = "{\"status\":\"error\", \"data\": \"Error while inserting the appointment details.\"}";
					System.err.println(e.getMessage());
			}
			return output;
    		}
	
	
	//view------------------------------------------------------------------------------------------------------------------------
	public String readAppointment(){
		
		String output = "";
			try{
			Connection con = connect();
			
			if (con == null){
				return "Error while connecting to the database for reading."; 
			}
			// Prepare the html table to be displayed
			output = "<table border='1'>"
					+ "<tr><th>patientRegNo</th>"
					+ "<th>appoDate</th>"
					+ "<th>appoTime</th>"
					+ "<th>checkupNeed</th>"
					+ "<th>docName</th>"
					+ "<th>Update</th>"
					+ "<th>Remove</th></tr>";
			
			String query = "select * from appointments";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String appoID = Integer.toString(rs.getInt("appoID"));
				String patientRegNo = rs.getString("patientRegNo");
				java.util.Date appoDate = rs.getDate("appoDate");
				java.util.Date appoTime = rs.getTime("appoTime");
				String checkupNeed = rs.getString("checkupNeed");
				String docName = rs.getString("docName");

				
				// Add into the html table
				output += "<tr><td><input id='hidAppoIDUpdate'name='hidAppoIDUpdate' type='hidden' value='" + appoID+ "'>" + patientRegNo + "</td>";
				output += "<td>" + appoDate + "</td>";
				output += "<td>" + appoTime + "</td>";
				output += "<td>" + checkupNeed + "</td>";
				output += "<td>" + docName + "</td>";
				 // buttons
				
				output += "<td><input name='btnUpdate'type='button' "
						+ "value='Update'class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove'type='button' "
						+ "value='Remove'class='btnRemove btn btn-danger'data-appoid='"+ appoID + "'>" + "</td></tr>";
			}
			
			con.close();
			// Complete the html table
			output += "</table>";
			}
			catch (Exception e){
				output = "Error while reading the appointment details.";
				System.err.println(e.getMessage());
			}
			
	return output;
	
	}
	
	
	//update----------------------------------------------------------------------------------------------------------------
	public String updateAppointment(String appoID, String patientRegNo, String appoDate, String appoTime,
			String checkupNeed, String docName) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE appointments SET patientRegNo=?,appoDate=?,appoTime=?,checkupNeed=?,docName=?"
					+ "WHERE appoID=?";
			

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, patientRegNo);
			preparedStmt.setString(2, appoDate);
			preparedStmt.setString(3, appoTime);
			preparedStmt.setString(4, checkupNeed);
			preparedStmt.setString(5, docName);
			preparedStmt.setInt(6, Integer.parseInt(appoID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newAppointments = readAppointment();
			output = "{\"status\":\"success\", \"data\": \"" + newAppointments + "\"}";;
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while updating the appointment details.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	
	//delete-------------------------------------------------------------------------------------------------------------------
	public String deleteAppointment(String appoID) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {

				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from appointments where appoID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(appoID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newAppointments = readAppointment();
			output = "{\"status\":\"success\", \"data\": \"" + newAppointments + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the appointment deails.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
}
