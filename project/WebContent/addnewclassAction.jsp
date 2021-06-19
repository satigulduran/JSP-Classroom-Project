<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="classoperation.classbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>

<%
String class_id;
int classid;
boolean sonuc= false;
String class_teacher = request.getParameter("country"); 

class_id= request.getParameter("class_id");
String class_name= request.getParameter("class_name");
String class_code= request.getParameter("class_code");
String class_subject= request.getParameter("class_subject");
classid=Integer.parseInt(class_id);
cbilgi.setclass_id(classid);
cbilgi.setclass_name(class_name);
cbilgi.setclass_code(class_code);
cbilgi.setclass_teacher(class_teacher);
cbilgi.setclass_subject(class_subject);

sonuc=classislemi.insertData(cbilgi);
if(sonuc==true)
{  
	System.out.println("Veriler kaydedildi...");
	response.sendRedirect("selectallclass.jsp");
	  }
else
{ 

	response.sendRedirect("addnewclass.jsp");
	System.out.println("HATA...");
}


%>

  

        
