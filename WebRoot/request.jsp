<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="studentsuccessnew.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/table.css">
	

  </head>
  
  <body>
  <center>
  <h3>Your requests:</h3>
  <br/>
   <%
   String x=String.valueOf(session.getAttribute("id")); 
   Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select subject,tname,status from pending where id=?");
ps.setString(1,x);
ResultSet rs;
rs = ps.executeQuery();
%>
<table border="1" width="30%" height="30%">
<tr><th>Subject</th><th>Teacher</th><th>status</th></th></tr>
<% 
  while(rs.next())
  {
      String subject = rs.getString("subject");
		String tname = rs.getString("tname");
		String status= rs.getString("status");
		
		%>
  
<tr>    
<td><b><font color='#663300'><%=subject%></font></b></td>
<td><b><font color='#663300'><%=tname%></font></b></td>
<td><b><font color='#663300'><%=status%></font></b></td>



</tr>
  
 		
<%

  }

 %>
 
</table>


    </center>
  </body>
</html>
