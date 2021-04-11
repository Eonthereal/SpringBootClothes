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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add_update.css">
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
                        <a href="${pageContext.request.contextPath}/admin"><strong><i class="glyphicon glyphicon-dashboard"></i> Admin Home</strong></a> / <a href="${pageContext.request.contextPath}/admin/product"><strong>List of Products</strong></a><a class="dashboard" style="text-decoration:none;" onmouseover="this.style.color = '#478BCA';" onmouseout="this.style.color = '';"> / Add product</a>
                                </sec:authorize> 
                    <!--</div>-->   
                    <hr>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row-2">
                                <div class="panel">
                                    <form:form action="${pageContext.request.contextPath}/admin/product/create" method="POST" modelAttribute="product" class="form-horizontal"> 

                                        <fieldset class="fieldset">
                                            <h3 class="fieldset-title">Product Details</h3>

                                            <!--Title-->
                                            <div class="form-group">
                                                <label for="title" class="col-md-2 col-sm-3 col-xs-12 control-label">Title</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <form:input id="title" path="title"  />
                                                    <%--<form:errors path="title"/>--%>
                                                </div>
                                            </div>

                                            <!--Image-->
                                            <div class="form-group">
                                                <label for="image" class="col-md-2 col-sm-3 col-xs-12 control-label">Image</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <form:input  id="image" path="image" />
                                                    <%--<form:errors path="password"/>--%>
                                                </div>
                                            </div>

                                            <!--Price-->
                                            <div class="form-group">
                                                <label for="price" class="col-md-2 col-sm-3 col-xs-12 control-label">Price</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <form:input id="price" path="price" />
                                                    <%--<form:errors path="password"/>--%>
                                                </div>
                                            </div>

                                            <!--Offer-->
                                            <div class="form-group">
                                                <label for="offer" class="col-md-2 col-sm-3 col-xs-12 control-label">Offer</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <form:input id="offer" path="offer" />
                                                    <%--<form:errors path="password"/>--%>
                                                </div>
                                            </div>

                                            <!--RadioButtons-->
                                            <!--Brands-->
                                            <div class="col-md-2">
                                                <p><strong>Brand</strong></p>
                                                <div class="control-group">

                                                    <div class="radio">
                                                        <form:radiobuttons path="brand" items="${brands}" itemLabel="brandname" itemValue="brandid" element="ul" required="required" class="colored-blue" name="form-field-radio"/>
                                                        <form:errors path="brand"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--Category-->
                                            <div class="col-md-2">
                                                <p><strong>Category</strong></p>
                                                <div class="control-group">
                                                    <div class="radio">
                                                        <form:radiobuttons path="category" items="${categories}" itemLabel="categoryname" itemValue="categoryid" element="ul" required="required"/>
                                                        <form:errors path="category"/>
                                                    </div>
                                                </div>
                                            </div> 

                                            <!--Gender-->
                                            <div class="col-md-2">
                                                <p><strong>Gender</strong></p>
                                                <div class="control-group">
                                                    <div class="radio">
                                                        <form:radiobuttons path="gender" items="${genders}" itemLabel="gendername" itemValue="genderid" element="ul" required="required"/>
                                                        <form:errors path="gender"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--Size-->
                                            <div class="col-md-2">
                                                <p><strong>Size</strong></p>
                                                <div class="control-group">
                                                    <div class="radio">
                                                        <form:radiobuttons path="size" items="${sizes}" itemLabel="sizename" itemValue="sizesid" element="ul" required="required"/>
                                                        <form:errors path="size"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--Color-->
                                            <div class="col-md-2">
                                                <p><strong>Color</strong></p>
                                                <div class="control-group">
                                                    <div class="radio">
                                                        <form:radiobuttons path="color" items="${colors}" itemLabel="colorname" itemValue="colorid" element="ul" required="required"/>
                                                        <form:errors path="color"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--Submit button-->
                                            <div class="form-group">
                                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                                    <input class="btn btn-primary" style="background-color:#6BCE1B; border-color:#6BCE1B" type="submit" value="Submit"/>
                                                </div>
                                            </div>
                                            
                                        </fieldset>
                                    </form:form>
                                    <br>
                                </div>
                                <!--/col-->
                            </div>
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
