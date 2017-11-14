<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!-- This is header for all -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'studentsuccess.jsp' starting page</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
<link href='http://fonts.googleapis.com/css?family=Sintony:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>
  </head>
  
  <body bgcolor="#eeeeee">
    <center>

<% 
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") == "")) { 
%>
You are not logged in<br/>
<a href="studentlogin.html">Please Login</a>
<%} else {
%>
<div class="header">
	<div class="container">
		<div class="header-main">
			 <div class="logo">
                             <h1><a href="studentsuccesshome.jsp"><img src="images/logojntuh.jpg"> JNTUH<span class="logo-clr"></span></a></h1>
			 </div><br/>
			 <div class=" ">
			   <div class="top-nav">
			   		<span class="menu"> <img src="images/icon.png" alt=""/></span>
					<ul class="res">
						<li><a class="active" href="studentsuccesshome.jsp"> Home</a></li>			
						
						<li><a href="analysis1.jsp">Analysis</a></li>
						
						<li><a href="enroll.jsp">Enroll</span></a></li>
						<li><a href="studentlogout.jsp">Logout</span></a></li>
					<div class="clearfix"> </div>
					</ul>

				
			  </div>
			 
			<div class="clearfix"> </div>
		   </div>
		   <div class="clearfix"> </div>
		</div>
	</div>
</div>



<%
    }
%>




</center>
    
  </body>
</html>
