<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.lang.Math"  %>
    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'table.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/table.css">
	

  </head>
  
  <body>
    <center>
 <table border="1" width="30%" height="30%">
  <tr><th>Subject</th><th>Attendence</th></tr>
<%
String x=String.valueOf(session.getAttribute("id"));
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps1=con.prepareStatement("select technology from addstudent where id=?");    
PreparedStatement ps,ps2;
ps1.setString(1,x);
ResultSet rs,rs1,rs2;
String tech;
double percent,percenta=0;
rs1 = ps1.executeQuery();
  int i=0;
  while(rs1.next())
 
  {
        tech = rs1.getString("technology");
		//session.setAttribute("list",tech);
		ps=con.prepareStatement("select count(*) from attendence where id=? and technology=?");
		ps.setString(1,x);
		ps.setString(2,tech);
		rs=ps.executeQuery();
		rs.next();
	
		int total=rs.getInt(1);
		ps2=con.prepareStatement("select count(*) from attendence where id=? and technology=? and attendence=?");
		ps2.setString(1,x);
		ps2.setString(2,tech);
		ps2.setString(3,"Present");
		rs2=ps2.executeQuery();
		rs2.next();
		double totalp=rs2.getInt(1);
		percent=(totalp/total)*100;
		percent= Math.round(percent * 100.0) / 100.0;
		percenta=percenta+percent;
		i++;
		
		
		
				%>
				
		
<tr>    
<td><b><font color='#663300'><%=tech%></font></b></td>
<td><b><font color='#663300'><%=percent%></font></b></td>




</tr>
<%

  }
double avg=percenta/i;
 %>
 <%//String test=String.valueOf(session.getAttribute("tech[0]")); %>
 
</table>
Overall percentage: <%=avg %>
</center>
  </body>
</html>
