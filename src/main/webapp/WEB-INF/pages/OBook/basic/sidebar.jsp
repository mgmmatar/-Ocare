<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="col-md-3 left_col" style="position: fixed;">
            <div class="left_col">

                <div class="navbar nav_title" >
                    <a id="menu_toggle" class="site_title" style="width: 70%;"><i class="fa fa-stethoscope"></i> <span>öCare</span></a>

                </div>

                <div class="clearfix"></div>

                <!-- menu prile quick info -->
                <div class="profile">
                    <div class="profile_pic">
                        <a href="/ocare/ums/user/profile"><img src="<c:url value='/resources/images/superadmin1.png'/>" alt="..." class="img-circle profile_img"></a>
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>

                        <a href="/ocare/ums/user/profile"><h2><sec:authentication property="principal.fullName"/></h2></a>
                    </div>
                </div>
                <!-- /menu prile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                    <div class="menu_section">
                        <a href="/ocare/ums/user/profile"><h3><sec:authentication property="principal.roleName"/></h3></a>
                        <ul class="nav side-menu">
                            
                        <sec:authorize access="hasRole('SUPER_ADMIN') 
                                       or hasRole('ADMIN')
                                       or hasRole('RESERVATION_USER')">
                            <li class="" style="cursor: pointer"><a><i class="fa fa-home" style="cursor: pointer"></i> <label class="menuText" style="cursor: pointer">Home</label>
                                    <span class="fa fa-chevron-down" style="cursor: pointer"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="/ocare/reservation/list">Reservations</a>
                                    </li>
                                    
                                </ul>
                            </li>
                        </sec:authorize>    
                        
                        <sec:authorize access="hasRole('SUPER_ADMIN') 
                                       or hasRole('ADMIN')
                                       or hasRole('ENTRY_USER')">
                            <li class="" style="cursor: pointer"><a><i class="fa fa-user-plus" style="cursor: pointer"></i> <label class="menuText" style="cursor: pointer">Patient </label><span
                                    class="fa fa-chevron-down" style="cursor: pointer"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="/ocare/patient/list">Patient List</a>
                                    </li>
                                </ul>
                            </li>
                        </sec:authorize>
                            
                        <sec:authorize access="hasRole('SUPER_ADMIN') 
                                       or hasRole('ADMIN')
                                       ">        
                            <li class="" style="cursor: pointer"><a><i class="fa fa-cog" style="cursor: pointer"></i> <label class="menuText" style="cursor: pointer">Settings</label> <span
                                    class="fa fa-chevron-down" style="cursor: pointer"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="/ocare/settings/examineType/list">Examine Type</a>
                                    </li>
                                    <li><a href="/ocare/settings/reservationWay/list">Reservation Way</a>
                                    </li>
                                    <li><a href="/ocare/settings/insurrance/list">Insurance</a>
                                    </li>
                                    <li><a href="/ocare/settings/workingDays">Working Days</a>
                                    </li>
                                    
                                </ul>
                            </li>
                        </sec:authorize>    
                            
                        <sec:authorize access="hasRole('SUPER_ADMIN') 
                                       or hasRole('ADMIN')
                                       ">    
                            
                            <li class="" style="cursor: pointer"><a><i class="fa fa-pie-chart" style="cursor: pointer"></i> <label class="menuText" style="cursor: pointer">Reports</label> <span
                                    class="fa fa-chevron-down" style="cursor: pointer"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="/ocare/report/today">Today Report</a>
                                    </li>
                                    <li><a href="/ocare/report/reservation">Reservation Report</a>
                                    </li>
                                    <li><a href="/ocare/report/patient">Patient Report</a>
                                    </li>                                   
                                </ul>
                            </li>
                            
                        </sec:authorize> 
                        
                        <sec:authorize access="hasRole('SUPER_ADMIN') 
                                       or hasRole('ADMIN')
                                       ">    
                            <li class="" style="cursor: pointer"><a><i class="fa fa-users" style="cursor: pointer"></i> <label class="menuText" style="cursor: pointer">Users</label> <span
                                    class="fa fa-chevron-down" style="cursor: pointer"></span></a>
                                    
                                
                                <ul class="nav child_menu" style="display: none">
                                <sec:authorize access="hasRole('SUPER_ADMIN')">    
                                    <li><a href="/ocare/ums/admin">Admins</a>
                                    </li>
                                </sec:authorize>
                                    <li><a href="/ocare/ums/user">Users</a>
                                    </li>
                                </ul>
                            </li>
                         </sec:authorize>   
                            
                            
                            <sec:authorize access="hasRole('SUPER_ADMIN')">    
                            <li class="" style="cursor: pointer"><a><i class="fa fa-tripadvisor" style="cursor: pointer"></i> <label class="menuText" style="cursor: pointer">Logs</label> <span
                                    class="fa fa-chevron-down" style="cursor: pointer"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="/ocare/log/action">Action Log</a>
                                    </li>
                                    <li><a href="/ocare/log/reservation">Reservation Log</a>
                                    </li>
                                </ul>
                            </li>
                            </sec:authorize>   
                            
                        </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small" style="display: block;">
                   <a data-toggle="tooltip" data-placement="top" title="Logout" href="/ocare/auth/j_spring_security_logout">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock" href="/ocare/auth/j_spring_security_logout">
                        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen" href="/ocare/auth/j_spring_security_logout">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="help" href="/ocare/auth/j_spring_security_logout">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                    </a>
                    
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>