<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%



Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    String sql = "SELECT * FROM addstudent where technology='php'";
PreparedStatement ps = con.prepareStatement(sql);


ResultSet rst = ps.executeQuery();
int i=0;
%>
<body bgcolor="lightblue">
<center>
<h1>Will be deleting an Existing Students</h1>
<h4> List of Students</h4>
<form  method=post action="deletesuccess.jsp">
<table border="1">
<tr><td>Select</td>
<td>ID</td>
<td>NAME</td>
<td>Email</td>
<td>Mblno</td>
<td>Technology</td>
</tr>
<%
while(rst.next())
{
%>
<tr>
<td><input type="checkbox" name="check<%=i%>"
value=<%=rst.getInt(1)%>></td>
<td><%=rst.getString(1)%></td>
<td><%=rst.getString(2)%></td>
<td><%=rst.getString(3)%></td>
<td><%=rst.getString(4)%></td>
<td><%=rst.getString(5)%></td>
</tr>
<%}%>
</table>
<input type="submit" value="Delete"></form>
</center>
</body>

</html>