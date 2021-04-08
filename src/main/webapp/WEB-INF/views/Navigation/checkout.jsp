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



        <!-------------------------------------------------------------------------------- -->
        <!-- Stripe -->
        <!-------------------------------------------------------------------------------- -->
        <!--Bootstrap 4 CSS-->
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--Bootstrap 4 JavaScript-->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!--Stripe JavaScript Library-->
        <script src="https://js.stripe.com/v3/"></script>
        <!-------------------------------------------------------------------------------- -->



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
                    <sec:authorize access ="isAuthenticated()"> <!--Το sec:authedication το έβαλα ενδιάμεσα του sec:authorize γιατί έσκαγε όλο το Home όταν δεν υπήρχε Login με κάποιο ROLE -->

                        <a href="${pageContext.request.contextPath}/user/profile/<sec:authentication property="principal.username"/>"> <sec:authentication property="principal.username"/></a>
                        <sec:authorize access ="hasRole('ADMIN')">
                            <a href="${pageContext.request.contextPath}/admin"><span style='color: red'>(Admin Menu)</span></a>
                        </sec:authorize> 
                    </sec:authorize> 
                </div>
            </div>
        </div>


        <!-----MAIN----->
        <div class="small-container">
            <div class="row row-2">
                <h2>checkout</h2>
            </div>

            <div class="row">

                <!-------------------------------------------------------------------------------- -->
                <!-- Stripe -->
                <!-------------------------------------------------------------------------------- -->

                <div class="card mb-4">
                    <div class="card-body">
                        <h5>Total Amount in €</h5>
                        <p id="product-price">${order.totalcost}</p>
                    </div>
                </div>

                <form action="#" id="payment-form" method="post">
                    <input id="api-key" type="hidden" value="${stripePublicKey}">
                    <div class="form-group">
                        <label class="font-weight-medium" for="card-element">
                            Enter credit or debit card below
                        </label>
                        <div class="w-100" id="card-element">
                            <!-- A Stripe Element will be inserted here. -->
                        </div>
                    </div>
                    <div class="form-group">
                        <input class="form-control" id="email" name="email"
                               placeholder="Email Address" type="email" required>
                    </div>
                    <!-- Used to display Element errors. -->
                    <div class="text-danger w-100" id="card-errors" role="alert"></div>
                    <div class="form-group pt-2">
                        <button class="btn btn-primary btn-block" id="submitButton" type="submit" >
                            Pay With Your Card
                        </button>
                        <div class="small text-muted mt-2">
                            Pay securely with Stripe. By clicking the button above, you agree
                            to our <a target="_blank" href="#">Terms of Service</a>,
                            <a target="_blank" href="#">Privacy</a> and
                            <a target="_blank" href="#">Refund</a> policies.

                        </div>
                    </div>


                </form>
                <!-------------------------------------------------------------------------------- -->





            </div>
            <!-- <div class="page-btn">
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>&#8594;</span>
            </div> -->
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
        <!--<script src="${pageContext.request.contextPath}/js/payment.js"></script>-->




        <!--custom javascript for handling subscription-->
        <script>
                    $(document).ready(function () {
                        var API_KEY = 'pk_test_51IcYb5LHOzT4nl4bd3BYOpBNl3SAPSsGwEX0K1AFxlbLce5G7hNkSnaExlsCYu1ZMzutv8nwvY27xMoEaZ99GaCL00FYjiILpS';
                        // Create a Stripe client.
                        var stripe = Stripe(API_KEY);

                        // Create an instance of Elements.
                        var elements = stripe.elements();

                        // Create an instance of the card Element.
                        var card = elements.create('card');

                        // Add an instance of the card Element into the `card-element` <div>.
                        card.mount('#card-element');

                        // Handle real-time validation errors from the card Element.
                        card.addEventListener('change', function (event) {
                            var displayError = document.getElementById('card-errors');
                            if (event.error) {
                                displayError.textContent = event.error.message;
                            } else {
                                displayError.textContent = '';
                            }
                        });

                        // Handle form submission.
                        var form = document.getElementById('payment-form');
                        form.addEventListener('submit', function (event) {
                            event.preventDefault();
                            // handle payment
                            handlePayments();
                            
                            setTimeout(function () {
                              window.location.href = "${pageContext.request.contextPath}";
                            }, 4000);


                        });

                        //handle card submission
                        function handlePayments() {
                        document.getElementById("submitButton").disabled = true;
                            stripe.createToken(card).then(function (result) {
                                if (result.error) {
                                    // Inform the user if there was an error.
                                    var errorElement = document.getElementById('card-errors');
                                    errorElement.textContent = result.error.message;
                                } else {
                                    // Send the token to your server.
                                    var token = result.token.id;
                                    var email = $('#email').val();
                                    var pPrice = $('#product-price').html();
                                    //var pPrice = $('#product-price').html(); 
                                    //var pPrice =parseDouble($('#product-price').html());

                                    $.get(
                                            "payment/create-charge/${order.ordersid}",
                                            {email: email, token: token, amount: pPrice},
                                            function (data) {
                                                alert(data.details);
                                            }, 'json');
                                }
                            });
                        }
                    });

        </script>
    </body>
</html>
