<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="studentsuccessnew.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pending.jsp' starting page</title>
    
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
    <%String teacher=request.getParameter("teach"); 
    String sub1=String.valueOf(session.getAttribute("sub"));
    String id2=String.valueOf(session.getAttribute("id"));
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select id from professor where name=?");
ps.setString(1,teacher);
ResultSet rst=ps.executeQuery();
String sql;
Statement s=con.createStatement();
int k=0;
while(rst.next())
{
String tid=rst.getString(1);
sql="insert into pending(tid,subject,id,tname,status) values('"+ tid +"','"+ sub1+"','"+id2+"','"+teacher+"','Pending')";
try{
k = s.executeUpdate(sql);
}
catch(SQLException e)
{
out.print("Your Request has already been sent more than once to the concerned professor.");
}
}
if(k>0)
{
out.print("Your Request has been sent to the concerned professor.Thank you.");}%>


  </body>
</html>
