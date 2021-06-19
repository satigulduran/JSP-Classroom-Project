<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String user_name= request.getParameter("user_name");
String user_mail= request.getParameter("user_mail");
String user_password= request.getParameter("user_password");
String user_auth="1";
try{
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("INSERT INTO user VALUES(?,?,?,?)");
ps.setString(1, user_name);
ps.setString(2,user_mail);
ps.setString(3,user_password);
ps.setString(4, user_auth);
ps.executeUpdate();

}
catch(Exception e)
{
	System.out.println(e);

}

%>