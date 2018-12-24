<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.icreon.*" %>
<%@ page import="com.icreon.worklogs.daoImpl.*" %>

<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Icreon Worklogs</title>
      
 
	<link rel="stylesheet" href="resources/css/footer-distributed-with-search.css">

  
      
      <link rel="stylesheet" href="resources/css/components.css">
      <link rel="stylesheet" href="resources/css/icons.css">
      <link rel="stylesheet" href="resources/css/responsee.css">
      
       <link href="resources/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template-->
  <link href="resources/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/resources/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
      
     
    
<!--     <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" /> -->
   <link rel="Stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />  
   
     <style>
div.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  
  padding: 10px;
  font-size: 10px;
}
</style>
   <style>
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #6b1381;
   color: white;
   text-align: center;
}
</style>
   
   <style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #6b1381;
  color: white;
}
</style> 
   </head>
   <body class="size-1140">
   
 



<header class="header-fixed">

	<div class="header-limiter">

		<h1 style="color:#9e10c1;"><a href="#">ICREON <span>Jira Portal</span></a></h1>
		
	</div>

</header>

<div class="topnav sticky">
  <a href="test.jsp"><i class="fa fa-fw fa-home"></i>Home</a>
  <a  href="approvedWorklogs.jsp">Approved Worklogs</a>
  <a class="active" href="unApprovedWorklogs.jsp">Pending Worklogs</a>
  <a href="rejectedWorklogs.jsp">Rejected Worklogs</a>
  <a href="logout.jsp" align="right">Logout</a>
</div>

<!-- <b>#6b1381</b> -->
<style>
.header-fixed {
	background-color:#6b1381 ;
	box-shadow:0 1px 1px #ccc;
	padding: 20px 40px;
	height: 80px;
	color: #ffffff;
	box-sizing: border-box;
	top:-100px;

	-webkit-transition:top 0.3s;
	transition:top 0.3s;
}

.header-fixed .header-limiter {
	max-width: 1200px;
	text-align: center;
	margin: 0 auto;
}

/*	The header placeholder. It is displayed when the header is fixed to the top of the
	browser window, in order to prevent the content of the page from jumping up. */

.header-fixed-placeholder{
	height: 80px;
	display: none;
}

/* Logo */

.header-fixed .header-limiter h1 {
	float: left;
	font: normal 28px Cookie, Arial, Helvetica, sans-serif;
	line-height: 40px;
	margin: 0;
}

.header-fixed .header-limiter h1 span {
	color: #5383d3;
}

/* The navigation links */

.header-fixed .header-limiter a {
	color: #ffffff;
	text-decoration: none;
}

.header-fixed .header-limiter nav {
	font:16px Arial, Helvetica, sans-serif;
	line-height: 40px;
	float: right;
}

.header-fixed .header-limiter nav a{
	display: inline-block;
	padding: 0 5px;
	text-decoration:none;
	color: #ffffff;
	opacity: 0.9;
}

.header-fixed .header-limiter nav a:hover{
	opacity: 1;
}

.header-fixed .header-limiter nav a.selected {
	color: #608bd2;
	pointer-events: none;
	opacity: 1;
}

/* Fixed version of the header */

body.fixed .header-fixed {
	padding: 10px 40px;
	height: 50px;
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 1;
}

body.fixed .header-fixed-placeholder {
	display: block;
}

body.fixed .header-fixed .header-limiter h1 {
	font-size: 24px;
	line-height: 30px;
}

body.fixed .header-fixed .header-limiter nav {
	line-height: 28px;
	font-size: 13px;
}


/* Making the header responsive */

@media all and (max-width: 600px) {

	.header-fixed {
		padding: 20px 0;
		height: 75px;
	}

	.header-fixed .header-limiter h1 {
		float: none;
		margin: -8px 0 10px;
		text-align: center;
		font-size: 24px;
		line-height: 1;
	}

	.header-fixed .header-limiter nav {
		line-height: 1;
		float:none;
	}

	.header-fixed .header-limiter nav a {
		font-size: 13px;
	}

	body.fixed .header-fixed {
		display: none;
	}

}

