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
        <!----------------------- single product details----------------------->        
        <div class="small-container single-product">
            <div class="row">
                <div class="col-2">
                    <img src="${pageContext.request.contextPath}/images/${product.image}" width="100%" id="productImg">
                    <!--Θέλει φτιάξιμο-->
                    <div class="small-img-row">
                        <div class="small-img-col">
                            <img src="${pageContext.request.contextPath}/images/gallery-1.jpg" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="${pageContext.request.contextPath}/images/gallery-2.jpg" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="${pageContext.request.contextPath}/images/gallery-3.jpg" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="${pageContext.request.contextPath}/images/gallery-4.jpg" width="100%" class="small-img">
                        </div>
                    </div>
                    <!------------------->
                </div>

                <div class="col-2">
                    <!--Θέλει φτιάξιμο-->
                    <p><a href="${pageContext.request.contextPath}/collection">Collection</a> / ${product.category.categoryname}</p> 
                    <!------------------->
                    <h1>${product.color.colorname} ${product.title}, ${product.category.categoryname} by ${product.brand.brandname}</h1>
                    <h4>${product.price} €</h4>
                    <!--Θέλει φτιάξιμο-->
                    <select>
                        <option>Select Size</option>
                        <option>Small</option>
                        <option>XL</option>
                        <option>Large</option>
                        <option>Medium</option>
                        <option>Small</option>
                    </select>
                    <!------------------->
                    <input type="number" value="1">
                    <a href="${pageContext.request.contextPath}/user/cart/${product.productid}" class="btn">Add To Cart</a>
                    <h3>Product Details <i class="fa fa-indent"></i></h3>
                    <br>
                    <!--Θέλει φτιάξιμο-->
                    <p>Give yourself a wardrobe style upgrade with the ${product.brand.brandname}'s ${product.title}. Mix it with other products and create your own sport and casual 
                        looks for your morning, evening and night appearences.</p> 
                    <!------------------->


                </div>
            </div>
            <!-- -----------title-------------- -->
            <div class="small-container">
                <div class="row row-2">
                    <h2>Related Products</h2>
                    <p>View More</p>


                </div>
            </div>

        </div>

        <!-- ----------------products-------------------- -->


        <div class="small-container">

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
        </div>
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

    <script>
                   var ProductImg = document.getElementById("productImg");
                   var SmallImg = document.getElementsByClassName("small-img");

                   SmallImg[0].onclick = function () {
                       ProductImg.src = SmallImg[0].src;
                   }
                   SmallImg[1].onclick = function () {
                       ProductImg.src = SmallImg[1].src;
                   }
                   SmallImg[2].onclick = function () {
                       ProductImg.src = SmallImg[2].src;
                   }
                   SmallImg[3].onclick = function () {
                       ProductImg.src = SmallImg[3].src;
                   }


    </script>


</body>
</html>
