<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="studentsuccessnew.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis</title>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<center>
 <table border="1" width="30%" height="30%">
  <tr><th>ID</th><th>Attendence</th><th>Technology</th><th>ToDate</th></tr>
<%
String x=String.valueOf(session.getAttribute("id"));
String y=request.getParameter("subj");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select * from attendence where id=? and technology=?");
ps.setString(1,x);
ps.setString(2,y);
ResultSet rs;
rs = ps.executeQuery();
  while(rs.next())
  {
      String ID = rs.getString("id");
		String Attendence = rs.getString("attendence");
		String Technology= rs.getString("technology");
		String ToDate= rs.getString("todate");
		%>
		
<tr>    
<td><b><font color='#663300'><%=ID%></font></b></td>
<td><b><font color='#663300'><%=Attendence%></font></b></td>
<td><b><font color='#663300'><%=Technology%></font></b></td>
<td><b><font color='#663300'><%=ToDate%></font></b></td>


</tr>
<%

  }

 %>
 
</table>
 
</center>

</body>
</html>