/*
	 We are clearing the body's margin and padding, so that the header fits properly.
	 We are also adding a height to demonstrate the scrolling behavior. You can remove
	 these styles.
 */

body {
	margin: 0;
	padding: 0;
	height: 1500px;
}
</style>

<!-- You need this element to prevent the content of the page from jumping up -->

<!--    <div id="all-content" class="with-sticky-footer container1 container-White"> -->
<!--          TOP NAV WITH LOGO -->
  
<!--          <section> -->
<!--             FIRST BLOCK -->
<!--             <div id="first-block"> -->
<form>
 <div class="container1 container-White py-10">
       
       
       
<!--           <div class="row"> -->
<!--       <div class="col-md-10 mx-auto"> -->
<!--           <div class="form-group row">  -->

<div class="col-sm-12"> 
			
			      <!-- Example DataTables Card-->
      <div class="card mb-3">
      
        <div class="card-header">
        

  
            <table class="table table-bordered py10" id="ex1" width="100%" cellspacing="0" >
              
             <thead>
                <tr class="warning" >
                      <td ><h6>S.No</h6></td>
                     <td ><h6>Project</h6></td>
                    <td ><h6>Jira ID</h6></td>
                     <td ><h6>Issue No.</h6></td>
                       <td ><h6>Start Date</h6></td> 
<!--                       <td ><h6>Updated At</h6></td> -->
                       <td ><h6>Description</h6></td>
                        <td ><h6>Resource</h6></td>
                         <td ><h6>Time Logged</h6></td>
                         <td><h6>Status</h6></td>
                      
                </tr>
            </thead>
            
            <tr>
            
            <%
            try
            {
            	WorklogsDaoImpl wd=new WorklogsDaoImpl();
            	List<Object[]> obj=wd.unApprovedWorklog();
            	int i=0;
            	for(Object[] ob : obj)
        		{
        			++i;
        			
        			%>
        			<td><%=i%></td>
        			  <td><%=ob[0]%></td>
		       
		        <td><%=ob[2]%></td>
		         <td><%=ob[1]%></td>
		        	        <td><%=ob[3]%></td>
		        	        	        
		        	     <td><%=ob[4]%></td>
		       	        <td><%=ob[5]%></td>
		       	        <td><%=ob[6]%> hours</td>
		       	         <td><b><span style="color:blue">NOT APPROVED</b></span></td>
        			
		       
		      </tr>
        			<% 
        		}
            }
            catch(Exception e)
            {
            	e.printStackTrace();
            }
            %>
			
			
			
		
           
    	        
            </table>
        
 

        
 </div>
        </div>
			
             
            </div>
<!--          </section> -->
<!--          </div> -->
         </div> 
         </form>
<br>
      <div class="footer">
      <br>
  <p class="footer-company-name">© 2018 COPYRIGHT ICREON</p>
</div>

   
    
   
	
	 <!-- Bootstrap core JavaScript-->
     <script src="resources/resources/vendor/jquery/jquery.min.js"></script> 
    <script src="resources/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="resources/resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="resources/resources/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/resources/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="resources/resources/js/sb-admin-datatables.min.js"></script>
    
	  
 
     
     <script type="text/javascript" src="resources/resources/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="resources/resources/js/dataTables.buttons.min.js"></script>
   <script type="text/javascript" src="resources/resources/js/buttons.flash.min.js"></script>
   <script type="text/javascript" src="resources/resources/js/jszip.min.js"></script>
   <script type="text/javascript" src="resources/resources/js/pdfmake.min.js"></script>
   <script  type="text/javascript" src="resources/resources/js/vfs_fonts.js"></script>
    <script type="text/javascript" src="resources/resources/js/buttons.html5.min.js"></script>
   <script type="text/javascript" src="resources/resources/js/buttons.print.min.js"></script>
  
  

   

  <script  type="text/javascript">
       $(document).ready(function () {
           $('#ex1').DataTable({
               "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],

               dom: 'Bfrtip',
               buttons: [
                   'excel', 'print'
               ]

           });
       });

  
   
   </script>
  
   



   
   </body>
</html>