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
int post_id, class_id, page_number;
post_id=Integer.parseInt(request.getParameter("post_id"));
class_id=Integer.parseInt(request.getParameter("class_id"));
page_number=Integer.parseInt(request.getParameter("page_number"));
sonuc=classislemi.deletepost(post_id);
if(sonuc==true)
{  
	if (page_number==1) {response.sendRedirect("teacherclassdetail.jsp?class_id="+class_id);}
	else 				{response.sendRedirect("studentclassdetail.jsp?class_id="+class_id);}
	  }
	
	  
else
{ 

	response.sendRedirect("addnewstudent.jsp");
	
}

%>