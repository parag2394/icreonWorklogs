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
        .expand_hover{
            max-width: 200px;
            text-overflow: ellipsis;
            cursor: pointer;
            word-break: break-all;
            overflow:hidden;
            white-space:nowrap;
        }
        .expand_hover:hover{
            overflow: visible;
            white-space: normal;
            height:auto;  /* just added this line */
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


        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 25%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }


    </style>
</head>
<body class="size-1140">

<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please login first to visit this page.');");
        out.println("location='logout';");
        out.println("</script>");



    }
%>



<header class="header-fixed">

    <div class="header-limiter">

        <h1 style="color:#9e10c1;"><a href="#">ICREON <span>Jira Portal</span></a></h1>

    </div>

</header>

<div class="topnav sticky">
    <a href="home"><i class="fa fa-fw fa-home"></i>Home</a>
    <a  href="approvedWorklogs.jsp">Approved Worklogs</a>
    <a href="unApprovedWorklogs.jsp">Pending Worklogs</a>
    <a class="active" href="rejectedWorklogs.jsp">Rejected Worklogs</a>
    <a href="logout" style="float:right">Logout</a>
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
        float: center;
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
        height: 500px;
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

        <%--<div id="divImage" style="display: none;height:75px;width:75px">
            <img src="https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif" >
        </div>--%>

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <div id="divImage" style="height:50px;width:50px">
                    <img src="https://media.giphy.com/media/xTk9ZvMnbIiIew7IpW/giphy.gif" >
                </div>
                <p>Processing... Please wait (It may take few seconds)</p>
            </div>

        </div>



        <div class="col-sm-12">

            <!-- Example DataTables Card-->
            <div class="card mb-3">

                <div class="card-header">



                    <table class="table table-bordered py10" id="ex1" width="100%" cellspacing="0" >

                        <thead>
                        <tr class="warning" >
                            <td ><h6>Sr. No</h6></td>
                            <td ><h6>Project</h6></td>
                            <!--                     <td ><h6>Jira ID</h6></td> -->
                            <td ><h6>Issue Name</h6></td>
                            <td ><h6>Date</h6></td>
                            <!--                       <td ><h6>Updated At</h6></td> -->
                            <td ><h6>Description</h6></td>
                            <td ><h6>Resource</h6></td>
                            <td ><h6>Time Logged</h6></td>
                            <td><h6>Status</h6></td>
                            <td><h6>Review</h6></td>

                        </tr>
                        </thead>

                        <tr>

                            <%
                                try
                                {
                                    WorklogsDaoImpl wd=new WorklogsDaoImpl();
                                    List<Object[]> obj=wd.showRejectedWorklog();
                                    int j=0;
                                    for(Object[] ob : obj)
                                    {
                                        ++j;

                                        String project_id=(String)ob[0];
                                        String worklog_id=(String)ob[1];
                                        String issue_id=(String)ob[2];

                            %>
                            <td><%=j%></td>
                            <td><%=ob[0]%></td>

                            <%-- 		        <td><%=ob[2]%></td> --%>
                            <td><%=ob[1]%></td>
                            <td><%=ob[3]%></td>

                            <td class ="expand_hover"><%=ob[4]%></td>
                            <td><%=ob[5]%></td>
                            <td><%=ob[6]%> hours</td>
                            <td><b><span style="color:blue">REJECTED</span></b></td>
                            <td>
                                <input type="hidden" id="p_project<%=j%>" value="<%=project_id%>" >
                                <input type="hidden" id="p_worklog<%=j%>" value="<%=worklog_id%>" >
                                <input type="hidden" id="p_issue<%=j%>" value="<%=issue_id%>" >
                                <input class="btn btn-primary" type="button" value="Approve" id="approve_button<%=j%>"
                                       onclick="confirmation('p_project<%=j%>','p_worklog<%=j%>','p_issue<%=j%>','approve_button<%=j%>')" />
                            </td>

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


<script>
    function confirmation(p,w,i,ab)
    {
        /*  $("#divImage").show();*/

        // Get the modal

        var modal = document.getElementById('myModal');
        modal.style.display = "block";

        var x=document.getElementById(p).value;
        var y=document.getElementById(w).value;
        var z=document.getElementById(i).value;
        //  alert(x);
        //  alert(y);
        //   alert(z);
        //alert(ab);
        $.ajax({
            type: 'GET',
            url: "updateRejectedToApproveStatus",
            data: {
                project_id:x,
                worklog_id:y,
                issue_id:z
            },
            success:function(data)
            {
                $("#divImage").hide();
                //	alert(data);
                var list = "";
                var list = jQuery.parseJSON(data);
                if(list==1)
                {
                    // alert('Approved and Sent Notification by Mail');
                    // 	$('#ab').val('Hello');
                    //  	document.getElementById(ab).value='Approved';
                    //  	document.getElementById(ab).disabled = true;
                    modal.style.display = "none";
                    window.location.href = "rejectedWorklogs.jsp";
                }




            }
        });
    }
</script>



<script  type="text/javascript">
    $(document).ready(function () {
        $('#ex1').DataTable({
            language: {
                paginate: {
                    next: '&#8594;', // or '→'
                    previous: '&#8592;' // or '←'
                }
            },
            "fnDrawCallback": function(oSettings) {
                if ($('#ex1 tr').length < 24) {
                    $('.dataTables_paginate').hide();
                }
            },
            "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],

            dom: 'Bfrtip',
            buttons: [
                'excel', 'print'
            ]

        });
        $('#ex1').on( 'page.dt', function () {
            $('html, body').animate({
                scrollTop: 0
            }, 300);
        } );
    });



</script>






</body>
</html>