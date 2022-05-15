package com;
import model.Interruption; 
//For REST Service
import javax.ws.rs.*; 
import javax.ws.rs.core.MediaType; 
//For JSON
import com.google.gson.*; 
//For XML
import org.jsoup.*; 
import org.jsoup.parser.*; 
import org.jsoup.nodes.Document; 
@Path("/interruption") 

public class InterruptionService {
	
	Interruption itemObj = new Interruption();

	//read
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems()
	{
	return itemObj.readInterruptions();
	}
	// Calling INSERT method

		@POST
		@Path("/")
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		@Produces(MediaType.TEXT_PLAIN)
		public String insertItem(@FormParam("province") String province,
		@FormParam("district") String district,
		@FormParam("date") String date,
		@FormParam("interrupttime") String interrupttime,
		@FormParam("restoretime") String restoretime)
		{
		String output = itemObj.insertInterruptions(province, district, date , interrupttime, restoretime);
		return output;
		

		}

	//Calling UPDATE method 

		
			@PUT
			@Path("/")
			@Consumes(MediaType.APPLICATION_JSON)
			@Produces(MediaType.TEXT_PLAIN)
			public String updateInterruptions(String itemData)
			{
			//Convert the input string to a JSON object
			JsonObject itemObject = new JsonParser().parse(itemData).getAsJsonObject();
			//Read the values from the JSON object
			String interruptionid = itemObject.get("interruptionid").getAsString();
			String province = itemObject.get("province").getAsString();
			String district = itemObject.get("district").getAsString();
			String date = itemObject.get("date").getAsString();
			String interrupttime = itemObject.get("interrupttime").getAsString();
			String restoretime = itemObject.get("restoretime").getAsString();
			
			String output = itemObj.updateInterruptions(interruptionid, province,district, date,interrupttime,restoretime);
			return output;
			}
	//Calling DELETE method
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteInterruptions(String itemData)
	{
	//Convert the input string to an XML document
		Document doc = Jsoup.parse(itemData, "", Parser.xmlParser());
	//Read the value from the element <itemID>
	String interruptionid = doc.select("interruptionid").text();
	String output = itemObj.deleteInterruptions(interruptionid);
	return output;
	}
}
