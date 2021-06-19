<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import ="java.sql.Statement" %>
<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement	" %>


<!DOCTYPE html>
<html lang="en">

<head>
<%
try
{
String bilgi=session.getAttribute( "admin_mail" ).toString();
if (bilgi == null){
	  
}}
catch (Exception e) { System.out.println("Hata:"+e.getMessage());
response.sendRedirect("adminlogin.jsp");}

%>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./adminp/assets/img/favicon.png">
  <title>
    Admin Panel
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href=".adminp/assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./adminp/assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./adminp/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper">
    <div class="sidebar">
     
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="javascript:void(0)" class="simple-text logo-mini">
            
          </a>
          <a href="javascript:void(0)" class="simple-text logo-normal">
            
          </a>
        </div>
        <ul class="nav">
          <li>
            <a href="./adminhome.jsp">
              <i class="tim-icons icon-atom"></i>
              <p>HOME</p>
            </a>
        </li>
          
          <li>
          <li>
            <a href="./selectallclass.jsp">
              <i class="tim-icons icon-atom"></i>
              <p>Class Information</p>
            </a>
            </li>
          </li>
 				<li >
            <a href="./selectallstudents.jsp">
             <i class="tim-icons icon-chart-pie-36"></i>
              <p>Student Information</p>
            </a>
        </li>
          
           <li class="active">
            <a href="./selectallteacher.jsp">
              <i class="tim-icons icon-atom"></i>
              <p>Teacher Information</p>
            </a>
            </li>
                       <li class=>
            <a href="./selectalladmin.jsp">
              <i class="tim-icons icon-atom"></i>
              <p>Admin Information</p>
            </a>
            </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle d-inline">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:void(0)">Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
                <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" ></i>
                  <span class="d-lg-none d-md-block">Search</span>
                </button>
              </li>
              
              <li class="dropdown nav-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <div class="photo">
                  <img src="./adminp/assets/img/anime3.png" alt="Profile Photo">
                  </div>
                  <b class="caret d-none d-lg-block d-xl-block"></b>
                  <p class="d-lg-none">
                    Log out
                  </p>
                </a>
               <ul class="dropdown-menu dropdown-navbar">
                  <li class="nav-link"><a href="#" class="nav-item dropdown-item"> <%= session.getAttribute( "admin_mail" ) %></a></li>
                  <li class="nav-link"><a href="adminmysettings.jsp" class="nav-item dropdown-item">My Settings</a></li>
                  <li class="dropdown-divider"></li>
                  <li class="nav-link"><a href="logout.jsp" class="nav-item dropdown-item">Log out</a></li>
                </ul>
              </li>
           
              <li class="separator d-lg-none"></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
        <div class="content">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h5 class="title"></h5>
                     <div class="content">
                      <h5><a class="submit" href="addnewteacher.jsp">Add New Teacher</a></h5>
                       <div class="col-md-24">
       <form action="" method="get">
       <input type="text" class="form-control" name="q" placeholder="Search"/>
       </form>
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> Teachers Table</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                        <th class="text-center">
                          Teacher ID
                        </th>
                        <th class="text-center">
                          Teacher Name
                        </th>
                        <th class="text-center">
                          Teacher Mail
                        </th>
                        <th class="text-center">
                          Teacher Password
                        </th>
                         <th class="text-center">
                          Time
                        </th>
                         <th class="text-center">
                         Delete
                        </th>
                         <th class="text-center">
                         Update
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <jsp:useBean id="sbilgi" class="teacheroperation.teacherdatabaseislemleri"></jsp:useBean>
                    <%
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    String query= request.getParameter("q");
                    ResultSet rs;
                    try
                    {
                    if (query!= null){
                    	 rs= st.executeQuery("select * from teacher where teacher_name like '%"+query+"%'");
                    }
                    else
                    {
						
                    	 rs = sbilgi.selectAllData();
                   
                    }
                   
                    	
                    while (rs.next())
                    {
                    	 int teacher_id= rs.getInt(1);
                  
                    %>
                      <tr>
                        <td>
					<%=rs.getInt(1) %>
                        </td>
                         <td>
					<%=rs.getString(2) %>
                        </td>
                         <td>
					<%=rs.getString(3) %>
                        </td>
                         <td>
					<%=rs.getString(4) %>
                        </td>
                            <td>
					<%=rs.getString(5) %>
                        </td>
                          <td>
                    <a href='teacherdelete.jsp?teacher_id=<%=teacher_id%>'>DELETE</a>
					
                        </td>
                          <td>
					  <a href='teacherupdate.jsp?teacher_id=<%=teacher_id%>'>UPDATE</a>
                        </td>
                      </tr>
                      <%
                    }
                    }
                      catch(Exception e)
                      {
                      out.println(e);
                      } %>
                    </tbody>
                  </table>
                </div>
                  <a href='exportteacherdata.jsp'>Export Data</a>
              </div>
            </div>
          </div>
              </div>
</div>
            </div>
            </div>
          </div>
        </div>
         </form>
        <div class="row">
         
      </div>
      <footer class="footer">
        <div class="container-fluid">
          <ul class="nav">
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
             
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
              
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
               
              </a>
            </li>
          </ul>
          <div class="copyright">
          
            <script>
              document.write(new Date().getFullYear())
            </script> <i class="tim-icons icon-heart-2"></i> 
            <a href="javascript:void(0)" target="_blank"></a> 
          </div>
        </div>
      </footer>
    </div>
  </div>
  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Background</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger background-color">
            <div class="badge-colors text-center">
              <span class="badge filter badge-primary active" data-color="primary"></span>
              <span class="badge filter badge-info" data-color="blue"></span>
              <span class="badge filter badge-success" data-color="green"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="adjustments-line text-center color-change">
          <span class="color-label">LIGHT MODE</span>
          <span class="badge light-badge mr-2"></span>
          <span class="badge dark-badge ml-2"></span>
          <span class="color-label">DARK MODE</span>
        </li>
       
      
          <br>
          <br>
        </li>
      </ul>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="./adminp/assets/js/core/jquery.min.js"></script>
  <script src="./adminp/assets/js/core/popper.min.js"></script>
  <script src="./adminp/assets/js/core/bootstrap.min.js"></script>
  <script src="./adminp/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="./adminp/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="./adminp/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./adminp/assets/js/black-dashboard.min.js?v=1.0.0"></script><!-- Black Dashboard DEMO methods, don't include it in your project! -->
  <script src="./adminp/assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .background-color span').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data', new_color);
          }

          if ($main_panel.length != 0) {
            $main_panel.attr('data', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data', new_color);
          }
        });

        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });

        $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (white_color == true) {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').removeClass('white-content');
            }, 900);
            white_color = false;
          } else {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').addClass('white-content');
            }, 900);

            white_color = true;
          }


        });

        $('.light-badge').click(function() {
          $('body').addClass('white-content');
        });

        $('.dark-badge').click(function() {
          $('body').removeClass('white-content');
        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();

    });
  </script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "black-dashboard-free"
      });
  </script>
</body>

</html>