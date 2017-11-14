<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href='http://fonts.googleapis.com/css?family=Sintony:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body bgcolor="#009966">
<center>

<%
    if ((session.getAttribute("tid") == null) || (session.getAttribute("tid") == "")) {
%>
You are not logged in<br/>
<a href="professorlogin.html">Please Login</a>
<%} else {
%>

<div class="header">
	<div class="container">
		<div class="header-main">
			 <div class="logo">
                             <h1><a href="profhome.jsp"><img src="images/logojntuh.jpg"> JNTUH<span class="logo-clr"></span></a></h1>
			 </div><br/>
			 <div class=" ">
			   <div class="top-nav">
			   		<span class="menu"> <img src="images/icon.png" alt=""/></span>
					<ul class="res">
						<li><a class="active" href="profhome.jsp"> Home</a></li>			
						
						<li><a href="add.jsp">Add Students</a></li>
						
						<li><a href="view.jsp">View Students</span></a></li>
						<li><a href="atten.jsp">Update</span></a></li>
						<li><a href="logout.jsp">Logout</span></a></li>
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
<br>

</body>
</html>