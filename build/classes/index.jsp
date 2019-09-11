<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<h1 align="center">data from 'girlfriends' database</h1>
<table align="center" cellpadding="3" cellspacing="5" border="1">
<tr>
<td><b>name</b></td>
<td><b>hotness</b></td>
<td><b>haircolor</b></td>
</tr>

<%	
try {
		//defining sql db driver to use
		Class.forName("com.mysql.jdbc.Driver"); 
		//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/tinderdates", "root", "rootadmin");
		
		//prepared   statement is used for secure access
		// select * from db where ? meets field conditions
		PreparedStatement oPrStmt = con
				.prepareStatement("select * from girlfriends");//no field conditions = select all
		
		ResultSet resultSet = oPrStmt.executeQuery();	//execute query
		
		while(resultSet.next()) { 						//while loop through all results
%>
<tr>
<td> <%=resultSet.getString("name") %> </td>
<td> <%=resultSet.getInt("hotness") %> </td>
<td> <%=resultSet.getString("haircolor") %></td>
</tr>


<% }
}catch (Exception e) {
	System.out.println(e);
}
%>
</table>