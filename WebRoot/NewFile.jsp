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
    //String emailid = request.getParameter("emailid");    
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
     //String email=request.getParameter("emailid");
    PreparedStatement ps=con.prepareStatement("select * from addstudent");
    //ps.setString(1,technology);
    ResultSet rs;
    rs = ps.executeQuery();
    ResultSetMetaData rsmd=rs.getMetaData();
    int total=rsmd.getColumnCount();
   
while(rs.next())
		{ 
		out.print("<table width=50% border=1>"); 
		out.print("<tr>"); 
		for(int i=1;i<=total;i++) 
		
		{  
		out.print("<th>"+rsmd.getColumnName(i)+"</th>"); 
		  
		  }out.print("</tr>");
		     
			out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");  
			out.print("</table>");  
			
			} 
	/*else {
    	out.print("Invalid EmailId");
    	out.println("<a href='login.html'>Login</a>");
    }*/
		
    out.println("<a href='success.jsp'>Thank u</a>");       
    
%>

</body>
</html>