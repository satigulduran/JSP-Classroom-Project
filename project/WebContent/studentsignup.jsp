<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./login/fonts/icomoon/style.css">
    <link rel="stylesheet" href="./login/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./login/css/bootstrap.min.css">
    <link rel="stylesheet" href="./login/css/style.css">
    <title>Classroom Project</title>
  </head>
  <body>
<%@page import="java.util.*" %>
<%
Random rand = new Random();
int n = rand.nextInt(90000) + 10000;
System.out.println(n);
%>
  
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
              <h3>Sign In</h3>
              <p class="mb-4">Let's join us! </p>
                             <div class='whysignLogin'>
               <%
               String msg= request.getParameter("msg");
               if("pass".equals(msg))
               {
            	   %>
            	     <p class="mb-4">Password length should not be less than 8 characters.  </p>
            <%   }%> 
              <%if("ozel".equals(msg))
            	  {%>
            	  <p class="mb-4">Please use special character</p>
            <%   }%> 
            <%if("buyuk".equals(msg))
            	  {%>
            	  <p class="mb-4">Please use capital letters in your password</p>
            <%   }%>
             <%if("number".equals(msg))
            	  {%>
            	  <p class="mb-4">Please use number in your password</p>
            <%   }%>
            </div>
            </div>
            <form action="addnewyazarAction.jsp" method="post">
              <div class="form-group first">
                <label for="username">Username</label>
                <input type="hidden" name="student_id" value=<%=n %>>
                <input type="hidden" name="student_page" value=<%=1 %>>
                <input type="text" name="student_name" class="form-control" required>

              </div>
                <div class="form-group first">
                <label for="user_mail">User mail</label>
                <input type="email" name=student_mail class="form-control"  required>

              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password" name="student_password"class="form-control"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"required>
              </div>
               <input type="submit" value="Sign Up" class="btn btn-block btn-primary">
    		 <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="login.jsp" class="forgot-pass">Login</a></span> 
              </div>
            </div>
          </div>
            </form>
        </div>
      </div>
    </div>
  </div>
    <script src="./login/js/jquery-3.3.1.min.js"></script>
    <script src="./login/js/popper.min.js"></script>
    <script src="./login/js/bootstrap.min.js"></script>
    <script src="./login/js/main.js"></script>
  </body>
</html>