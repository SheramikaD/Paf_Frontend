package model;
import java.sql.*; 

public class Interruption {
	
	//A common method to connect to the DB
		private static String url = "jdbc:mysql://localhost:3306/electricity_interruptions";
		private static String userName = "root";
		private static String password = "";
	private Connection connect() 
	 { 
	 Connection con = null; 
	 try
	 { 
	 Class.forName("com.mysql.jdbc.Driver"); 
	 
	 //Provide the correct details: DBServer/DBName, username, password 
	 con= DriverManager.getConnection(url,userName,password);
	 //For testing
	 System.out.print("Successfully connected");
	 } 
	 catch (Exception e) 
	 { 
	 	System.out.println("Database connection is not success!!!");
	 }
	 return con; 
	 } 

	// INSERT Interruption details to the database
	public String insertInterruptions(String Province, String District, String Date, String InterruptTime, String RestoreTime) 
	 { 
	 String output = ""; 
	 try
	 { 
	 Connection con = connect(); 
	 if (con == null) 
	 {return "Error while connecting to the database for inserting."; } 
	 // create a prepared statement
	 String query = "insert into electricity_interruptions.interruption_table(interruptionid,province,districts,date,interrupttime,restoretime) values (?,?,?,?,?,?)"; 

	 PreparedStatement preparedStmt = con.prepareStatement(query);
	 // binding values
	 preparedStmt.setInt(1, 0);
	 preparedStmt.setString(2, Province);
	 preparedStmt.setString(3, District);
	 preparedStmt.setString(4, Date);
	 preparedStmt.setString(5, InterruptTime);
	 preparedStmt.setString(6, RestoreTime);


	//execute the statement
	preparedStmt.execute();
	con.close();
	output = "Inserted successfully";
	}
	catch (Exception e)
	{
	output = "Error while inserting";
	System.err.println(e.getMessage());
	}
	return output;
	}

	//RETRIVE Interruptions details

	public String readInterruptions()
	{
	String output = "";
	try
	{
	Connection con = connect();
	if (con == null)
	{
	return "Error while connecting to the database for reading.";
	}
	// Prepare the html table to be displayed
	output = "<table border='1'><tr><th>Province</th>"
	+"<th>District</th><th>Date</th>"
	+ "<th>Interrupt Time</th>"+"<th>Restore Time</th>";
	//+ "<th>Update</th><th>Remove</th></tr>";
	String query = "select * from interruption_table";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	// iterate through the rows in the result set
	while (rs.next())
	{
	String interruptionid = Integer.toString(rs.getInt("interruptionid"));
	String province = rs.getString("province");
	String district = rs.getString("district");
	String date = rs.getString("date");
	String interrupttime = rs.getString("interrupttime");
	String restoretime = rs.getString("restoretime");

	// Add a row into the html table
	output += "<tr><td>" +province  + "</td>";
	output += "<td>" + district + "</td>";
	output += "<td>" + date  + "</td>";
	output += "<td>" + interrupttime + "</td>";
	output += "<td>" + restoretime + "</td>";

	// buttons

	output += "<td><form method='post' action='interruption.jsp'>"/*"<td><input name='btnUpdate' "
	+ " type='button' value='Update'></td>"*/

	/*+ "<input name='btnRemove' "
	+ " type='submit' value='Remove'>"
	+ "<input name='itemID' type='hidden' "
	+ " value='" + interruptionid + "'>"*/ + "</form></td></tr>";
	}

	con.close();

	// Complete the html table
	output += "</table>";
	}

	catch (Exception e)
	{
	output = "Error while reading the items.";
	System.err.println(e.getMessage());
	}
	return output;
	}
	//UPDATE Interruption data 

		public String updateInterruptions(String interruptionid, String province, String district, String date, String interrupttime, String restoretime)
		
		{
		    String output = "";
		try
		{
		   Connection con = connect();
		   if (con == null)
		    {  return "Error while connecting to the database for updating."; }
		// create a prepared statement
		  String query = "UPDATE interruption_table SET province=?,districts=?,date=?,interrupttime=?,restoretime=? WHERE interruptionid=?";
		  PreparedStatement preparedStmt = con.prepareStatement(query);
		// binding values
		   preparedStmt.setString(1, province);
		   preparedStmt.setString(2, district);
		   preparedStmt.setString(3, date);
		   preparedStmt.setString(4, interrupttime);
		   preparedStmt.setString(5, restoretime);
		   preparedStmt.setInt(6, Integer.parseInt(interruptionid));
		// execute the statement
		   preparedStmt.execute();
		   con.close();
		   output = "Updated successfully";
		}
		catch (Exception e)
		{
		   output = "Error while updating the item.";
		    System.err.println(e.getMessage());
		}
		   return output;
	}


	//Remove Interruption details from the database
		
	public String deleteInterruptions(String Interuptiondata)
	{
	String output = "";
	try
	{
	Connection con = connect();
	if (con == null)
	{
	return "Error while connecting to the database for deleting.";
	}
	// create a prepared statement
	String query = "delete from interruption_table where interruptionid=?";
	PreparedStatement preparedStmt = con.prepareStatement(query);
	// binding values
	preparedStmt.setInt(1, Integer.parseInt(Interuptiondata));
	// execute the statement
	preparedStmt.execute();
	con.close();
	output = "Deleted successfully";
	}
	catch (Exception e)
	{
	output = "Error while deleting the item.";
	System.err.println(e.getMessage());
	}
	return output;
	}

}
