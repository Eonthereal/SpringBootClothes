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
        <title>Login Page</title>

        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo black transparent.png" width="200px">
                </div>
                <nav>
                    <ul id="MenuItems">
                        <sec:authorize access ="hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
                            </sec:authorize> 
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/collection">Collection</a></li>
                        <li><a href="${pageContext.request.contextPath}/offers">Offers</a></li>
                        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/loginpage">Login</a></li>
                    </ul>
                </nav>
                <img src="images/cart.png" width="30px" height="30px">
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">

                <div class="row">
                    <sec:authorize access ="hasAnyRole('ADMIN','USER')"> <!--Το sec:authedication το έβαλα ενδιάμεσα του sec:authorize γιατί έσκαγε όλο το Home όταν δεν υπήρχε Login με κάποιο ROLE -->

                        <span><sec:authentication property="principal.username"/></span>

                        <%--<spa><sec:authentication property="principal.authorities"/></spa>--%>
                    </sec:authorize> 

                    <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                        <input type="submit" value="Logout">            
                    </form:form>
                </div>
            </div>
        </div>


        <div class="account-page">          
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <img src="images/models1.png" width=100%>                        
                    </div>
                    <div class="col-2">
                        <div class="form-container">

                            <div class="form-btn">
                                <span onclick="register()">Register</span>
                                <span onclick="login()">Login</span>
                                
                                <hr id="Indicator">
                            </div>
                            <c:if test="${requestScope.registered != null}">
                                <div class="registered">
                                    <i>Successfully registered. Try to sign in!!!</i>
                                </div>
                            </c:if>

                            <form:form id="LoginForm" action="${pageContext.request.contextPath}/authenticate" method="POST">
                                <input type="text" name="username" placeholder="Username"/>

                                <input type="password" name="password" placeholder="Password"/>

                                <input type="submit" value="Login" class="btn"/>

                                <a href="#">Forgot Password</a>
                            </form:form>

                            <c:if test="${param.logout !=null}">
                                <div class="logout">
                                    You logged out successfully
                                </div>
                            </c:if>
                            <c:if test="${param.error !=null}">
                                <div class="error">
                                    Invalid Credentials
                                </div>
                            </c:if>

                            <form:form id="RegForm" action="${pageContext.request.contextPath}/register" method="POST" modelAttribute="reguser"> 
                                <p id="error-message"></p>
                                <form:input class= "firstname" path="firstname" id="firstname" placeholder="Enter your First Name" />
                                <form:errors class="form-control firstname" path="firstname"/>

                                <form:input path="lastname" id="lastname" placeholder="Enter your Last Name"/>
                                <form:errors class="form-control" path="lastname"/>

                                <form:input type="email" path="email" id="email" placeholder="Enter your E-mail"/>
                                <form:errors class="form-control" path="email"/>

                                <form:input path="phonenumber" id="phonenumber" maxlength="20" placeholder="Enter your Phone Number" />
                                <form:errors class="form-control" path="phonenumber"/>

                                <form:input path="username" id="username" placeholder="Enter your Username"/>
                                <form:errors class="form-control" path="username"/>    

                                <form:password  path="password" placeholder="Enter your Password"/>
                                <form:errors class="form-control" path="password"/>   

                                <input id="submit" type="submit" value="Register" class="btn"/>  

                            </form:form>
                        </div>
                    </div>   
                </div>   
            </div>
        </div>   

        <!-- FOOTER -->

        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and IOS mobile phone.</p>
                        <div class="app-logo">
                            <img src="images/play-store.png">
                            <img src="images/app-store.png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="images/logo transparent.png">
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
        <script src="js/burgermenu.js"></script>
        <script src="js/toggleform.js"></script>
        <!-- --------------js for toggle form-------------- -->
        <!--            <script>
                                                var LoginForm = document.getElementById("LoginForm");
                                                var RegForm = document.getElementById("RegForm");
                                                var Indicator = document.getElementById("Indicator");
        
                                                function register() {
                                                    RegForm.style.transform = "translateX(0px)";
                                                    LoginForm.style.transform = "translateX(0px)";
                                                    Indicator.style.transform = "translateX(100px)";
                                                }
        
                                                function login() {
                                                    RegForm.style.transform = "translateX(300px)";
                                                    LoginForm.style.transform = "translateX(300px)";
                                                    Indicator.style.transform = "translateX(0px)";
                                                }
        
        
                    </script>-->

    </body>
</html>
