<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="adminoperation.adminbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="adminislemi" class="adminoperation.adminlogin" scope="page"></jsp:useBean>

<%
String admin_id;
int adminid;
boolean sonuc= false;

String admin_mail= request.getParameter("admin_mail");
String admin_sifre= request.getParameter("admin_sifre");
cbilgi.setadmin_mail(admin_mail);
cbilgi.setadmin_sifre(admin_sifre);
sonuc=adminislemi.adminlog(cbilgi);
if(sonuc==true)
{  session.setAttribute("admin_mail",admin_mail);
	response.sendRedirect("adminhome.jsp");

	  }
else
{
	response.sendRedirect("adminlogin.jsp?msg=notexist");
	out.println("HATA...");
}
%>
