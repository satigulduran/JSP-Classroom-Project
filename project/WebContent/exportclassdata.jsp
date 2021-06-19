<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
     <%
      try
      {
      String bilgi=session.getAttribute( "admin_mail" ).toString();
      if (bilgi == null){
    	  
      }}
      catch (Exception e) { System.out.println("Hata:"+e.getMessage());
      response.sendRedirect("adminlogin.jsp");}
      
      %>
<%
String filename = "C:/Users/Satgu/OneDrive/Masaüstü/class_datafile.csv";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "classroom";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "1234";
Statement stmt;
try
{
FileWriter fw = new FileWriter(filename);
fw.append("Id");
fw.append(',');
fw.append("Class Name");
fw.append(',');
fw.append("Class Teacher");
fw.append(',');
fw.append("Class Code");
fw.append('\n');
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from class";
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next())
{
fw.append(rs.getString(1));
fw.append(',');
fw.append(rs.getString(2));
fw.append(',');
fw.append(rs.getString(3));
fw.append(',');
fw.append(rs.getString(4));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("selectallclass.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>