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
        <title>Java</title>
    </head>
    <body>
        <h1>Spring Boot Fashion</h1>

        <sec:authorize access ="hasAnyRole('ADMIN','USER')"> <!--Το sec:authedication το έβαλα ενδιάμεσα του sec:authorize γιατί έσκαγε όλο το Home όταν δεν υπήρχε Login με κάποιο ROLE -->
            <p>
                User: <sec:authentication property="principal.username"/>
                <br>
                Role: <sec:authentication property="principal.authorities"/>
            </p>
            <hr/>
        </sec:authorize>
            
            
            
            <!--sec:authorize access=hasRole('ADMIN')-->
                <!--το link που θέλω να κρύβεται όταν γίνει login ο Admin-->
            <%--</sec:authorize>--%> 

        <div>

            <h2>Admin Section</h2>
            <a href="${pageContext.request.contextPath}/admin/product">List of Products</a>
            <br>
            <a href="${pageContext.request.contextPath}/admin">Administrator Home Page</a>
        </div>

        <div>
            <h2>User Section</h2>
            <a href="${pageContext.request.contextPath}/user/profile">User Profile</a>

        </div>

        <div>
            <h2>General Section</h2>
            <a href="${pageContext.request.contextPath}/">Home Page</a>
            <a href="${pageContext.request.contextPath}/collection">Collection</a>
            <a href="${pageContext.request.contextPath}/offers">Προσφορές</a>
            <a href="${pageContext.request.contextPath}/about">About</a>
            <a href="${pageContext.request.contextPath}/contact">Contact</a>
            <a href="${pageContext.request.contextPath}/loginpage">Login</a>
        </div>



        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">            
        </form:form>

    </body>
</html>
