<%-- 
    Document   : home
    Created on : Mar 7, 2021, 10:51:49 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
        </script>


        <style>

            .filter li{
                margin: 10px;
            }

            .filter h4{
                font-style: oblique;
                text-decoration: underline;
            }

            .filter ul{
                display: flex;
                flex-direction: row;
                user-select: none; 

            }

            .filter ul li label{
                margin-top: 1px;
                margin-left:  10px;
                display: flex;
                flex-wrap: wrap;

            }

            .filter input[type=submit] {
                background: #6bce1b;
                color: #fff;
                border-radius: 20px;
                width: 200px;
                height: 50px;
                font-weight: 100;
                transition: background 0.5s;

            }

            .filter input[type=submit]:hover{
                background: #033b21;
                font-weight: bolder;
            }

            input:checked + label {
                color: #fff;
                background: #6bce1b;
                border-color: #fff;
                border-radius: 5px;

            }
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
                    <sec:authorize access ="isAuthenticated()"> <!--Το sec:authedication το έβαλα ενδιάμεσα του sec:authorize γιατί έσκαγε όλο το Home όταν δεν υπήρχε Login με κάποιο ROLE -->

                        <a href="${pageContext.request.contextPath}/user/profile/<sec:authentication property="principal.username"/>"> <sec:authentication property="principal.username"/></a>
                        <sec:authorize access ="hasRole('ADMIN')">
                            <a href="${pageContext.request.contextPath}/admin"><span style='color: red'>(Admin Menu)</span></a>
                        </sec:authorize> 
                    </sec:authorize> 
                </div>
            </div>
        </div>
        <!----------------------------------------------------------------COLLECTION----------------------------------------------->


        <div class="filter small-container">
            <form:form id="filters" action="${pageContext.request.contextPath}/collection/filters" method="GET" modelAttribute="filters">
                <ul >
                    <h4>Brands:</h4>
                    <li>
                        <c:forEach items="${brands}" var="brand">                              
                            <input type="checkbox" name="brand" value="${brand.brandid}" id="${brand.brandname}" class="showSubmit" hidden>
                            <label for="${brand.brandname}">${brand.brandname}</label>
                        </c:forEach>            
                    </li>
                    <h4>Categories:</h4>
                    <li>
                        <c:forEach items="${categories}" var="category">                           
                            <input  type="checkbox" name="category" value="${category.categoryid}" id="${category.categoryname}" class="showSubmit" hidden>
                            <label for="${category.categoryname}">${category.categoryname}</label> 
                        </c:forEach>
                    </li>
                    <h4>Gender:</h4>
                    <li>
                        <c:forEach items="${genders}" var="gender">                           
                            <input type="checkbox" name="gender" value="${gender.genderid}" id="${gender.gendername}" class="showSubmit" hidden>
                            <label for="${gender.gendername}">${gender.gendername}</label>
                        </c:forEach>
                    </li>
                    <h4>Sizes:</h4>
                    <li>
                        <c:forEach items="${sizes}" var="size">                           
                            <input type="checkbox" name="size"  value="${size.sizesid}" id="${size.sizename}" class="showSubmit" hidden>
                            <label for="${size.sizename}">${size.sizename}</label>
                        </c:forEach>
                    </li>
                    <h4>Colors:</h4>
                    <li>
                        <c:forEach items="${colors}" var="color">
                            <input type="checkbox" name="color"  value="${color.colorid}" id="${color.colorname}" class="showSubmit" hidden>
                            <label for="${color.colorname}">${color.colorname}</label>
                        </c:forEach>
                    </li>
                </ul>
                <input type="submit" value="Submit Filters" class="Submit" disabled="disabled"/>
            </form:form>
                <a class="btn" href="${pageContext.request.contextPath}/collection">Clear Filters</a>
        </div>
        <!--<input type="button" id="none" value="Clear All"/>-->

        <div class="small-container">
            <div class="row row-2">
                <h2>All Products</h2>
                <select>
                    <option>Default Shorting</option>
                    <option>Sort by price</option>
                    <option>Sort by popularity</option>
                    <option>Sort by rating</option>
                    <option>Sort by sale/option>
                </select>
            </div>               

            <div class="row">
                <div class="row">
                    <ul class="row">
                        <c:forEach items="${products}" var="product">
                            <li class="col-4">
                                <div id="${product.title}" class="col-4 grid-products" data-brand="${product.brand.brandname}" data-category="${product.category.categoryname}" data-gender="${product.gender.gendername}"  data-size="${product.size.sizename}" data-color="${product.color.colorname}" >
                                    <a href="${pageContext.request.contextPath}/collection/${product.productid}">
                                        <img src="${pageContext.request.contextPath}/images/${product.image}">
                                    </a>
                                    <h4><a href="${pageContext.request.contextPath}/collection/${product.productid}">${product.title}</a></h4>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <p>${product.price} €</p>       
                                </div>
                            </li>
                        </c:forEach> 
                    </ul>
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

        <!-- js for toggle menu -->
        <script src="${pageContext.request.contextPath}/js/burgermenu.js"></script>



        <script>
                    $(document).ready(function () {
                        $('.showSubmit').click(function () {
                            if ($(this).prop('checked') == true) {
                                $('input[type="submit"]').prop('disabled', false);
                            } else {
                                $('input[type="submit"]').prop('disabled', true);
                            }
                        });
                    });
                    //            $(document).ready(function () {
                    //                $(':input').change(function (evt) {
                    //                    var filter = $(':input:checked,select').map(function (index, el) {
                    //                        return "." + el.value;
                    //                    }).toArray().join("");
                    //                    $(".category").hide().filter(filter).show();
                    //                });
                    //            });

//                        $(document).ready(function () {
//
//                            var $products = $('.grid-products'),
//                                    $filters = $("#filters input[type='checkbox']"),
//                                    product_filter = new ProductFilterLevel1($products, $filters);
//
//                            product_filter.init();
//
//                        });
//                        function ProductFilterLevel1(products, filters) {
//                            var _this = this;
//
//                            this.init = function () {
//                                this.products = products;
//                                this.filters = filters;
//                                this.bindEvents();
//                            };
//                            this.bindEvents = function () {
//                                this.filters.click(this.filterGridProducts);
//                                $('#none').click(this.removeAllFilters);
//                            };
//                            this.filterGridProducts = function () {
//                                _this.products.hide();
//                                var selectedFilters = _this.filters.filter(':checked');
//                                if (selectedFilters.length) {
//                                    var selectedFiltersValues = [];
//                                    selectedFilters.each(function () {
//                                        var currentFilter = $(this);
//
//                                        selectedFiltersValues.push("[data-" + currentFilter.attr('name') + "='" + currentFilter.val() + "']");
//
//                                    });
//
//                                    _this.products.filter(selectedFiltersValues.join(',')).show();
//                                } else {
//                                    _this.products.show();
//                                }
//                            };
//                            this.removeAllFilters = function () {
//                                _this.filters.prop('checked', false);
//                                _this.products.show();
//                            }
//                        }

        </script>

    </body>
</html>
