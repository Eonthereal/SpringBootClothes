<%-- 
    Document   : newjsp
    Created on : Mar 13, 2021, 10:27:55 PM
    Author     : eon_A
--%>

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
        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>


        <div class="header">


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
                            <li><a href="${pageContext.request.contextPath}/chat">Chat</a></li>
                        </ul>
                    </nav>
                    <a href="${pageContext.request.contextPath}/user/cart"><img src="images/cart.png" width="30px" height="30px"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">

                    <div class="row">
                        <sec:authorize access ="hasAnyRole('ADMIN','USER')"> <!--Το sec:authedication το έβαλα ενδιάμεσα του sec:authorize γιατί έσκαγε όλο το Home όταν δεν υπήρχε Login με κάποιο ROLE -->

                            <a href="${pageContext.request.contextPath}/user/profile/<sec:authentication property="principal.username"/>"> <sec:authentication property="principal.username"/></a>

                            <%--<spa><sec:authentication property="principal.authorities"/></spa>--%>
                        </sec:authorize> 

                        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                            <input type="submit" value="Logout">            
                        </form:form>
                    </div>
                </div>






                <div class="row">
                    <div class="col-2">
                        <h1>Give Your Spring Boot Project<br> A New Style!</h1>
                        <p>Success isn't alway about greatness. It's about consistency. Cosistent <br>hard work gains
                            success. Greatness will come.</p>
                        <a href="" class="btn">Explore now &#8594;</a>
                    </div>
                    <div class="col-2">
                        <img src="images/models1.png">

                    </div>
                </div>
            </div>
        </div>

        <!-- Featured categories -->

        <div class="categories">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <img src="images/category-1.jpg">
                    </div>
                    <div class="col-3">
                        <img src="images/category-2.jpg">
                    </div>
                    <div class="col-3">
                        <img src="images/category-3.jpg">
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured products -->
        <div class="small-container">
            <h2 class="tittle">Featured Products</h2>
            <div class="row">
                <div class="col-4">
                    <img src="images/product-1.jpg">
                    <h4>Red Printed Tshirt</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-2.jpg">
                    <h4>Black Running Shoes</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-3.jpg">
                    <h4>Grey Gym Pants</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-4.jpg">
                    <h4>Blue Puma Tshirt</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
            </div>
            <h2 class="tittle">Latest Products</h2>
            <div class="row">
                <div class="col-4">
                    <img src="images/product-5.jpg">
                    <h4>Red Printed Tshirt</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-6.jpg">
                    <h4>Black Running Shoes</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-7.jpg">
                    <h4>Grey Gym Pants</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-8.jpg">
                    <h4>Blue Puma Tshirt</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <img src="images/product-9.jpg">
                    <h4>Red Printed Tshirt</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-10.jpg">
                    <h4>Black Running Shoes</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-11.jpg">
                    <h4>Grey Gym Pants</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
                <div class="col-4">
                    <img src="images/product-12.jpg">
                    <h4>Blue Puma Tshirt</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$50.00</p>
                </div>
            </div>
        </div>

        <!-- offer -->
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="images/models2.png" class="offer-img">
                    </div>
                    <div class="col-2">
                        <p>Exclusively Available on Spring Boot Fashion Store</p>
                        <h1>Green Dress!</h1>
                        <small> This is a green short dress! Nothing much about it. This is supposed to be worn in the Summer season. On the windy days wear it with 
                            your own risk.
                        </small>
                        <br>
                        <a href="" class="btn">Buy Now &#8594;</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- testimonial -->
        <div class="testimonial">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Blanditiis ipsam deleniti consectetur
                            voluptatum, assumenda quibusdam iste in adipisci.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img src="images/Aris.png">
                        <h3>Aris Zografos</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Blanditiis ipsam deleniti consectetur
                            voluptatum, assumenda quibusdam iste in adipisci.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img src="images/Kostas.png">
                        <h3>Kostas Katsavaros</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Blanditiis ipsam deleniti consectetur
                            voluptatum, assumenda quibusdam iste in adipisci.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img src="images/Alex.png">
                        <h3>Alex Michailidis</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Blanditiis ipsam deleniti consectetur
                            voluptatum, assumenda quibusdam iste in adipisci.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img src="images/Aggeliki.png">
                        <h3>Angeliki Panagiotopoulou</h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- brands -->
        <div class="brands">
            <div class="small-container">
                <div class="row">
                    <div class="col-5">
                        <img src="images/peoplecert-logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images/spring-boot-logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images/logo-coca-cola.png">
                    </div>
                    <div class="col-5">
                        <img src="images/logo-paypal.png">
                    </div>
                    <div class="col-5">
                        <img src="images/asus-logo.png">
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->

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

        <!-- js for toggle menu -->
        <script src="js/burgermenu.js"></script>

    </body>
</html>
