<%-- 
    Document   : login-form
    Created on : Mar 13, 2021, 1:46:06 PM
    Author     : eon_A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Form</title>

        <style>
            .form-control{
                color: red;
            }
            
            
            
        </style>
<!--        <script>
                function FormValidation(){
    //First Name Validation 
    var fn=document.getElementById('firstname').value;
    var val=document.getElementsByClassName('firstname').value;
    if(fn === ""){
       if(val!==null){ 
        document.getElementById('error-message').innerHTML="test";
        document.getElementById('firstname').style.borderColor = "red";
        return false;}
    }else{
        document.getElementById('firstname').style.borderColor = "green";
    }
    if (/^[0-9]+$/.test(document.getElementById("firstname").value)) {
        alert("First Name Contains Numbers!");
        document.getElementById('firstname').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('firstname').style.borderColor = "green";
    }
    if(fn.length <=2){
        alert('Your Name is To Short');
        document.getElementById('firstname').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('firstname').style.borderColor = "green";
    }
}   
            </script>-->
    </head>
    <body>
        <div>
            <a href="${pageContext.request.contextPath}/">Home Page</a>
        </div>
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
   
        <form:form action="${pageContext.request.contextPath}/register" method="POST" modelAttribute="reguser"> 
            <p id="error-message"></p>
                <%-- Αφού βάλαμε modelAttribute πρέπει να το στείλουμε και από τη get method (δες registration controller) --%>
            <p>
                First Name: <form:input class= "firstname" path="firstname" id="firstname" placeholder="Enter your First Name" />
                 <form:errors class="form-control firstname" path="firstname"  />

            </p>
            <p>
                Last Name: <form:input path="lastname" id="lastname" placeholder="Enter your Last Name"/>
                 <form:errors class="form-control" path="lastname"  />

            </p>

            <p>
                E-Mail: <form:input type="email" path="email" id="email" placeholder="Enter your E-mail"/>
                 <form:errors class="form-control" path="email"  />
            </p>
            <p>
                Phone Number: <form:input path="phonenumber" id="phonenumber" maxlength="20" placeholder="Enter your Phone Number" />
                 <form:errors class="form-control" path="phonenumber"  />
            </p>

            <p>
                Username: <form:input path="username" id="username" placeholder="Enter your Username"/>
                <form:errors class="form-control" path="username"  />
            </p>

            <p>
                Password: <form:password  path="password" placeholder="Enter your Password"/>
                 <form:errors class="form-control" path="password"  />
            </p>

            <input id="submit" type="submit" value="Register" onclick="FormValidation()"/>

        </form:form>

       
            
    </body>
</html>
