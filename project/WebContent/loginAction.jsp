<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 
String user_mail= request.getParameter("user_mail");
String user_password= request.getParameter("user_password");
 int z=0;
try
{
	Connection con= ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs= st.executeQuery("select * from user where user_mail='"+user_mail+"' and user_password='"+user_password+"'");
	while (rs.next()){
		z=1;
		session.setAttribute("user_mail",user_mail);
		response.sendRedirect("home.jsp");
	}
	if (z==0)
		response.sendRedirect("login.jsp?msg=notexist");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("login.jsp?msg=invalid");
}

%>