<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<jsp:useBean id="teacherislemi" class="teacheroperation.teacherdatabaseislemleri" scope="page"></jsp:useBean>
<%
    

String result,newadminpassword;
boolean sonuc;
char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
char [] special = "!%-?*/+,.".toCharArray();
char[] alphabet2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
int[] number={0,1,2,3,4,5,6,7,8,9};
Random rand = new Random();
int n = rand.nextInt(25) + 0;
String code= String.valueOf(alphabet[n]);
int n1 = rand.nextInt(8) + 0;
code= code+ String.valueOf(special[n1]);
int n2 = rand.nextInt(25) + 0;
code= code+ String.valueOf(alphabet2[n2]);
int n3 = rand.nextInt(25) + 0;
code= code +String.valueOf(alphabet[n3]);
int n4 = rand.nextInt(25) + 0;
code= code +String.valueOf(alphabet[n4]);
int n5 = rand.nextInt(25) + 0;
code= code +String.valueOf(alphabet[n5]);
int n6 = rand.nextInt(9) + 0;
code= code +String.valueOf(number[n6]);
int n7 = rand.nextInt(25) + 0;
code= code +String.valueOf(alphabet[n7]);
String host="", user="", pass="";
host = "smtp.gmail.com"; user = "bitirmeprojesilung@gmail.com"; //”

pass = "Merhaba0987"; //Your gmail password
String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
String to = request.getParameter("mail"); // out going email id
String from = "bitirmeprojesilung@gmail.com"; //Email id of the recipient
String subject = " Teacher Classroom Project New Password";
String messageText = " your new password is : "+code;



boolean WasEmailSent ;
boolean sessionDebug = true;
Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to

Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);


    try {
    	transport.sendMessage(msg, msg.getAllRecipients());
    	WasEmailSent = true; // assume it was sent
        sonuc=teacherislemi.updateteacherpassword(to,code);
        System.out.println("Mail basariyla yollandi");
    	response.sendRedirect("teacherlogin.jsp");
      
    } catch (MessagingException mex) {
    	WasEmailSent = false; // assume it’s a fail
        mex.printStackTrace();
        System.out.println("Mail yollanirken hata olustu.");
    	response.sendRedirect("teacherlogin.jsp?msg=invalid");
        
    }
%>
