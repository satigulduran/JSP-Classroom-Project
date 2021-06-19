<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="post" class="classoperation.classpost" scope="page"></jsp:useBean>
<jsp:useBean id="cbilgi" class="studentoperation.studentbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentlogin" scope="page"></jsp:useBean>
<%
String admin_id;
int adminid;
boolean sonuc= false;
String admin_mail= request.getParameter("student_mail");
String admin_sifre= request.getParameter("student_password");
cbilgi.setstudent_mail(admin_mail);
cbilgi.setstudent_password(admin_sifre);
sonuc=studentislemi.studentlog(cbilgi);
if(sonuc==true)
{   session.setAttribute("student_mail",admin_mail);
	response.sendRedirect("studenthomepage.jsp");

	  }
else
{
	response.sendRedirect("studentlogin.jsp?msg=notexist");
	out.println("HATA...");
}
%>
