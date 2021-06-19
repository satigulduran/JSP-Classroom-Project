<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="./login/fonts/icomoon/style.css">

    <link rel="stylesheet" href="./login/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./login/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="./login/css/style.css">

    <title>Classroom Project</title>
  </head>
  <body>
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="./login/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Student Login</h3>
               <div class='whysignLogin'>
               <%
               String msg= request.getParameter("msg");
               if("notexist".equals(msg))
               {
            	   %>
            	     <p class="mb-4">Incorrect email or password.. </p>
            <%   }%> 
              <%if("invalid".equals(msg))
            	  {%>
            	  <p class="mb-4">Try again!</p>
            <%   }%> 
            </div>
              </div>
            <form action="studentloginAction.jsp" method="post">
                <div class="form-group first">
                <label for="user_mail">User mail</label>
                <input type="email" name=student_mail class="form-control"   required>
              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password" name="student_password"class="form-control"  required>
 
              </div>
       <div class="d-flex mb-5 align-items-center">
              
                    <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="studentforgotpassword.jsp" class="forgot-pass">Forgot Password</a></span> 
              </div>
                  
              <input type="submit" value="Login" class="btn btn-block btn-primary">
				 <div class="control__indicator"></div>
				              
				                 <span class="ml-auto"><a href="studentsignup.jsp" class="forgot-pass">Sign up</a></span> 
				              </div>
            </div>
          </div>        
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>



    <script src="./login/js/jquery-3.3.1.min.js"></script>
    <script src="./login/js/popper.min.js"></script>
    <script src="./login/js/bootstrap.min.js"></script>
    <script src="./login/js/main.js"></script>