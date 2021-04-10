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
                <h2>About Us</h2>

                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam euismod ut lacus ac hendrerit. Nullam porttitor risus velit. Phasellus interdum interdum nibh, in aliquet magna efficitur eu. Morbi nec semper velit. Integer tristique quis ligula cursus faucibus. Pellentesque pulvinar felis eu ullamcorper consequat. Sed et tristique risus. Vivamus pretium luctus nisl a congue. Vivamus tempor consequat lacus, ac ornare ante tempus a. In ac pharetra sem, vel dignissim massa. Cras leo nunc, feugiat a orci a, porta ultricies nisi. Vestibulum et odio turpis. Integer laoreet mauris lectus, et tristique ipsum faucibus eget. Donec quis mauris maximus, aliquam nisi sed, pharetra nunc. Integer posuere egestas dui, non tincidunt orci vulputate non. Proin tincidunt est in venenatis convallis. 

                </p>
                
                <p>Mauris ultrices odio ac ligula tincidunt euismod. Vestibulum finibus, dui vel tincidunt vehicula, arcu mauris mattis nunc, pretium finibus sem nunc eu felis. Praesent id convallis est. Cras quis hendrerit elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam suscipit nisi in magna tincidunt tristique. Vestibulum tellus tellus, ultricies vel tristique in, accumsan at sem. </p>
                <p>In hac habitasse platea dictumst. Morbi condimentum orci eget nibh accumsan aliquet. Praesent suscipit, sapien sed volutpat scelerisque, leo massa efficitur turpis, at condimentum lacus elit in nulla. Donec interdum posuere fermentum. Nulla ac sem fringilla, rhoncus nunc tincidunt, gravida dolor. Nam pretium aliquet consectetur. Etiam eget urna at magna tincidunt varius vel at leo. Aenean faucibus ex diam, et ullamcorper nisl semper gravida. Sed non egestas mi, ut laoreet nisi. Suspendisse viverra molestie dolor vitae blandit. </p>
                <p>Etiam eget sem eget arcu viverra faucibus eu ut ligula. Vestibulum mollis luctus imperdiet. Curabitur vel ornare purus. Nulla condimentum malesuada diam dapibus ullamcorper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultricies odio tortor, quis vulputate leo tempus a. Donec a justo eu ligula imperdiet mollis et quis magna. Mauris ullamcorper ipsum quis condimentum blandit. Aliquam neque lorem, facilisis sit amet tortor sed, tincidunt blandit lectus. Sed ornare lectus diam, vel varius diam fermentum at. Proin volutpat enim at sapien elementum feugiat. Nulla commodo porttitor mattis. Mauris tempor commodo risus, sit amet eleifend elit interdum non. Duis vehicula enim lectus, eget aliquam metus consectetur vitae. Quisque imperdiet mauris vitae risus sodales ultricies. </p>
                <p>In eu tellus ut metus tempor venenatis non id lorem. Ut et neque vitae erat efficitur consectetur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur quis congue mauris. Duis at pretium arcu. Vivamus suscipit lorem dui, eu efficitur velit luctus id. Nam luctus lorem lectus, in euismod erat consectetur eu. Cras ultricies metus nibh. </p>


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
    </body>
</html>
