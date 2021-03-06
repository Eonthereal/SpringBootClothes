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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo transparent.png" type="image/x-icon">

        <style>
/*            .purchased-products{
                display: grid;
                justify-content: space-between;
            }*/

            .purchased-products p{
                text-align: center;

            }

/*            .purchased-products img{
                margin-left: auto;
                margin-right: auto;
                display: block;
                width: 300px;
                height: auto;

            }*/

        </style>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/logo black transparent.png" width="200px"></a>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <!--<li><a href="${pageContext.request.contextPath}/">Home</a></li>-->
                        <li><a href="${pageContext.request.contextPath}/collection">Collection</a></li>
                        <li><a href="${pageContext.request.contextPath}/offers">Offers</a></li>
                        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/chat">Chat</a></li>
                            <sec:authorize access ="!isAuthenticated()">  
                            <li><a href="${pageContext.request.contextPath}/loginpage">Login</a></li>
                            </sec:authorize> 
                            <sec:authorize access ="isAuthenticated()">  
                            <li>
                                <form:form id="logoutform" action="${pageContext.request.contextPath}/logout" method="POST">
                                    <a href="javascript:{}" onclick="document.getElementById('logoutform').submit();">Logout</a>       
                                </form:form>      
                            </li>
                        </sec:authorize> 
                    </ul>
                </nav>
                <a href="${pageContext.request.contextPath}/user/cart"><img src="${pageContext.request.contextPath}/images/cart.png" width="30px" height="30px"></a>
                <img src="${pageContext.request.contextPath}/images/menu.png" class="menu-icon" onclick="menutoggle()">

                <div class="row">
                    <sec:authorize access ="isAuthenticated()"> <!--???? sec:authedication ???? ?????????? ?????????????????? ?????? sec:authorize ?????????? ???????????? ?????? ???? Home ???????? ?????? ???????????? Login ???? ???????????? ROLE -->

                        <a href="${pageContext.request.contextPath}/user/profile/<sec:authentication property="principal.username"/>"> <sec:authentication property="principal.username"/></a>
                        <sec:authorize access ="hasRole('ADMIN')">
                            <a href="${pageContext.request.contextPath}/admin"><span style='color: red'>(Admin Menu)</span></a>
                        </sec:authorize> 
                    </sec:authorize> 


                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="container">
            <div class="main-body">




                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="${pageContext.request.contextPath}/images/profile-pic.bmp" alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4>${user.username}</h4>
                                        <p class="text-secondary mb-1">Credits: ${user.credits}</p>
                                        <p class="text-muted font-size-sm">Orders: ${ordersCount}</p>
                                        <a href="${pageContext.request.contextPath}/collection" class="btn btn-primary">Purchase</a>
                                        <a href="${pageContext.request.contextPath}/chat" class="btn btn-primary">Chat</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${user.firstname} ${user.lastname}
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${user.email}
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phonenumber</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${user.phonenumber}
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div>
                            <h3>Completed Orders</h3>
                        </div>
                        <div class="row gutters-sm">

                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Code</th>

                                        <th colspan="4">Address</th>
                                        <th>Status</th>
                                        <th>Total Cost</th>
                                        <th>Date</th>

                                    </tr>
                                </thead>
                                <c:forEach items="${orders}" var ="orders">
                                    <tr>
                                        <td>${orders.ordersid}</td>

                                        <td colspan="4">${orders.address} ${orders.city}, ${orders.zipcode}</td>
                                        <td>${orders.status}</td>
                                        <td>${orders.totalcost}</td>
                                        <td>${orders.orderdate}</td>


                                    </c:forEach>


                                </tr>
                            </table>

                        </div>
                    </div>
                </div>



                <div class="container">
                    <div>
                        <h3>Purchased Products</h3>
                    </div>



                    <div class="row">
                        <c:forEach items="${userProducts}" var="product">
                            <div class="col-4">
                                <a href="${pageContext.request.contextPath}/collection/${product.productid}"> 
                                    <img id="image" src="${pageContext.request.contextPath}/images/${product.image}">
                                </a>
                                <p>${product.title}, 
                                    <br>
                                    ${product.color.colorname} ${product.category.categoryname} for ${product.gender.gendername}, from ${product.brand.brandname}</p>

                            </div>
                        </c:forEach>
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
    </body>
</html>
