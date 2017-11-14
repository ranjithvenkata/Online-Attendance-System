<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="success.jsp" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance Register</title>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<form action="trail.jsp" method="post">

Date:<input type="date" name="todate" required/><br/>
<br/>


<table border="1" width="573" height="172">
  <tr><th>ID</th><th>NAME</th><th>STATUS</th></tr>
<% 
String t1=String.valueOf(session.getAttribute("tid"));
String t2=String.valueOf(session.getAttribute("tech"));
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select * from addstudent where tid=? and technology=?");
ps.setString(1,t1);
ps.setString(2,t2);
ResultSet rs;
rs = ps.executeQuery();
  while(rs.next())
  {
      String ID = rs.getString("id");
		String NAME = rs.getString("name");
	
%>

  
<tr><td><b><font color='#663300'><%=ID%></font></b></td>
<td><b><font color='#663300'><%=NAME%></font></b></td>
<td><input type="radio" name=<%=ID%> value="Present" checked> Present
<input type="radio" name=<%=ID%> value="Absent"> Absent</td>
</tr>
<%
  }
 %>
 </table>
 <div align="center"><input type="submit" value="Submit"> 
 </div></form>
 
 
 

  

</body>
</html>