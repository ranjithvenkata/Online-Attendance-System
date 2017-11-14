<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'authenticate.jsp' starting page</title>
    
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
   String code=request.getParameter("code");
   String acode ="qwerty";
   if(code.equals(acode))
   {
   RequestDispatcher rs=request.getRequestDispatcher("professorregister.jsp");
   rs.forward(request,response);
   }
   else
   {%>
   <jsp:include page="mainheader.html" />
   <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
 <% out.print("You are not authenticated to access this space"); %>
   
   <br><a href="professorlogin2.html">Back to login</a>
   </center></div></div></div>
   <%}
   %>
  </body>
</html>
