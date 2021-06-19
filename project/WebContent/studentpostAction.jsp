<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="cbilgi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="postislemi" class="classoperation.classpost" scope="page"></jsp:useBean>
<%

String admin_id;
int adminid;
boolean sonuc= false;
int post_classid = Integer.parseInt(request.getParameter("post_classid"));
String post_content= request.getParameter("post_content");
int post_id = Integer.parseInt(request.getParameter("post_id"));
String post_writer= request.getParameter("post_writer");
int page_number= Integer.parseInt(request.getParameter("page_number"));
postislemi.setpost_classid(post_classid);
postislemi.setpost_content(post_content);
postislemi.setpost_id(post_id);
postislemi.setpost_writer(post_writer);
sonuc=cbilgi.insertpost(postislemi);
if(sonuc==true)
{  
	if (page_number==1) {response.sendRedirect("teacherclassdetail.jsp?class_id="+post_classid);}
	else 				{response.sendRedirect("studentclassdetail.jsp?class_id="+post_classid);}
	  }
else
{
	if (page_number==1) {response.sendRedirect("teacherclassdetail.jsp?class_id="+post_classid);}
	else 				{response.sendRedirect("studentclassdetail.jsp?class_id="+post_classid);}
	  
	System.out.println("HATA...");
}
%>
