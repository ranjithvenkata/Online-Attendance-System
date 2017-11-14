<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    String id = request.getParameter("id");    
    String name = request.getParameter("name");
    String emailid = request.getParameter("emailid");
    String password = request.getParameter("password");
    String technology = request.getParameter("technology");
    String mblno = request.getParameter("mblno");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
         Statement st = con.createStatement();
    //ResultSet rs;
    int i=0;
    
   try
   { 
    i = st.executeUpdate("insert into professor(id, name,emailid,password,technology,mblno) values ('" + id + "','" + name + "','" + emailid + "','" + password + "','" + technology + "','" + mblno + "')");
    }  
    catch(SQLException e)
    {%>
    <jsp:include page="mainheader.html" />
   <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
    <%out.print("Your ID and Subject have been taken by another user,Try again");%>
    </center></div></div></div>
    <% }
   
    
    if (i > 0) 
    {
        response.sendRedirect("welcome.jsp");
    } 
    
   
    
%>

</body>
</html>