<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="free-educational-responsive-web-template-webEdu">
	<meta name="author" content="webThemez.com">
	<title>Classes </title>
	<link rel="favicon" href="./student/assets/images/1d.jpg">
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="./student/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="./student/assets/css/font-awesome.min.css"> 
	<link rel="stylesheet" href="./student/assets/css/bootstrap-theme.css" media="screen"> 
	<link rel="stylesheet" href="./student/assets/css/style.css">
    <link rel='stylesheet' id='camera-css'  href='./student/assets/css/camera.css' type='text/css' media='all'> 
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="studenthome.jsp">
					<img src="./student/assets/images/3d.jpg" alt="Techro HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li ><a href="studenthome.jsp">Home</a></li>
					<li><a href="joinclassstudent.jsp">Join Class</a></li>
					<li class="dropdown">
						<a  class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute( "student_mail" ) %><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="studentsettings.jsp"></a>Account Settings</li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul>
					</li>
					

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

	<!-- Header -->
	
	<!-- /Header -->

  <div class="container">
    <div class="row">
					
    </div>
    </div>
     
  
	
  <header id="head" class="secondary">
            <div class="container">
                    <h1>Settings</h1>
                      <%
               String msg= request.getParameter("msg");
               if("notexist".equals(msg))
               {
            	   %>
            	     <p class="mb-4">Successfully updated! </p>
            <%   }%> 
              <%if("invalid".equals(msg))
            	  {%>
            	  <p class="mb-4">Try again!</p>
            <%   }%> 
                  
                </div>
    </header>


	<!-- container -->
	<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h3 class="section-title">Your Information</h3>
						
						
						<form class="form-light mt-20" action="updatestudentAction.jsp" role="form">
						<jsp:useBean id="cbilgi" class="studentoperation.studentdatabaseislemleri"></jsp:useBean>
                    <%
                    String student_mail= session.getAttribute( "student_mail" ).toString();
                    
                    
                    try{
                    	
                    	ResultSet rs = cbilgi.selectAllDatastudent(student_mail);
                    	
                    while (rs.next())
                    { %>
                     
							<div class="form-group">
								<label> Student Name</label>
								<input type="hidden" name="student_id" value=<%=rs.getString(1) %>>
								<input type="text" class="form-control" name="student_name" placeholder="Your name" value="<%=rs.getString(2)%>" required>
								 <input type="hidden" name="student_page" value=<%=0 %>>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label> Student Email</label>
										<input type="email" class="form-control"  name="student_mail"placeholder="Email address" value="<%=rs.getString(3)%>" required>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label> Student Password</label>
										<input type="password" class="form-control" name="student_password" placeholder="Password" value="<%=rs.getString(4)%>" required>
									</div>
								</div>
							</div>
						
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>      </label>
										<button type="submit" class="btn btn-warning">Update</button><p><br/></p>
									</div>
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
    	 
    <footer id="footer">
 
		<div class="container">
   <div class="row">
  <div class="footerbottom">
    <div class="col-md-3 col-sm-6">
      <div class="footerwidget">
        <h4>
          Course Categories
        </h4>
        <div class="menu-course">
          <ul class="menu">
            <li><a href="#">
                List of Technology 
              </a>
            </li>
            <li><a href="#">
                List of Business
              </a>
            </li>
            <li><a href="#">
                List of Photography
              </a>
            </li>
            <li><a href="#">
               List of Language
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-sm-6">
      <div class="footerwidget">
        <h4>
          Products Categories
        </h4>
        <div class="menu-course">
          <ul class="menu">
            <li> <a href="#">
                Individual Plans  </a>
            </li>
            <li><a href="#">
                Business Plans
              </a>
            </li>
            <li><a href="#">
                Free Trial
              </a>
            </li>
            <li><a href="#">
                Academic
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-sm-6">
      <div class="footerwidget">
        <h4>
          Browse by Categories
        </h4>
        <div class="menu-course">
          <ul class="menu">
            <li><a href="#">
                All Courses
              </a>
            </li>
            <li> <a href="#">
                All Instructors
              </a>
            </li>
            <li><a href="#">
                All Members
              </a>
            </li>
            <li>
              <a href="#">
                All Groups
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-sm-6"> 
            	<div class="footerwidget"> 
                         <h4>Contact</h4> 
                        <p>Lorem reksi this dummy text unde omnis iste natus error sit volupum</p>
            <div class="contact-info"> 
            <i class="fa fa-map-marker"></i> Kerniles 416  - United Kingdom<br>
            <i class="fa fa-phone"></i>+00 123 156 711 <br>
             <i class="fa fa-envelope-o"></i> youremail@email.com
              </div> 
                </div><!-- end widget --> 
    </div>
  </div>
</div>
			<div class="social text-center">
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-dribbble"></i></a>
				<a href="#"><i class="fa fa-flickr"></i></a>
				<a href="#"><i class="fa fa-github"></i></a>
			</div>

			<div class="clear"></div>
			<!--CLEAR FLOATS-->
		</div>
		<div class="footer2">
			<div class="container">
				<div class="row">

					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="simplenav">
								<a href="index.html">Home</a> | 
								<a href="about.html">About</a> |
								<a href="courses.html">Courses</a> |
								<a href="price.html">Price</a> |
								<a href="videos.html">Videos</a> |
								<a href="contact.html">Contact</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="text-right">
								Copyright &copy; 2014. Template by <a href="http://webthemez.com/" rel="develop">WebThemez.com</a>
							</p>
						</div>
					</div>

				</div>
				<!-- /row of panels -->
			</div>
		</div>
	</footer>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="./student/assets/js/modernizr-latest.js"></script> 
	<script type='text/javascript' src='./student/assets/js/jquery.min.js'></script>
    <script type='text/javascript' src='./student/assets/js/fancybox/jquery.fancybox.pack.js'></script>
    
    <script type='text/javascript' src='./student/assets/js/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='./student/assets/js/jquery.easing.1.3.js'></script> 
    <script type='text/javascript' src='./student/assets/js/camera.min.js'></script> 
    <script src="./student/assets/js/bootstrap.min.js"></script> 
	<script src="./student/assets/js/custom.js"></script>
    <script>
		jQuery(function(){
			
			jQuery('#camera_wrap_4').camera({
                transPeriod: 500,
                time: 3000,
				height: '600',
				loader: 'false',
				pagination: true,
				thumbnails: false,
				hover: false,
                playPause: false,
                navigation: false,
				opacityOnGrid: false,
				imagePath: './student/assets/images/'
			});

		});
      
	</script>
    
</body>
</html>