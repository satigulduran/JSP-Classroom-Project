<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="cbilgi" class="adminoperation.adminbilgisi" scope="page"></jsp:useBean>
<jsp:useBean id="adminislemi" class="adminoperation.adminlogin" scope="page"></jsp:useBean>

<%
session.invalidate();
response.sendRedirect("mainpage.jsp");
%>