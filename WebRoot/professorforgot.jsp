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
    
    <title>My JSP 'professorforgot.jsp' starting page</title>
    
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
String ID= request.getParameter("id");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
        Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select PASSWORD from professor where id='" + ID + "'");%>
    
    
    
    <jsp:include page="mainheader.html" />
    <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
    
    <% while (rs.next()) {%>
        
       <% out.print("Your Password is "+ rs.getString(1)+ " <br>" );
      %>
      
      <% }
       out.print("<a href='professorlogin2.html'>Login</a>");%>
       
       <%
     rs = st.executeQuery("select PASSWORD from professor where id='" + ID + "'");
     if(!rs.next())     
     {%>
        <% out.print("Invalid ID <br><a href='professorforgot.html'>try again</a>");%>
        
    <% }
  

 %>
</center></div></div></div>
  
  </body>
</html>
