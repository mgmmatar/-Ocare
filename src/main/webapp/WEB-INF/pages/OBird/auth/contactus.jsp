
<%--
    Document   : reservationProcess
    Created on : Sep 24, 2015, 12:54:02 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title> Patient Profile </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/contactusstyle.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ekko-lightbox.min.css'/>">
         
        
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.bpopup.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/contactusindex.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/ekko-lightbox.min.js'/>"></script>

        <!-- NEW -->
        <script type="text/javascript" src="<c:url value='/resources/js/nprogress.js'/>"></script>
        <script>
            NProgress.start();
        </script>
        <!--- Page Styles--->
        <!-- Bootstrap Styles-->
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/js/morris/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />


        <script type="text/javascript">
            $(document).ready(function() {
              
            });
        </script>
            
        <%@include file="../basic/scripts.jsp" %>
        
    </head>
     
         <body class="nav-md">

            <div class="container body">

                <div class="main_container">
 
                    <!---  Importing SideBar --->

                    <%@include file="../basic/sidebar.jsp" %>

                    <!-- Header -->

                    <%@include file="../basic/header.jsp" %>

                     <div class="right_col" role="main">
     
                    <div class="clearfix"></div>   
           
                  <!-- Content --->
          
             <div id="page-wrapper">
                <div id="page-inner">
                    <div class="page-title">
                    </div>
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row expandUp">
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                
   
                                
                                
                         
                                
                                
                                
  <header class="headerr">

    <div class="headerr-overlay">

      <div class="container">

        <div class="row">

          <div class="col-md-12">

            <!--Title Text-->
            <div class="headerr-text">

              <h1>Thanks For Trust</h1>
              <br></br><p>
                You Can See How It Work? or You Can Contact Us ......
              </p>
              <div class="headerr-buttons">
                <p><a class="btn btn-contact wow fadeInLeft" href="#Work" id="work-button">Work</a><a class="btn btn-contact wow fadeInLeft" href="#Contact">Contact</a></p>  
              </div>


            </div>

          </div>

        </div>

      </div>

    </div>

  </header>

  <!--Portfolio-->
  <section class="portfolio">

    <div class="container">

      <div class="row">

        <div class="col-md-10 col-md-offset-1">

          <div class="section-title">

            <h2 id="Work">
                  Work
                </h2>
            <p>
              Below you can view some of our application pages . Click thumbnails to enlarge.
            </p>

          </div>

          <div class="section-demos">

            <!--demo item 1-->
            <div class="row">
              <div class="col-md-4">
                <div class="demo-item">
                  <h4>
                      My Radio Promotions
                    </h4>
                  <a href="/ocare/resources/css/images/ship_bottle.jpg" data-toggle="lightbox" data-title="My Radio Promotion">
                    <img src="/ocare/resources/css/images/ship_bottle.jpg" class="img-thumbnail img-responsive"></a>
                  </a>
                </div>
              </div>
              <div class="col-md-8">
                <p>
                  The My Radio Promotions application promotes independent music artists to over 250,000 radio stations worldwide. Features include email campaigning, custom station reporting, unique url downloads for stations, and numerous others. Radio networks such
                  as BBC and CBS utilize the applicatin.
                </p>
              </div>
            </div>
            <!--demo item 2-->
            <div class="row">
              <div class="col-md-4">
                <div class="demo-item">
                  <h4>
                    Windows & Linux Server Control
                  </h4>
                  <a href="/ocare/resources/css/images/ship_bottle.jpg" data-toggle="lightbox" data-title="Windows & Linux Server Control">
                    <img src="/ocare/resources/css/images/ship_bottle.jpg" class="img-thumbnail img-responsive">
                  </a>
                </div>
              </div>
              <div class="col-md-8">
                <p>
                  The Windows & Linux Server Control tool executes server commands from the convenience of a front-end GUI. Commonly utilized server jobs and services are triggered from the GUI through a combination of AJAX and ASP.NET libraries. Each job result is displayed
                  in a distinct tab showing the same output.
                </p>
              </div>
            </div>
            <!--demo item 3-->
            <div class="row">
              <div class="col-md-4">
                <div class="demo-item">
                  <h4>
                    Data Center QA Tool
                  </h4>
                  <a href="/ocare/resources/css/images/ship_bottle.jpg" data-toggle="lightbox" data-title="Data Center Quality Assurance Tool">
                    <img src="/ocare/resources/css/images/ship_bottle.jpg" class="img-thumbnail img-responsive">
                  </a>
                </div>
              </div>
              <div class="col-md-8">
                <p>
                  As a Data Center Engineer, I designed a tool to streamline our 34-point inspection process when reviewing completed data center projects. While using the tool the reviewer is able to quickly score each category and provide a total score for each install.
                  A database record for each report is also created for reference purposes.
                </p>
              </div>
            </div>
            <!--demo item 4-->
            <div class="row">
              <div class="col-md-4">
                <div class="demo-item">
                  <h4>
                    Queue Manager
                  </h4>
                  <a href="/ocare/resources/css/images/ship_bottle.jpg" data-toggle="lightbox" data-title="Ticket Aggregator">
                    <img src="/ocare/resources/css/images/ship_bottle.jpg" class="img-thumbnail img-responsive">
                  </a>
                </div>
              </div>
              <div class="col-md-8">
                <p>
                  I also created the Queue Manager for our Data Center team. We were required to have an associated Sharepoint task for each Service Now request sent to us while continuing to update both tickets, which was often a challenge. This tool simplifies queue
                  management by aggregating and merging the queues from each ticket .
                </p>
              </div>
            </div>
            <!--demo item 5-->
            <div class="row">
              <div class="col-md-4">
                <div class="demo-item">
                  <h4>
                    QA Knowledgebase
                  </h4>
                  <a href="/ocare/resources/css/images/ship_bottle.jpg" data-toggle="lightbox" data-title="QA Knowledgebase">
                    </i><img src="/ocare/resources/css/images/ship_bottle.jpg" class="img-thumbnail img-responsive">
                  </a>
                </div>
              </div>
              <div class="col-md-8">
                <p>
                  The QA Knowledgebase is used daily to provide quick solutions for common issues for the QA environments team. Other documentation repositories are often slow, clunky, mixed with other team's information, or difficult to search due to being on fileshares.
                  The Knowledgebase offers Full-Text.
                </p>
              </div>
            </div>
            <!--demo item 6-->
            <div class="row">
              <div class="col-md-4">
                <div class="demo-item">
                  <h4>
                    Musik and Film Records
                  </h4>
                  <a href="/ocare/resources/css/images/ship_bottle.jpg" data-toggle="lightbox" data-title="Musik and Film Records">
                    <img src="/ocare/resources/css/images/ship_bottle.jpg" class="img-thumbnail img-responsive"></a>
                </div>
              </div>
              <div class="col-md-8">
                <p>
                  Record label Musik and Film Records provides customized radio promotion packages tailored for independent artists utilizing a network of 250,000+ radio stations in 180 countries around the world. In addition to developing the My Radio Promotions application
                  for them, I also redesigned .
                </p>
              </div>
            </div>

          </div>

        </div>

      </div>

  </section>

  <!-- Contact Us -->
  <section class="contact-us" id="CONTACT">

    <div class="container wow bounceIn">

      <div class="row">

        <div class="col-md-10 col-md-offset-1">

          <div class="section-title">

            <h2 id="Contact">Contact</h2>
            <p>You can reach us through our emails , phones or any of the social media sites below. Thanks for stopping by!</p>
          </div>

        </div>


      </div>


    </div>


    <div class="container">
      <div class="row">

        <div class="col-md-12 wow bounceInLeft">

          <div class="social-icons">

            <ul>

            khaled mosaad : <font>engkhaledmos3ad@gmail.com <li><a href="https://www.linkedin.com/in/khaled-mosaad-52b06694" target="_blank"><i class="fa fa-linkedin"></i></a></li>
              <li><a href="https://www.facebook.com/Khaled.Engineer?fref=ts" target="_blank"><i class="fa fa-facebook-official"></i></a></li>
              <br><br>
            Mahmoud Gamal : mahmoudgmatar@gmail.com  <li><a href="https://eg.linkedin.com/in/mahmoud-matar-280406118" target="_blank"><i class="fa fa-linkedin"></i></a></li>
              <li><a href="https://www.facebook.com/mahmoud.matar.3386" target="_blank"><i class="fa fa-facebook-official"></i></a></li>
              
            </ul>


          </div>


        </div>

      </div>

    </div>


  </section>
  

  <script>
    $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});
  </script>

  <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
  <script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
  </script>

  

                                 
                                
                        
                                
                                
                                
                                
                                 </div>          
                            
                            <!-- Widget -->
                            <%@include file="../basic/widgets.jsp" %>                            
                                                    
                        </div>
                         
                    </div>
                    <!-- /. ROW  -->

                    <!-- /. PAGE INNER  -->
                </div>
                <!-- /. PAGE WRAPPER  -->
                 
            </div>
        
            <!-- Metis Menu Js -->
            <script src="<c:url value='/resources/js/jquery.metisMenu.js'/>"></script>
            <!-- Morris Chart Js -->
            <script src="<c:url value='/resources/js/raphael-2.1.0.min.js'/>"></script>
            <script src="<c:url value='/resources/js/morris.js'/>"></script>
            <!-- Custom Js -->
            <script src="<c:url value='/resources/js/custom-scripts.js'/>"></script>   
           
            
             </div>
            
            </div><!--End Main Container-->

    </div><!--End Body Container-->
          
    </body>
</html>
