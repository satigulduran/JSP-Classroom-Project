<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="sbilgi" class="studentoperation.studentbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="cbilgi" class="classoperation.classbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="studentislemi" class="studentoperation.studentdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="classislemi" class="classoperation.classogConnection" scope="page"></jsp:useBean>
<jsp:useBean id="teacherislemi" class="teacheroperation.teacherdatabaseislemleri" scope="page"></jsp:useBean>
<jsp:useBean id="islemi" class="classoperation.classdatabaseislemleri" scope="page"></jsp:useBean>
<%
int student_id=0;
String teacher_name="";
boolean sonuc= false;
int class_id= Integer.parseInt(request.getParameter("class_id"));
String class_name= request.getParameter("class_name");
String class_subject= request.getParameter("class_subject");
cbilgi.setclass_name(class_name);
cbilgi.setclass_subject(class_subject);
cbilgi.setclass_id(class_id);

String teacher_mail = session.getAttribute( "teacher_mail" ).toString();
ResultSet rs= teacherislemi.findteachername(teacher_mail);
while(rs.next()){
	teacher_name=rs.getString(1);
	}
cbilgi.setclass_teacher(teacher_name);
char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
int [] number = { 1, 2, 3, 4, 5, 6, 7, 8, 9};
char[] alphabet2 = "ABCDEGHIJKLMNOPQRSTUVWYZ".toCharArray();


Random rand = new Random();
int n = rand.nextInt(25) + 0;
String code= String.valueOf(alphabet[n]);

Random rand2 = new Random();
int n2 = rand2.nextInt(25) + 0;
code= code + String.valueOf(alphabet[n2]);

Random rand3 = new Random();
int n3 = rand3.nextInt(9) + 0;
code= code + String.valueOf(number[n3]);

Random rand4 = new Random();
int n4 = rand4.nextInt(25) + 0;
code= code + String.valueOf(alphabet2[n4]);

Random rand5= new Random();
int n5 =rand5.nextInt(9) + 0;
code= code + String.valueOf(number[n5]);


Random rand6 = new Random();
int n6 = rand6.nextInt(9) + 0;
code= code + String.valueOf(alphabet2[n6]);
cbilgi.setclass_code(code);
sonuc=islemi.insertData(cbilgi );

if(sonuc==true)
{  
	response.sendRedirect("teacherclassdetail.jsp?class_id="+class_id);
	out.println("Başarılı kayıt...");
	  }
else
{ 

	response.sendRedirect("teachercreateclass.jsp?msg=invalid");
	out.println("HATA...");
}


%>