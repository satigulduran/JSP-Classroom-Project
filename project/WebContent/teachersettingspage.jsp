<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
     <%
      try
      {
      String bilgi=session.getAttribute( "teacher_mail" ).toString();
      if (bilgi == null){
    	  
      }}
      catch (Exception e) { System.out.println("Hata:"+e.getMessage());
      response.sendRedirect("teacherlogin.jsp");}
      
      %>
<!DOCTYPE html>
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
             
                <a class="nav-link" href="teachercreateclass.jsp">Create Class</a>
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
    
    
        <!-- Page Content -->
 <div class="heading-page header-text">
      <section class="page-heading">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="text-content">
                <h4>You're currently signed in as <%= session.getAttribute( "teacher_mail" ) %></h4>
                  <%
               String msg= request.getParameter("msg");
               if("notexist".equals(msg))
               {
            	   %>
            	     <h2 class="mb-4">Successfully updated! </h2>
            <%   }%> 
              <%if("invalid".equals(msg))
            	  {%>
            	  <h2 class="mb-4">Try again!</h2>
            <%   }%> 
                  
               
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
     <!-- Banner Starts Here -->
    <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-8">
                  <div class="sidebar-item contact-form">
                    <div class="sidebar-heading">
                     
                    </div>
                    <div class="content">
                      <form id="contact" action="updateteacherAction.jsp"  method="post">
                      	<jsp:useBean id="cbilgi" class="studentoperation.studentdatabaseislemleri"></jsp:useBean>
                      		<jsp:useBean id="teacherbilgi" class="teacheroperation.teacherdatabaseislemleri"></jsp:useBean>
                    <%
                    String student_mail= session.getAttribute( "teacher_mail" ).toString();
                    
                    
                    try{
                    	
                    	ResultSet rs = teacherbilgi.findteacherinfo(student_mail);
                    	
                    while (rs.next())
                    { %>
                     
                        <div class="row">
                         <div class="col-md-6 col-sm-12">
                            <fieldset>
                            <input type="hidden" name="teacher_page" value=<%=1 %>>
                            <input type="hidden" name="teacher_id" value=<%=rs.getString(1) %>>
								<input type="text" class="form-control" name="teacher_name" placeholder="Your name" value="<%=rs.getString(2)%>" required>
                              <input type="hidden" name="student_page" value=<%=0 %>>
                            </fieldset>
                          </div>
                          <div class="col-md-6 col-sm-12">
                           
                            <fieldset>
                             <input type="email" class="form-control"  name="teacher_mail"placeholder="Email address" value="<%=rs.getString(3)%>"  required readonly>
                            </fieldset>
                          </div>
                            <div class="col-md-6 col-sm-12">
                           
                            <fieldset>
										<input type="password" class="form-control" name="teacher_password" placeholder="Password" value="<%=rs.getString(4)%>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                            </fieldset>
                          </div>

                          <div class="col-lg-12">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-button">Update</button>
                            </fieldset>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                  <%
                    }
                    }
                      catch(Exception e)
                      {
                      out.println(e);
                      } %>
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