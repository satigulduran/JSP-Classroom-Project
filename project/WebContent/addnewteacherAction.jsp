<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="sbilgi" class="teacheroperation.teacherbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="teacherislemi" class="teacheroperation.teacherdatabaseislemleri" scope="page"></jsp:useBean>

<%
String teacher_id;
int teacherid;
boolean sonuc= false;
teacher_id= request.getParameter("teacher_id");
String teacher_name= request.getParameter("teacher_name");
String teacher_mail= request.getParameter("teacher_mail");
String teacher_password= request.getParameter("teacher_password");
int teacher_page=Integer.parseInt(request.getParameter("teacher_page"));
teacherid=Integer.parseInt(teacher_id);
sbilgi.setteacher_id(teacherid);
sbilgi.setteacher_name(teacher_name);
sbilgi.setteacher_mail(teacher_mail);
sbilgi.setteacher_password(teacher_password);


sonuc=teacherislemi.insertData(sbilgi);
if(sonuc==true)
{  
	out.println("Veriler kaydedildi...");
	if (teacher_page==1) response.sendRedirect("teacherlogin.jsp");
	else response.sendRedirect("selectallteacher.jsp");
	  }
else
{ 

	response.sendRedirect("addnewteacher.jsp");
	out.println("HATA...");
}


%>
