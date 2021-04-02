<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        <style>

          
            
            #addressform{
                text-align: center;
            }
            #addressform input{
                width: 50%;
                margin-left:40px;
                text-align: center;
                font-weight: normal;
                font-family: "Poppins", sans-serif;
                font-size: 16px;
  
            }
            
            #addressform label{
                display: inline-block;
                text-align: right;
                width:50px;
                
        
            }
              .submitbutton{
                width: 10%;
                border: none;
                cursor: pointer;
                margin: 10px 0;
                display: inline-block;
                background: #6bce1b;
                color: #fff;
                padding: 20px 30px;
                text-align: center;
                line-height: 0;
                border-radius: 30px;
                transition: background 0.5s;
            }

            .submitbutton:focus{
                outline: none;
            }

            .submitbutton:hover {
                background: #033b21;
            }
            

        </style>

        <script>

        </script> 


    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/images/logo black transparent.png" width="200px">
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
                <img src="${pageContext.request.contextPath}/images/cart.png" width="30px" height="30px">
                <img src="${pageContext.request.contextPath}/images/menu.png" class="menu-icon" onclick="menutoggle()">

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

        <h1>Shipping Address</h1>


        <div class="container" id="addressform">
            <form:form action="${pageContext.request.contextPath}/user/cart/address/updateaddress" method="POST" modelAttribute="order">

                <form:hidden id="ordersid" path="ordersid"/>
                <br>


                <form:hidden id="user" path="user"/>
                <br>

                <label for="city">City:</label>
                <form:input id="city" path="city"/>
                <br>

                <label for="address">Address:</label>
                <form:input id="address" path="address"/>
                <br>

                <label for="zipcode">Zipcode:</label>
                <form:input id="zipcode" path="zipcode"/>




                <form:hidden id="status" path="status"/>



                <form:hidden id="totalcost" path="totalcost"/>



                <form:hidden id="orderdate" path="orderdate"/>


                <form:hidden id="tax" path="tax"/>


                <input class="submitbutton" type="submit" value="Submit Order"/>

            </form:form>
        </div>     








        <!-- /MAIN -->

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



    </body>
</html>
