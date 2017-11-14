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
    
    <title>My JSP 'enroll1.jsp' starting page</title>
    
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
<%String sub=request.getParameter("sub");
session.setAttribute("sub",sub);
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select name from professor where technology=?");
ps.setString(1,sub);
ResultSet rs=ps.executeQuery();%>
<div align="center">
<h4>Request:</h1>
<form action="pending.jsp" method="post">
<select name="teach">

<% while(rs.next())
{
String name=rs.getString(1);
%>
  <option value=<%=name %>><%=name %></option>
  
 <%} %> 
</select>
<br/><br/>
<input type="submit" value="send Request"> 
</div></form>


 
  </body>
</html>
