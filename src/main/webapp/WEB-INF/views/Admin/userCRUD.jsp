<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java</title><meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Spring Boot Fashion</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- Header -->
        <div id="top-nav" class="navbar navbar-default navbar-static-top">
            <div class="container bootstrap snippets bootdey">
                <div class="navbar-header">
                    <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/logo black transparent.png" width="100px"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#">
                                <i class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
                            <ul id="g-account-menu" class="dropdown-menu" role="menu">
                                <li>
                                    <sec:authorize access ="isAuthenticated()"> <!--Το sec:authedication το έβαλα ενδιάμεσα του sec:authorize γιατί έσκαγε όλο το Home όταν δεν υπήρχε Login με κάποιο ROLE -->
                                        <a href="${pageContext.request.contextPath}/user/profile/<sec:authentication property="principal.username"/>">My Profile (<sec:authentication property="principal.username"/>)</a>
                                    </sec:authorize> 
                                </li>
                                <li><a href="${pageContext.request.contextPath}/chat">Chat</a></li>
                                    <sec:authorize access ="!isAuthenticated()">  
                                    <li><a href="${pageContext.request.contextPath}/loginpage">Login</a></li>
                                    </sec:authorize> 
                                    <sec:authorize access ="isAuthenticated()">  
                                    <li>
                                        <form:form id="logoutform" action="${pageContext.request.contextPath}/logout" method="POST">
                                            <a href="javascript:{}" onclick="document.getElementById('logoutform').submit();" style="color:black;"><i class="glyphicon glyphicon-lock"></i> Logout</a>       
                                        </form:form>      
                                    </li>
                                </sec:authorize> 
                            </ul>
                        </li>
                    </ul>
                </div>
            </div><!-- /container -->
        </div>
        <!-- /Header -->



        <!-- MAIN -->
        <div class="container bootstrap snippets bootdey">
            <!-- upper section -->
            <div class="row--">
                <!-- Toolbox -->
                <div class="col-md-3">
                    <p><strong><i class="glyphicon glyphicon-briefcase"></i> Toolbox</strong></p>
                    <hr>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="${pageContext.request.contextPath}/admin/product"><i class="glyphicon glyphicon-list-alt"></i> List of Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/user"><i class="glyphicon glyphicon-list-alt"></i> List of Users</a>
                        <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="glyphicon glyphicon-list-alt"></i> List of Orders</a>
                    </ul>
                    <hr>
                </div><!-- /span-3|||---Toolbox -->

                <!--Main Content -->
                <div class="col-md-9">
                    <!-- column 2 -->
                    <!--<div class="dashboard">-->
                    <sec:authorize access ="hasRole('ADMIN')">
                        <a href="${pageContext.request.contextPath}/admin"><strong><i class="glyphicon glyphicon-dashboard"></i> Admin Home</strong></a><a class="dashboard" style="text-decoration:none;" onmouseover="this.style.color = '#478BCA';" onmouseout="this.style.color = '';"> / List of Users</a>
                                </sec:authorize> 
                    <!--</div>-->   
                    <hr>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row--">
                                <p>
                                    ${message}
                                </p>
                                <a href="${pageContext.request.contextPath}/admin/user/create"class="btn btn-info col-sm-2" style="margin-bottom: 10px; margin-top: 0; background-color:#6BCE1B; border-color:#6BCE1B"><i class="glyphicon glyphicon-plus"></i>Add user</a>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>username</th>
                                            <!--<th>password</th>-->
                                            <th>email</th>
                                            <th>firstname</th>
                                            <th>lastname</th>
                                            <th>phonenumber</th>
                                            <th>credits</th>                        
                                            <th colspan="2">Actions</th>

                                        </tr>
                                    </thead>

                                    <c:forEach items="${listOfUsers}" var = "user">
                                        <tr>
                                            <td>${user.userid}</td>
                                            <td>${user.username}</td>
                                            <!--<td>${user.password}</td>-->
                                            <td>${user.email}</td>
                                            <td>${user.firstname}</td>
                                            <td>${user.lastname}</td>
                                            <td>${user.phonenumber}</td>
                                            <td>${user.credits}</td>

                                            <td>      
                                                <a href="${pageContext.request.contextPath}/admin/user/update/${user.userid}">Update</a>
                                            </td>

                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/user/delete?id=${user.userid}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <br>
                            </div>
                            <!--/col-->
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <!--/col-span-9|||---Main Content ---->
            </div>
            <!-- /upper section -->
        </div><!--/container||| MAIN-->


        <!-- FOOTER -->

        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and IOS mobile phone.</p>
                        <div class="app-logo">
                            <img src="${pageContext.request.contextPath}/images/play-store.png">
                            <img src="${pageContext.request.contextPath}/images/app-store.png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="${pageContext.request.contextPath}/images/logo transparent.png">
                        <p>Our Purpose Is To Learn How to Make Beautiful, User-friendly and Responsive Sites.
                        </p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>
                        <ul>
                            <li>Coupons</li>
                            <li>Blog Post</li>
                            <li>Return Policy</li>
                            <li>Join Affiliate</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow us</h3>
                        <ul>
                            <li>Facebook</li>
                            <li>Twitter</li>
                            <li>Instagram</li>
                            <li>Youtube</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2021 - CB12 Part Time</p>
            </div>


        </div>
        <!-- /FOOTER -->
        <script src="${pageContext.request.contextPath}/js/burgermenu.js"></script>   
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>


    </body>
</html>
