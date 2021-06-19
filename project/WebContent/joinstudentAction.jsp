<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="sbilgi" class="studentoperation.studentbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="cbilgi" class="classoperation.classbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="classoperation.classogConnection" scope="page"></jsp:useBean>
<%

int student_id=0;
boolean sonuc= false;
String class_code= request.getParameter("class_code");
cbilgi.setclass_code(class_code);
String student_mail = session.getAttribute( "student_mail" ).toString();
System.out.println(student_mail);
ResultSet rs= studentislemi.findstudentid(student_mail);
while(rs.next()){
	student_id=rs.getInt(1);
	}


sonuc=classislemi.classogrConnection(cbilgi , student_id);

if(sonuc==true)
{  
	out.println("Veriler kaydedildi...");
	response.sendRedirect("studenthomepage.jsp");
	  }
else
{ 

	response.sendRedirect("studentjoinclasspage.jsp?msg=invalid");
	out.println("HATA...");
}


%>