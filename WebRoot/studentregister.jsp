<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentregister.jsp' starting page</title>
    
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
    String id = request.getParameter("id");    
    String name = request.getParameter("name");
    String emailid = request.getParameter("emailid");
    String password = request.getParameter("password");
    //String technology = request.getParameter("technology");
    String mblno = request.getParameter("mblno");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
         Statement st = con.createStatement();
    //ResultSet rs;
    int i=0;
    try
    {
    i= st.executeUpdate("insert into student(id, name,emailid,password,mblno) values ('" + id + "','" + name + "','" + emailid + "','" + password + "','" + mblno + "')");
    }
   catch(SQLException e)
   {%>
   <jsp:include page="mainheader.html" />
   <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
  <%out.println("Your ID has been taken by another user.Contact college staff");%>
  </center></div></div>
  <%}
    if (i > 0) {
        response.sendRedirect("studentwelcome.jsp");
    } 
    
%>
    
  </body>
</html>
