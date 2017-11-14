<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentlogin.jsp' starting page</title>
    
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
    //String name=request.getParameter("name");  
    String password = request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
        Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from student where id='" + id + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("id",id);
        String s=String.valueOf(session.getAttribute("id"));
        out.print("welcome " + " " +s);
      
        out.print("<a href='studentlogout.jsp'>Log out</a>");
        response.sendRedirect("studentsuccesshome.jsp");
    } else {
        out.print("Invalid password <br><a href='studentlogin.html'>try again</a>");
    }
%>
  
  </body>
</html>
