<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="studentoperation.studentbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>

<%
String student_id;
int studentid;
boolean sonuc= false;
student_id= request.getParameter("student_id");
String student_name= request.getParameter("student_name");
String student_mail= request.getParameter("student_mail");
String student_password= request.getParameter("student_password");
studentid=Integer.parseInt(student_id);
cbilgi.setstudent_id(studentid);
cbilgi.setstudent_name(student_name);
cbilgi.setstudent_mail(student_mail);
cbilgi.setstudent_password(student_password);


sonuc=studentislemi.deleteData(studentid);
if(sonuc==true)
{  
	out.println("Veriler kaydedildi...");
	response.sendRedirect("selectallstudents.jsp");
	  }
else
{ 

	response.sendRedirect("addnewstudent.jsp");
	out.println("HATA...");
}

%>