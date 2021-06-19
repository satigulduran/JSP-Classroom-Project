<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
     <%
      try
      {
      String bilgi=session.getAttribute( "student_mail" ).toString();
      if (bilgi == null){
    	  
      }}
      catch (Exception e) { System.out.println("Hata:"+e.getMessage());
      response.sendRedirect("studentlogin.jsp");}
      
      %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Student Classroom</title>

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
                <a class="nav-link" href="studenthomepage.jsp">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
             
                <a class="nav-link" href="studentjoinclasspage.jsp">Join Class</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="studentsettingspage.jsp"><%= session.getAttribute( "student_mail" ) %></a>
                
              </li>
              <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
              </li>
             
            </ul>
          </div>
        </div>
      </nav>
    </header>
<br>
<br>
<br>
    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
  				<jsp:useBean id="sbilgi" class="studentoperation.studentdatabaseislemleri"></jsp:useBean>
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
                    	
                    	
                    
                    String student_mail = session.getAttribute( "student_mail" ).toString();
                    System.out.println(student_mail);
                    ResultSet rs= sbilgi.findstudentid(student_mail);
                    while(rs.next()){
                    	System.out.println(rs.getInt(1));
                    	ResultSet rs2= sbilgi.findclass(rs.getInt(1));
                    	while(rs2.next()){
                    		System.out.println(rs2.getInt(1));
                    		ResultSet rs3= sbilgi.findclassinfo(rs2.getInt(1));
                    		while(rs3.next())
                    		{
                    			Random rand = new Random();
                            	int n = rand.nextInt(13) + 1;
                            	System.out.println(n);
                            	String resimadi=image[n];
                    		System.out.println(rs3.getString(2));%>
          <div class="item">
            <img src=<%=resimadi %> alt="">
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                  <span><%=rs3.getString(2) %></span>
                </div>
                <a href="studentclassdetail.jsp?class_id=<%=rs3.getInt(1) %>"><h4>Go to class</h4></a>
                <ul class="post-info">
                  <li><a href="#"><%=rs3.getString(3) %></a></li>
                  <li></li>
                  <li><a href="leaveclassroom.jsp?class_id=<%=rs3.getInt(1) %>">Leave this classrom</a></li>
                </ul>
              </div>
            </div>
          </div>
         
         <%
                    		
                    		}
                    	}
                    }
                    
                   
                    	
                    
                    }
                    	 catch(Exception e)
                         {
                         out.println("a"+e);
                         } %>
                    
        
          
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->

    <section class="call-to-action">
    
      
     
    </section>


    <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
           
                  </div>
                </div>
                <div class="col-lg-12">

                </div>
                <div class="col-lg-12">
                
                </div>
               
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
                <div class="col-lg-12">
                  <div class="sidebar-item search">
                    <form id="search_form" name="gs" method="GET" action="#">
                 
                    </form>
                  </div>
                </div>
                <div class="col-lg-12">
                 
                </div>
                <div class="col-lg-12">
                 
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item tags">
                   
                    </div>
                  </div>
                </div>
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