<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
        <%@ include file="success.jsp" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Classroom</title>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body bgcolor="#009966">
<center>
  <table border="1" width="30%" height="30%">
  <tr><th>ID</th><th>NAME</th><th>Email</th><th>Mblno</th><th>Technology</th></tr>
<%
String t1=String.valueOf(session.getAttribute("tid"));
String t2=String.valueOf(session.getAttribute("tech"));
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select * from addstudent where tid=? and technology=?");
ps.setString(1,t1);
ps.setString(2,t2);
ResultSet rs = ps.executeQuery();
  while(rs.next())
  {
      String ID = rs.getString("id");
		String NAME = rs.getString("name");
		String Email = rs.getString("emailid");
		String Mblno = rs.getString("mblno");
		String Technology = rs.getString("technology");
%>
<tr>    
<td><b><font color='#663300'><%=ID%></font></b></td>
<td><b><font color='#663300'><%=NAME%></font></b></td>
<td><b><font color='#663300'><%=Email%></font></b></td>
<td><b><font color='#663300'><%=Mblno%></font></b></td>
<td><b><font color='#663300'><%=Technology%></font></b></td>
</tr>
<%
  }
 %>
 </table>
  
 
 </center>

</body>
</html>