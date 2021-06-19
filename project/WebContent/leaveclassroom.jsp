<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="classoperation.classbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="sbilgi" class="studentoperation.studentdatabaseislemleri"></jsp:useBean>
<%
String class_idsi;
int classid;
int student_id=0;
boolean sonuc= false;
class_idsi = request.getParameter("class_id");
classid=Integer.parseInt(class_idsi);

String student_mail = session.getAttribute( "student_mail" ).toString();
System.out.println(student_mail);
ResultSet rs= sbilgi.findstudentid(student_mail);
while(rs.next()){
	student_id=rs.getInt(1);
}

sonuc = classislemi.ogrsinifdata(classid,student_id);
if(sonuc==true)
{
	response.sendRedirect("studenthomepage.jsp");
}
else
{
	response.sendRedirect("studenthomepage.jsp");
	System.out.println("HATA...");
	out.println("HATA...");

}
%>