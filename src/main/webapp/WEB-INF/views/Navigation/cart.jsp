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
            .qty {
                text-align:center;
            }

            #pSubtotal {
                -moz-appearance: textfield;
                width: 75px;
                border:0;
                outline:0;
                text-align: right;
                padding: 5px;
                font-weight: normal;
                font-family: "Poppins", sans-serif;
                font-size: 16px;
            }

            #pSubtotal::-webkit-outer-spin-button,
            #pSubtotal::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            .qty{
                width: 50px;
            }

            .nextstep{
                float: right;
            }
            .nextstep:hover::after{
                 content: ' >>'
            }

        </style>

        <script>

        </script> 


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
        <!----------------------- single product details----------------------->        

        <div class="small-container cart-page">

            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>

                <c:forEach items="${cartProducts}" var = "product">
                    <tr>
                        <td>
                            <div class="cart-info">
                                <img src="${pageContext.request.contextPath}/images/${product.image}">
                                <div>
                                    <p>${product.title}</p>
                                    <small>${product.price} €</small>
                                    <br>
                                    <a href="${pageContext.request.contextPath}/user/cart/delete/${pendingorder.ordersid}?pid=${product.productid}">Remove</a>
                                </div>
                            </div>
                        </td>
                        <td>    
                            <!--Το παρακάτω jstl μέσα στην input type number, φέρνει το quantity σε κάθε product της pending παραγγελίας του user-->
                            <%--<form:form action="${pageContext.request.contextPath}/user/cart/quantity/${pendingorder.ordersid}?pid=${product.productid}" method="GET">--%>

                            <input type="number" 

                                   <c:forEach items="${productorders}" var="productorder" >
                                       <c:if test="${productorder.getOrders()==pendingorder}">  
                                           <c:if test="${productorder.getProduct()==product}">
                                               value="${productorder.getQuantity()}"
                                           </c:if>
                                       </c:if>
                                   </c:forEach>  
                                   min='1' max="${product.stock}" id="${product.productid}" oninput="linkchange(${product.productid}, ${pendingorder.ordersid})" class="qty" />
                            <br>
                            <a href="" id="qtylink${product.productid}"></a>   
                        </td>
                        <td><input type="number" 
                                   <c:forEach items="${productorders}" var="productorder" >
                                       <c:if test="${productorder.getOrders()==pendingorder}">  
                                           <c:if test="${productorder.getProduct()==product}">       
                                               value="${productorder.price}" 
                                           </c:if>
                                       </c:if>
                                   </c:forEach>  
                                   id="pSubtotal" readonly> ${productorder.price}€</td>
                        <!--------------------------------------------------------------------->
                    </tr>
                </c:forEach>

            </table>
            <!--<input type="button" onclick="test()" value="1000000"/>-->
            <div class="total-price">

                <table>
                    <tr>
                        <td>SubTotal</td>
                        <td>
                            <!--------------------------------------Αυτό δε γράφει στη βάση------------------------------------------------->
                            <c:set var ="subtotal" value="${0}"/>
                            <c:forEach items="${cartProducts}" var = "product">
                                <c:forEach items="${productorders}" var="productorder" >
                                    <c:if test="${productorder.getOrders()==pendingorder}">  
                                        <c:if test="${productorder.getProduct()==product}">
                                            <%--<c:set var ="subtotal"  value="${Math.round((subtotal+productorder.price)*100.0)/100.0}"/>--%>  
                                            <c:set var ="subtotal"  value="${subtotal+productorder.price}"/>  
                                        </c:if>
                                    </c:if>
                                </c:forEach>  
                            </c:forEach>  
                            <c:out  value= "${Math.round(subtotal*100.0)/100.0}"/>
                            <!------------------------------------------------------------------------------------------------------------->                  
                            €</td>
                    </tr>
                    <tr>
                        <td>Tax (${tax.getVat()*100}%) </td>
                        <td>${Math.round((subtotal*tax.getVat())*100.0)/100.0} €</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td>${pendingorder.getTotalcost()} €</td>
                    </tr>
                </table>



            </div>
            <!-- εγώ το έβαλα αυτό -->
            <a href="${pageContext.request.contextPath}/user/cart/address/${pendingorder.ordersid}" class="btn nextstep">Next Step</a>

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
                    //script για να αλλάζει το Link του add to cart
                    function linkchange(productId, orderId) {
                        var num = $("#" + productId).val();
                        var link = "<a href='${pageContext.request.contextPath}/user/cart/update/" + productId + "?qty=" + num + "&oid=" + orderId + "'>Update</a>";
                        document.getElementById("qtylink" + productId).innerHTML = link;
                    }
                    ;

        </script>

    </body>
</html>
