$(document).ready(function()
{
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

//SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateAppointmentForm();
	
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var method = ($("#hidAppoIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "AppointmentsAPI",
		type : method,
		data : $("#formAppointment").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onAppointmentSaveComplete(response.responseText, status);
		}
	});
});

function onAppointmentSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} 
	else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidAppoIDSave").val("");
	$("#formAppointment")[0].reset();
}


//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidAppoIDSave").val($(this).closest("tr").find('#hidAppoIDUpdate').val());
	$("#patientRegNo").val($(this).closest("tr").find('td:eq(0)').text());
	$("#appoDate").val($(this).closest("tr").find('td:eq(1)').text());
	$("#appoTime").val($(this).closest("tr").find('td:eq(2)').text());
	$("#checkupNeed").val($(this).closest("tr").find('td:eq(3)').text());
	$("#docName").val($(this).closest("tr").find('td:eq(4)').text());
});


//REMOVE==========================================
$(document).on("click", ".btnRemove", function(event)
{
	$.ajax(
	{
		url : "AppointmentsAPI",
		type : "DELETE",
		data : "appoID=" + $(this).data("appoid"),
		dataType : "text",
		complete : function(response, status)
		{
			onAppointmentDeleteComplete(response.responseText, status);
		}
	});
});

function onAppointmentDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} 
	else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


function validateAppointmentForm()
{
	// CODE
	if ($("#patientRegNo").val().trim() == "")
	{
		return "Insert patient reg no.";
	}
	
	// NAME
	if ($("#appoDate").val().trim() == "")
	{
		return "Insert Date.";
	}
	
	//PRICE-------------------------------
	if ($("#appoTime").val().trim() == "")
	{
		return "Insert time.";
	}
	if ($("#checkupNeed").val().trim() == "")
	{
		return "Insert checkup.";
	}
	if ($("#docName").val().trim() == "")
	{
		return "Insert doc name.";
	}
	return true;
}