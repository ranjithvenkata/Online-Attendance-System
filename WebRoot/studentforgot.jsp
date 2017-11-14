<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentforgot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#009966">
<%
String ID= request.getParameter("id");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
        Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select PASSWORD from student where id='" + ID + "'");
    if (rs.next()) {%>
        <jsp:include page="mainheader.html" />
   <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
        <% out.print("Your Password is "+ rs.getString(1));
      
        out.print("<br><a href='studentlogin.html'>Sign in</a>");
          %>
          </center></div></div></div>
    <% } else {%>
    <jsp:include page="mainheader.html" />
   <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
        <% out.print("Invalid ID <br><a href='studentforgot.html'>try again</a>");%>
    </center></div></div></div>
<% }%>





  </body>
</html>
