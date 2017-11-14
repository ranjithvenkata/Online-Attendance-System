<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>
    



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'studentview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/table.css">
	

  </head>
  
  <body bgcolor="#009966">
    <center>
  <table border="1" width="30%" height="30%">
  <tr><th>ID</th><th>NAME</th><th>Email</th><th>Mblno</th></tr>
<%
String x2=String.valueOf(session.getAttribute("id"));
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps3=con2.prepareStatement("select * from student where id=?");
ps3.setString(1,x2);
ResultSet rs3;
rs3 = ps3.executeQuery();
  while(rs3.next())
  {
      String ID = rs3.getString("id");
		String NAME = rs3.getString("name");
		String Email = rs3.getString("emailid");
		String Mblno = rs3.getString("mblno");
		//String Technology = rs.getString("technology");
%>
<tr>    
<td><b><font color='#663300'><%=ID%></font></b></td>
<td><b><font color='#663300'><%=NAME%></font></b></td>
<td><b><font color='#663300'><%=Email%></font></b></td>
<td><b><font color='#663300'><%=Mblno%></font></b></td>
</tr>
<%
  }
 %>
 </table>
 
 </center>

    
  </body>
</html>
