<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Classroom</title>

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
                <a class="nav-link" href="mainpage.jsp">Main Page
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
             
                <a class="nav-link" href="studentlogin.jsp">Student Login</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="teacherlogin.jsp">Teacher Login</a>
                
              </li>
              <li class="nav-item">
                <a class="nav-link" href="adminlogin.jsp">Admin Login </a>
              </li>
             
            </ul>
          </div>
        </div>
      </nav>
    </header>
<br>
<br>
<br>
  <div class="heading-page header-text">
      <section class="page-heading">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="text-content">
              
                            </div>
            </div>
          </div>
          <br>
          <br>
          <br>
          
        </div>
      </section>
    </div>
    <!-- Page Content -->
    <!-- Banner Starts Here -->
   
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
    <script src="./studenttemplate/assets/js/accordions.js"></script>

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