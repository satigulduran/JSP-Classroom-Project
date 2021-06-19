<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="classoperation.classbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>
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
String class_idsi;
int classid;
boolean sonuc= false;
class_idsi = request.getParameter("class_id");
String class_name= request.getParameter("class_name");
String class_teacher= request.getParameter("class_teacher");
String class_code= request.getParameter("class_code");
System.out.println(class_idsi);

classid=Integer.parseInt(class_idsi);
cbilgi.setclass_id(classid);


sonuc = classislemi.deleteData(classid);
if(sonuc==true)
{
	out.println("Veriler kaydedildi...");
	response.sendRedirect("selectallclass.jsp");}
else
{
	out.println("HATA...");

}
%>