<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <div class="top_nav">
            
            <div class="nav_menu" style="position: fixed;top: 0;width: 100%;z-index: 100;">
                
                <nav class="" role="navigation">
                       
                    <ul class="nav navbar-nav navbar-right">
   
                        
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">
                                <img src="<c:url value='/resources/images/superadmin1.png'/>" alt=""><sec:authentication property="principal.fullName"/>
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                <li><a href="/ocare/ums/user/profile"> Profile</a>
                                </li>
                                <li><a href="/ocare/ums/user/profile"> Help</a>
                                </li>
                                <li><a href="/ocare/auth/j_spring_security_logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                </li>
                            </ul>
                        </li>

                        <li role="presentation" class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown"
                               aria-expanded="false">
                                <i class="fa fa-bell-o"></i>
                                <span class="badge bg-green">1</span>
                            </a>
                            <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                                <li>
                                    <a>
                                                <span class="image">
                                                    <img src="<c:url value='/resources/images/khaled.jpg'/>" alt="Profile Image"/>
                                                </span>
                                                <span>
                                                    <span>Dr.John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Coming Soon in the new version of öcare  Loading....
                                                </span>
                                    </a>
                                </li>
                                         <li>
                                    <div class="text-center">
                                        <a>
                                            <strong><a href="/ocare/reservation/list">See All Alerts</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                                <button onclick="location.href = '/ocare/patient/register';" class="registerbuttonheader" type="submit">Register</button> 
                        </li>  
                     
                    </ul>
                    <ul class="navbar-left">
                         <input type="text" id="patientSearch" name="Search" class="searchBox" placeholder="Search For Patient"  required />
                         <img src="<c:url value='/resources/images/patient-icon.png'/>" class="patient-icon" id="searchPatientProfileFlag">
                         <img src="<c:url value='/resources/images/reservation.png'/>" class="reservation-icon" id="searchReservationProfileFlag">
                    </ul>              
                </nav>
            </div>
        </div>
        <!-- /top navigation -->