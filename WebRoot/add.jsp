<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ include file="success.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body bgcolor="#009966"><h3> 
Student Request pending for confirmation: </h3><br/><div align="center"><form action="add1.jsp" method="post">  
<table height="172" width="630" border="1">  
  <tr><th>ID</th><th>NAME</th><th>STATUS</th></tr>  
<%   
String t1=String.valueOf(session.getAttribute("tid"));  
String t2=String.valueOf(session.getAttribute("tech"));  
Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");  
    //String email=request.getParameter("emailid");  
PreparedStatement ps=con.prepareStatement("select id from pending where tid=? and subject=? and status=?");  
ps.setString(1,t1);  
ps.setString(2,t2);
ps.setString(3,"Pending");  
PreparedStatement ps1;  
  
  
ResultSet rs,rs1;  
rs = ps.executeQuery();  
  while(rs.next())  
  {  
      String ID = rs.getString("id");  
      ps1=con.prepareStatement("select name from student where id=?");  
ps1.setString(1,ID);  
rs1=ps1.executeQuery(); 
rs1.next();  
String name=rs1.getString("name");  
      %>  
<tr><td><%=ID %><br></td><td><%=name %><br></td><td><input type="radio" value="Accept" name="<%=ID %>">Accept&nbsp;<input type="radio" value="Decline" name="<%=ID%>">Decline&nbsp;<input type="radio" value="Pending" name="<%=ID%>">Review Later</td></tr>	  
<%   
}	  
  
%>  
    
  
      
  
</table>  
<div align="center"><input type="submit" value="Add"> 
</div></form></div>


</body>
</html>