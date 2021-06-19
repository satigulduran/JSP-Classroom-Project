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
<%
Random rand = new Random();
int n = rand.nextInt(90000) + 0;
System.out.println(n);
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Classroom Student</title>

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
              <li class="nav-item">
                <a class="nav-link" href="studenthomepage.jsp">Home
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
    </header>aws
ada
  <jsp:useBean id="sbilgi" class="classoperation.classdatabaseislemleri"></jsp:useBean>
                      <%
                      int class_id = Integer.parseInt(request.getParameter("class_id"));
                      System.out.println(class_id);
                        
                    try{
                    	
                    	ResultSet rs = sbilgi.selectAllData(class_id);
                    	
                    while (rs.next())
                    { %>
    <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                    
                      <img src="./studenttemplate/assets/images/201907249837.jpg" alt="">
                    </div>
                    <div class="down-content">
                      <span><%=rs.getString(2) %></span>

                      <ul class="post-info">
                        <li><%=rs.getString(3) %></li> 
                      </ul>
                    </div>
                  </div>
                </div>

                <div class="col-lg-12">
                  <div class="sidebar-item submit-comment">
                    <div class="content">
                      <form id="comment" action="studentpostAction.jsp" method="post">
                        <div class="row">
                          <div class="col-lg-12">
                            <fieldset>
                            <input type="hidden" name="post_id" value=<%=n%>>
                            <input type="hidden" name="post_classid" value=<%=class_id%>>
                              <input type="hidden" name="page_number" value=<%=0%>>
                            <input type="hidden" name="post_writer" value=<%= session.getAttribute( "student_mail" )%>>
                              <textarea name="post_content" rows="6" id="message" placeholder="Announce something to your class " required></textarea>
                            
                            </fieldset>
                          </div>
                           
                           
                          <div class="col-lg-12">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-button">Submit</button>
                            </fieldset>
                          </div>
                        </div>
                      </form>
                    </div>
                   
                  </div>
                
                  </div> <%
                   } }
                      catch(Exception e)
                      {
                      out.println(e);
                      } %>
                </div>
                  
                
              </div>
            </div>
            <div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
                <div class="col-lg-12">
                  <div class="sidebar-item recent-posts">
                    <div class="sidebar-heading">
                      <h2>Students<h2>
                    </div>
                     <jsp:useBean id="serbilgi" class="classoperation.classogConnection"></jsp:useBean>
                     <jsp:useBean id="stbilgi" class="studentoperation.studentdatabaseislemleri"></jsp:useBean>
                      <%
                      int class_id3 = Integer.parseInt(request.getParameter("class_id"));
                      
                        
                    try{
                    	
                    	ResultSet rs3 = serbilgi.selectAllogrencid(class_id3);
                    	
                    while (rs3.next())
                    { 
                    	   int student_id=rs3.getInt(1);
                   			 ResultSet rs4 = stbilgi.selectAllData(student_id);
                    while(rs4.next())
                    {
                    %>
                    <div class="content">
                      <ul>
                        <li>
                          <h5><%=rs4.getString(2) %></h5>
                       </li>
                      </ul>
					</div>
					<%
                          }}}
                    	 catch(Exception e)
                         {
                         out.println("a"+e);
                         } %>
                    </div>
                  </div>
                </div>
          </div>
          </div>
             </div>     
       </div>
       </section>
      
     <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-12">
                  <div class="blog-post">
                    <%
                    try{
                    	String student_mail2="";
                    	 int class_id2 = Integer.parseInt(request.getParameter("class_id"));
                    	 ResultSet rs= sbilgi.selectclassData(class_id2);
                    
                  
                    while(rs.next()){
                    	 student_mail2=rs.getString(3).toString();
                    	 ResultSet rsmm= stbilgi.selectAllDatastudent(student_mail2);
                    	 while(rsmm.next()){
                    			 
                    	%>
                    <div class="down-content">
                      <span><%=rsmm.getString(2) %></span> <%} %>
                      <input type= "hidden" name="comment_classid" value="<%=class_id2%>">
                      <input type= "hidden" name="comment_postid" value="<%=rs.getInt(1)%>">
                      <input type= "hidden" name="student_mail" value="<%=rs.getString(3)%>">
                      <ul class="post-info">
                        <li><%=rs.getString(4) %></li>
                      </ul>
                      <p> <%=rs.getString(2) %></p>

                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                              <%
                            String student_mail = session.getAttribute( "student_mail" ).toString();
                            System.out.println("degerbir"+student_mail);
                            System.out.println("degeriki"+student_mail2);
                            if (student_mail.equals(student_mail2)== true)
                            {%>
                            	  <li><a href="deletepost.jsp?post_id=<%=rs.getInt(1) %>&class_id=<%=class_id2%>&page_number=<%=0%>">Delete</a></li>
                            </ul>
                          </div>
                          <% }%>
                        </div>
                      </div>
                     
                        <div class="col-lg-12">
                  <div class="sidebar-item comments">
                    <div class="sidebar-heading">
                      <h2>Comments</h2>
                    </div>
 <jsp:useBean id="serbilgim" class="classoperation.classogConnection"></jsp:useBean>
                     <%
                     try{
                   	 int cid=Integer.parseInt(request.getParameter("class_id"));
                   	 int pid=rs.getInt(1);
                   	 ResultSet rsm= serbilgim.selectAllComments(cid,pid);
                    
                    
                    while(rsm.next()){
                                     
                   	%>
 
                    <div class="content">
                      <ul>
                        <li>
							<div class="author-thumb">
                            <img src="./studenttemplate/assets/images/avatar.png" alt="">
                          </div>
                          <div class="right-content">
                            <h4><%=rsm.getString(6)%><span><%=rsm.getString(5) %></span></h4>
                            <p><%=rsm.getString(2)%></p>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <%
                    }
                     }
                     catch(Exception e)
                     {
                     out.println("a"+e);
                     } %> 
                   
                  </div>
                </div>
                 <div class="col-lg-12">
                  <div class="sidebar-item submit-comment">
                    <div class="sidebar-heading">
                      <h2>Your comment</h2>
                    </div>
                    <div class="content">
                      <form id="comment" action="commentclasspost.jsp" method="post">
                        <div class="row">
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              <input name="comment_content" type="text" id="subject" placeholder="Subject">
                               <input type= "hidden" name="comment_classid" value="<%=class_id2%>">
                     			 <input type= "hidden" name="comment_postid" value="<%=rs.getInt(1)%>">
                     			 <input type= "hidden" name="student_mail" value="<%= session.getAttribute( "student_mail" ) %>">
                     			 <input type= "hidden" name="page_number" value=<%=0 %>>
                            </fieldset>
                          </div>
                    
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <br>
                 </div>
            </div>
        <%
                        
                     }
                    
                    }
                     catch(Exception e)
                         {
                         out.println("a"+e);
                         } %> 
          </div>
                 
                </div>
                </div>
                    <br>
                    <br>
                     
                                  
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
    