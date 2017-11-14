<%@ page language="java" import="java.util.*,java.sql.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="success.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add1.jsp' starting page</title>
    
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
    
  
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq"); 
    //String email=request.getParameter("emailid");
     //String[] list=request.getParameterValues("student");
     String accept=null; 
     String tid3=String.valueOf(session.getAttribute("tid"));
     String techno=String.valueOf(session.getAttribute("tech"));
Statement ps=con.createStatement();
int i=0;
PreparedStatement ps1;
ResultSet rs1,rs4;
String temp,name,mobile,email,sql=null,sql1=null;




PreparedStatement ps4=con.prepareStatement("select id from pending where tid=? and subject=? and status=?");
ps4.setString(1,tid3);
ps4.setString(2,techno);
ps4.setString(3,"Pending");
rs4 = ps4.executeQuery();
int k;
//String[] values=request.getParameterValues("att");
//String todate=request.getParameter("todate");
 String id1,status1;
 Statement st = con.createStatement(); 
  while(rs4.next())
  {
      id1 = rs4.getString("id");
	status1=request.getParameter(id1);
	
    
//update in pending
sql="update pending set status='"+status1+"'where id='"+id1+"' and subject='"+techno+"' and tid='"+tid3+"'"; 
    //ResultSet rs;
   k=st.executeUpdate(sql); 
    if(status1.equals("Accept"))
    {
    accept=id1;


ps1=con.prepareStatement("select * from student where id=?");
ps1.setString(1,accept);
rs1=ps1.executeQuery();
while(rs1.next())
{
name=rs1.getString("name");
email=rs1.getString("emailid");
mobile=rs1.getString("mblno");
temp=accept;
sql="insert into addstudent(id,name,emailid,mblno,tid,technology)values('"+temp+"','"+name+"','"+email+"','"+mobile+"','"+tid3+"','"+techno+"')";
try
{ps.executeUpdate(sql);}
catch(SQLException e)
{
out.print("<br><br>Student with the name "+name+",id "+temp+" already has a teacher for this subject.<br>Hence we are not adding the student to our class."); 
sql1="update pending set status='Decline'where id='"+temp+"' and subject='"+techno+"' and tid='"+tid3+"'";
k=st.executeUpdate(sql1);
continue;
}
 
   }
}

}

out.print("<br><br><br>Thank you,Student requests have been processed.");

 
   %>

  </body>
</html>
