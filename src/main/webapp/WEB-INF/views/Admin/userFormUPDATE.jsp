<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix= "form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>User Update</title>
    </head>
    <body>
        <h1>Add/Edit a User</h1>        

        <form:form action="${pageContext.request.contextPath}/admin/user/update" method="POST" modelAttribute="user">          

            <form:hidden id="userid" path="userid"/>

            <br/>
            <label for="username">username :</label>
            <form:input id="username" path="username"/>
            <form:errors path="username"/>
            <br/>

            <form:input type="hidden" id="password" path="password" />

            <label for="email">email :</label>
            <form:input id="email" path="email" />
            <form:errors path="email"/>
            <br/>

            <label for="firstname">firstname :</label>
            <form:input id="firstname" path="firstname" />
            <form:errors path="firstname"/>
            <br/>

            <label for="lastname">lastname :</label>
            <form:input id="lastname" path="lastname" />
            <form:errors path="lastname"/>
            <br/>

            <label for="phonenumber">phonenumber :</label>
            <form:input id="phonenumber" path="phonenumber" />
            <form:errors path="phonenumber"/>
            <br/>

            <label for="credits">credits :</label>
            <form:input id="credits" path="credits" />
            <form:errors path="credits"/>
            <br/>            

            <%--path = το όνομα το που "καταγράφετε" το στοιχείο. Εδώ είναι to userList του User --%>
            <%--items = το ονομα που έχουμε δώσει στο πεδίο του ModelAttributes(βλ. UserControllerAdmin class) --%>
            <%--itemLabel = από πιο πεδίο θα πέρνουν τα ονόματα τους τα Labels στην HTML --%>
            <%--itemValue = από πιο πεδίο θα πέρνει τιμή --%>
            <%--itemLabel =  τι tag θα έχει στην HTML--%>

            <p><strong>Choose Role:</strong></p>
            <form:radiobuttons path="roleList" items="${roles}" itemLabel="type" itemValue="roleid" element="li"/>
            <form:errors path="roleList"/>



            <br/>
            <input type="submit" value="Submit"/>
        </form:form>


    </body>
</html>
