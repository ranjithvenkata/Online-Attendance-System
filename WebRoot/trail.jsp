<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="success.jsp" %>
    <%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% /*SimpleDateFormat test = new SimpleDateFormat("dd / MM / yyyy"); 
Calendar cal = Calendar.getInstance();
String date=test.format(cal.getTime());*/
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
String t1=String.valueOf(session.getAttribute("tid"));
String t2=String.valueOf(session.getAttribute("tech"));
ResultSet rs1;
PreparedStatement ps1=con.prepareStatement("select * from addstudent where tid=? and technology=?");
ps1.setString(1,t1);
ps1.setString(2,t2);
rs1 = ps1.executeQuery();
//String[] values=request.getParameterValues("att");
String todate=request.getParameter("todate");
int i;  
String id,attendence;
Statement st = con.createStatement();
int k;
  while(rs1.next())
  {
      id = rs1.getString("id");
	attendence=request.getParameter(id);
	
        
    
    
    //ResultSet rs;
    try
    {
    k = st.executeUpdate("insert into attendence(id,attendence,technology,todate) values ('" + id + "','" + attendence + "','"+ t2 +"','"+ todate +"')");}
  catch(SQLException e)
  {out.print("The date entered has already been inserted by you.Please check date.Thank you");
   }} %>
   Attendance was successfully updated.
</body>
</html>