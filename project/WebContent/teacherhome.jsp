<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
     <%
      try
      {
      String bilgi=session.getAttribute( "teacher_mail" ).toString();
      if (bilgi == null){
    	  
      }}
      catch (Exception e) { System.out.println("Hata:"+e.getMessage());
      response.sendRedirect("teacherlogin.jsp");}
      
      %>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Teacher Classroom</title>

    <!-- Bootstrap core CSS -->
    <link href="./studenttemplate/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="./studenttemplate/assets/css/fontawesome.css">
    <link rel="stylesheet" href="./studenttemplate/assets/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="./studenttemplate/assets/css/owl.css">
<!--

TemplateMo 551 Stand Blog

https://templatemo.com/tm-551-stand-blog

-->
  </head>

  <body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="studenthomepage.jsp"><h2>CLASSR<em>O</em><em>O</em>M<em>.</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="teacherhome.jsp">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
             
                <a class="nav-link" href="teachercreateclass.jsp">Crate Class</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="teachersettingspage.jsp"><%= session.getAttribute( "teacher_mail" ) %></a>
                
              </li>
              <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
              </li>
             
            </ul>
          </div>
        </div>
      </nav>
    </header>
       <!-- Banner Starts Here -->
    <div class="heading-page header-text">
    </div>
    
    <!-- Banner Ends Here -->

    <section class="call-to-action">
      <div class="container">
       
      </div>
    </section>
    	<jsp:useBean id="tbilgi" class="teacheroperation.teacherdatabaseislemleri"></jsp:useBean>
                
      <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
              <%
              String[] image;
              image = new String[14];
              
              image[1]="./studenttemplate/assets/teachertitle/img_bookclub.jpg" ;
              image[2]="./studenttemplate/assets/teachertitle/img_code.jpg" ;
              image[3]="./studenttemplate/assets/teachertitle/img_learnlanguage.jpg" ;
              image[8]="./studenttemplate/assets/teachertitle/img_reachout.jpg" ;
              image[4]="./studenttemplate/assets/teachertitle/LanguageArts.jpg" ;
              image[5]="./studenttemplate/assets/teachertitle/Math.jpg" ;
              image[6]="./studenttemplate/assets/teachertitle/Psychology.jpg" ;
              image[7]="./studenttemplate/assets/teachertitle/Writing.jpg" ;
              image[9]="./studenttemplate/assets/teachertitle/SocialStudies.jpg" ;
              image[10]="./studenttemplate/assets/teachertitle/img_videogaming.jpg" ;
              image[11]="./studenttemplate/assets/teachertitle/img_theatreopera.jpg" ;
              image[12]="./studenttemplate/assets/teachertitle/img_carmaintenance.jpg" ;
              image[13]="./studenttemplate/assets/teachertitle/Honors.jpg" ;
                    try{         			
                    String teacher_mail = session.getAttribute( "teacher_mail" ).toString();
					ResultSet rs=tbilgi.findteachername(teacher_mail);
                   
                    while(rs.next()){
                    	 String teacher_name=rs.getString(1);
                    	ResultSet rs2= tbilgi.findclassinfo(teacher_name);
                    	while(rs2.next()){
                    		Random rand = new Random();
                        	int n = rand.nextInt(13) + 1;
                        	String resimadi=image[n];
                    		%>
                <div class="col-lg-6">
                
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src=<%=resimadi %> alt="">
                    </div>
                    <div class="down-content">
                      <span><%=rs2.getString(2) %></span>
                      <a href="teacherclassdetail.jsp?class_id=<%=rs2.getInt(1) %>"><h4>Go to class</h4></a>
                      <ul class="post-info">
                        <li><a href="#"><%=rs2.getString(3) %></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="deleteclassroom.jsp?class_id=<%=rs2.getInt(1) %>">Delete from everyone</a></li>
                      </ul>
                      <p></p>
      
                    </div>
                        
                  </div>
                </div>
 <%     	}}    }
                    	 catch(Exception e)
                         {
                         out.println("a"+e);
                         } %>  

              </div>
            </div>
          </div>
 
          <div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="social-icons">
             
            </ul>
          </div>
          <div class="col-lg-12">
            <div class="copyright-text">
              
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="./studenttemplate/vendor/jquery/jquery.min.js"></script>
    <script src="./studenttemplate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="./studenttemplate/assets/js/custom.js"></script>
    <script src="./studenttemplate/assets/js/owl.js"></script>
    <script src="./studenttemplate/assets/js/slick.js"></script>
    <script src="./studenttemplate/assets/js/isotope.js"></script>
    <script src=./studenttemplate/"assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>