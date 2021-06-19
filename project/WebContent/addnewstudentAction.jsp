<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="sbilgi" class="studentoperation.studentbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>

<%
String student_id;
int studentid;
boolean sonuc= false;
student_id= request.getParameter("student_id");
String student_name= request.getParameter("student_name");
String student_mail= request.getParameter("student_mail");
String student_password= request.getParameter("student_password");
int student_page=Integer.parseInt(request.getParameter("student_page"));


studentid=Integer.parseInt(student_id);
sbilgi.setstudent_id(studentid);
sbilgi.setstudent_name(student_name);
sbilgi.setstudent_mail(student_mail);
sbilgi.setstudent_password(student_password);


sonuc=studentislemi.insertData(sbilgi);
if(sonuc==true)
{  
	out.println("Veriler kaydedildi...");
	if (student_page==1)  response.sendRedirect("studentlogin.jsp");
	else response.sendRedirect("selectallstudents.jsp"); 
}
else
{ 
	if (student_page==1)  response.sendRedirect("studentsignup.jsp");
	else response.sendRedirect("addnewstudent.jsp");
	out.println("HATA...");
}

%>
