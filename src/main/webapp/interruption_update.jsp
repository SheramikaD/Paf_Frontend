<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>



<%@page import="model.*"%>

<%
if (request.getParameter("interruptionid") != null) {
	Interruption userObj = new Interruption();
	String interruptionid=request.getParameter("interruptionid");
	String province=request.getParameter("province");
	String districts=request.getParameter("districts");
	String date=request.getParameter("date");
	String interrupttime=request.getParameter("interrupttime");
	String restoretime=request.getParameter("restoretime");
	
	
	
	String stsMsg = userObj.updateInterruptions(interruptionid,province,districts,date,interrupttime,restoretime);
	
	session.setAttribute("statusMsg", stsMsg);
	out.println(province + districts);
%>

<script>

	alert("Update succsees");
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
			
			
			 <%
                                            Connection conn;
                                            PreparedStatement pst;
                                            ResultSet rs;

                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_interruptions", "root", "");

                                            String id = request.getParameter("id");
                                            pst = conn.prepareStatement("select * from interruption_table where interruptionid=?");
                                            
                                            
                                            
                                            pst.setString(1, id);
                                            rs = pst.executeQuery();

                                            while (rs.next()) {
                                        %>
				 <input type="hidden" id="interruptionid" name=interruptionid value="<%= rs.getString("interruptionid")%>">
				<label for="province">Province</label><br> <br> <select
					id="province" name="province">
					<option value="<%= rs.getString("province")%>"><%= rs.getString("province")%></option>
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
				<label for="districts">District</label><br> <br> <select
					id="districts" name="districts">
					<option value="<%= rs.getString("districts")%>"><%= rs.getString("districts")%></option>
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
				
				

				 <label for=" date">Select date</label><br> <br> <input
					id="date" type="text" name="date" value="<%= rs.getString("date")%>"> 
					
					<label for=" interrupttime">Interrupt
					Time</label><br> <br> <input id="interrupttime"  type="text" name="interrupttime" value="<%= rs.getString("interrupttime")%>">
				<label for="RestoreTime">
				
				Restore Time</label><br> <br> <input
					id="restoretime" type="text" name="restoretime" value="<%= rs.getString("restoretime")%>"> 
					
					
                                    <%
                                        }
                                    %>
					<input type="submit"
					value="Submit">
			</form>
		</div>

	</section>

</body>
</html>