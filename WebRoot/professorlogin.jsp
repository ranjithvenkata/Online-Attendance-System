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
    String t= request.getParameter("id");  
    //String name=request.getParameter("name");  
    String password = request.getParameter("password");
    String techno;
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","taufeeq","taufeeq");
        Statement st = con.createStatement();
    ResultSet rs;
       
    rs = st.executeQuery("select * from professor where id='" + t + "' and password='" + password + "'");
    if (rs.next()) {
 
        session.setAttribute("tid",t);
        
             PreparedStatement ps2=con.prepareStatement("select count(technology) from professor where id=?");
ps2.setString(1,t);
ResultSet rs2=ps2.executeQuery();
int check=0;
if(rs2.next())
{
check=rs2.getInt(1);
}
PreparedStatement ps=con.prepareStatement("select technology from professor where id=?");
ps.setString(1,t);
ResultSet rs1;
rs1 = ps.executeQuery();
if(check==1)
{


if(rs1.next())
{
techno=rs1.getString("technology");
session.setAttribute("tech",techno);
}

      
        out.print("<a href='logout.jsp'>Log out</a>");
          response.sendRedirect("profhome.jsp");
          }
          else
          {%>
            <jsp:include page="mainheader.html" />
    <div class="grid-main">
	<div class="container">
			<div class="process">
			<center>
          
          You have more than one subject registered.
          Please inform us which subject attendance you would you like to update.
          
          <form action="tech.jsp" method="post">
          <select name="selectsub">
          <% 
          while(rs1.next())
          {
          techno=rs1.getString("technology");
          
           %>
          
          
          <option>
          <%=techno %>
          </option>
          <% }%>
          
          </select>
          <input type="submit" value="ok"/>
          </form> 
          </center></div></div></div>
          <%
          }
    } else {
        out.print("Invalid password <br><a href='professorlogin2.html'>try again</a>");
    }
%>

</body>
</html>