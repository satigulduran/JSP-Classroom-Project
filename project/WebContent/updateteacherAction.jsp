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
teacherid=Integer.parseInt(teacher_id);
sbilgi.setteacher_id(teacherid);
sbilgi.setteacher_name(teacher_name);
sbilgi.setteacher_mail(teacher_mail);
sbilgi.setteacher_password(teacher_password);
sonuc = teacherislemi.updateData(sbilgi, teacherid);
int number=Integer.parseInt(request.getParameter("teacher_page"));

if(sonuc==true)
{
	if (number ==1) {
		System.out.println("Veriler güncellendi...");
		response.sendRedirect("teachersettingspage.jsp?msg=notexist");}
	else
	{
		System.out.println("Veriler güncellendi...");
		response.sendRedirect("selectallteacher.jsp");
	}
}
else
{
	if (number ==1) {
		System.out.println("hata...");
		response.sendRedirect("teachersettingspage.jsp?msg=invalid");}
	else
	{
		System.out.println("hata...");
		response.sendRedirect("selectallteacher.jsp");
	}
}
%>