<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="sbilgi" class="teacheroperation.teacherbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="teacherislemi" class="teacheroperation.teacherdatabaseislemleri" scope="page"></jsp:useBean>
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
String teacher_id;
int teacherid;
boolean sonuc= false;
teacher_id= request.getParameter("teacher_id");
String teacher_name= request.getParameter("teacher_name");
String teacher_mail= request.getParameter("teacher_mail");
String teacher_password= request.getParameter("teacher_password");
teacherid=Integer.parseInt(teacher_id);
sbilgi.setteacher_id(teacherid);
sbilgi.setteacher_name(teacher_name);
sbilgi.setteacher_mail(teacher_mail);
sbilgi.setteacher_password(teacher_password);

sonuc = teacherislemi.deleteData(teacherid);
if(sonuc==true)
{
	out.println("Veriler silindi...");
	response.sendRedirect("selectallteacher.jsp");}
else
{
	out.println("HATA...");

}
%>