<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="teacheroperation.teacherbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="teacheroperation.teacherlogin" scope="page"></jsp:useBean>
<jsp:useBean id="post" class="classoperation.classpost" scope="page"></jsp:useBean>

<%
String admin_id;
int adminid;
boolean sonuc= false;
String teacher_mail= request.getParameter("teacher_mail");
String teacher_sifre= request.getParameter("teacher_password");
cbilgi.setteacher_mail(teacher_mail);
cbilgi.setteacher_password(teacher_sifre);
sonuc=studentislemi.teacherlog(cbilgi);
if(sonuc==true)
{   session.setAttribute("teacher_mail",teacher_mail);
	response.sendRedirect("teacherhome.jsp");

	  }
else
{
	response.sendRedirect("teacherlogin.jsp?msg=notexist");
	out.println("HATA...");
}
%>