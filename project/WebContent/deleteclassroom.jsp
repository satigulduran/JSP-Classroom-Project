<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="studentoperation.studentbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>
<%
String student_id;
int studentid;
boolean sonuc= false;
int post_id;
post_id=Integer.parseInt(request.getParameter("class_id"));


sonuc=classislemi.deleteData(post_id);
if(sonuc==true)
{  
	response.sendRedirect("teacherhome.jsp");
	System.out.println("succesfully delete");
	
	  }
else
{ 
	response.sendRedirect("teacherhome.jsp");
	System.out.println("Hata olustu..");
}

%>