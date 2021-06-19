<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="adminoperation.adminbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="adminoperation.admindatabaseislemleri" scope="page"></jsp:useBean>
<%
String admin_idsi;
int adminid;
boolean sonuc= false;
admin_idsi = request.getParameter("admin_id");
String admin_name= request.getParameter("admin_name");
String admin_mail= request.getParameter("admin_mail");
String admin_sifre= request.getParameter("admin_sifre");

adminid=Integer.parseInt(admin_idsi);
cbilgi.setadmin_id(adminid);
cbilgi.setadmin_name(admin_name);
cbilgi.setadmin_mail(admin_mail);
cbilgi.setadmin_sifre(admin_sifre);


sonuc = classislemi.updateData(cbilgi, adminid);
if(sonuc==true)
{
	out.println("Veriler kaydedildi...");
	response.sendRedirect("selectalladmin.jsp");}
else
{
	out.println("HATA...");
	response.sendRedirect("adminupdate.jsp");
}
%>