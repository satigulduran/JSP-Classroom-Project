<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<jsp:useBean id="cbilgi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="postislemi" class="classoperation.classcomment" scope="page"></jsp:useBean>
<%
boolean sonuc=false;
String comment_person;
Random rand = new Random();
int n = rand.nextInt(90000) + 10000;
String student_name="";
int page_number=Integer.parseInt(request.getParameter("page_number"));
String comment_content = request.getParameter("comment_content");
if (page_number==1){
	 		comment_person=request.getParameter("student_mail");
	}
else{
			 comment_person=request.getParameter("student_mail");
	}


ResultSet rs=studentislemi.selectAllDatastudent(comment_person);
while(rs.next()){
	student_name=rs.getString(2);
}
int comment_id=n;
int comment_classid=Integer.parseInt(request.getParameter("comment_classid"));
int comment_postid= Integer.parseInt(request.getParameter("comment_postid"));

postislemi.setcomment_id(comment_id);
postislemi.setcomment_content(comment_content);
postislemi.setcomment_postid(comment_postid);
postislemi.setcomment_classid(comment_classid);
postislemi.setcontent_person(student_name);
sonuc=cbilgi.insertcomment(postislemi);
if(sonuc==true){
	if (page_number==1){
   	String deger=request.getParameter("comment_classid");
	response.sendRedirect("teacherclassdetail.jsp?class_id="+deger);
}
	else{
		 String deger=request.getParameter("comment_classid");
		response.sendRedirect("studentclassdetail.jsp?class_id="+deger);
}
	  }
else
{
	response.sendRedirect("studenthomepage");
	out.println("HATA...");
}
%>