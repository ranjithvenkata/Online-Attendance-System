<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modify1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <% 
  String a=request.getParameter("attend");
  String x=request.getParameter("id");
    String y=String.valueOf(session.getAttribute("tech"));
    String d=request.getParameter("date");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
Statement s=con.createStatement();
String sql="update attendence set attendence='"+a+"' where id='"+x+"' and technology='"+y+"' and todate='"+d+"'";

int k;
k = s.executeUpdate(sql); %>
Attendance Record has been modified. 

<br/><a href="success.jsp"> Home </a>
  </body>
</html>
