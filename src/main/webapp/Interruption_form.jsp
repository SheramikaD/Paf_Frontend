<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>




<%@page import="model.*"%>

<%
if (request.getParameter("province") != null) {
	Interruption userObj = new Interruption();
	String stsMsg = userObj.insertInterruptions(request.getParameter("province"), request.getParameter("district"),
			request.getParameter("date"), request.getParameter("interrupttime"),
			request.getParameter("restoretime"));
	
	session.setAttribute("statusMsg", stsMsg);
%>

<script>
	alert("Reister succsees");
	window.location.replace("Interruption_details.jsp");
</script>

<%
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Interruption Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<style type="text/css">
.myDiv {
	border-radius: 5px;
	background-color: #f2f2f2;
	margin: 20px;
	padding: 50px;
}
</style>


</head>
<body>
	<nav>
		<input type="checkbox" id="check"> <label for="check"
			class="checkbtn"> <i class="fas fa-bars"></i>
		</label> <img style="max-width: 250px;" class="logo" src="img/mainlogo5.png">

		<ul>
			<li><a class="active" href="#">Home</a></li>
			<li><a href="#">solar request</a></li>
			<li><a href="#">power cut schedule</a></li>
			<li><a href="#">About US</a></li>
			<li><a href="#">COntact Us</a></li>
			<li><a href="#">My Account</a></li>
		</ul>
	</nav>
	<section>
		<div class="myDiv">
			<form >

				<label for="province">Province</label><br> <br> <select
					id="province" name="province">
					<option>Select Province</option>
					<option value="Central Province">Central Province</option>
					<option value="Eastern Province">Eastern Province</option>
					<option value="Northern Province">Northern Province</option>
					<option value="Southern Province">Southern Province</option>
					<option value="Western Province">Western Province</option>
					<option value="North Western Province ">North Western
						Province</option>
					<option value="North Central Province">North Central
						Province</option>
					<option value="Uva Province ">Uva Province</option>
					<option value="Sabaragamuwa Province ">Sabaragamuwa
						Province</option>
				</select> 
				
				<label for="district">Province</label><br> <br> <select
					id="district" name="district">
					<option>Select Districts</option>
					<option value="Colombo">Colombo</option>
					<option value="Gampaha">Gampaha</option>
					<option value="Kalutara">Kalutara</option>
					<option value="Kandy">Kandy</option>
					<option value="Matale">Matale</option>
					<option value="Nuwara Eliya">Nuwara Eliya</option>
					<option value="Galle">Galle</option>
					<option value="Matara">Matara</option>
					<option value="Hambantota">Hambantota</option>
					<option value="Jaffna">Jaffna</option>
					<option value="Kilinochchi">Kilinochchi</option>
					<option value="Mannar">Mannar</option>
					<option value="Vavuniya">Vavuniya</option>
					<option value="Mullaitivu">Mullaitivu</option>
					<option value="Batticaloa">Batticaloa</option>
					<option value="Ampara">Ampara</option>
					<option value="Kurunegala">Kurunegala</option>
					<option value="Puttalam">Puttalam</option>
					<option value="Anuradhapura">Anuradhapura</option>
					<option value="Polonnaruwa">Polonnaruwa</option>
					<option value="Badulla">Badulla</option>
					<option value="Moneragala">Moneragala</option>
					<option value="Ratnapura">Ratnapura</option>
					<option value="Kegalle">Kegalle</option>
				</select> 	

				 <label for=" date">Select date</label><br> <br> <input
					id="date" type="date" name="date"> 
					
					<label for=" interrupttime">Interrupt
					Time</label><br> <br> <input id="interrupttime"  type="time" name="interrupttime">
				<label for="RestoreTime">
				
				Restore Time</label><br> <br> <input
					id="restoretime" type="time" name="restoretime"> 
					<input type="submit"
					value="Submit">
			</form>
		</div>

	</section>

</body>
</html>