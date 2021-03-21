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

        <form:form action="${pageContext.request.contextPath}/admin/product/update" method="POST" modelAttribute="product">          

            <form:hidden id="productid" path="productid"/>

            <br/>
            <label for="title">Title :</label>
            <form:input id="title" path="title"/>
            <form:errors path="title"/>
            <br/>

            <label for="image">Image :</label>
            <form:input id="image" path="image" />
            <form:errors path="image"/>
            <br/>

            <label for="price">Price :</label>
            <form:input id="price" path="price" />
            <form:errors path="price"/>
            <br/>

            <label for="offer">Offer :</label>
            <form:input id="offer" path="offer" />
            <form:errors path="offer"/>
            <br/>
            
            <label for="stock">Stock :</label>
            <form:input id="stock" path="stock" />
            <form:errors path="stock"/>
            <br/>
         

            <%--path = το όνομα το που "καταγράφετε" το στοιχείο. Εδώ είναι to userList του User --%>
            <%--items = το ονομα που έχουμε δώσει στο πεδίο του ModelAttributes(βλ. UserControllerAdmin class) --%>
            <%--itemLabel = από πιο πεδίο θα πέρνουν τα ονόματα τους τα Labels στην HTML --%>
            <%--itemValue = από πιο πεδίο θα πέρνει τιμή --%>
            <%--itemLabel =  τι tag θα έχει στην HTML--%>

            
            <form:hidden path="brand" items="${brands}" itemLabel="brandname" itemValue="brandid" element="li" required="required"/>
           
            <form:hidden path="category" items="${categories}" itemLabel="categoryname" itemValue="categoryid" element="li" required="required"/>

            <form:hidden path="gender" items="${genders}" itemLabel="gendername" itemValue="genderid" element="li" required="required"/>

            <form:hidden path="size" items="${sizes}" itemLabel="sizename" itemValue="sizesid" element="li" required="required"/>
           
            <form:hidden path="color" items="${colors}" itemLabel="colorname" itemValue="colorid" element="li" required="required"/>
            



            <br/>
            <input type="submit" value="Submit"/>
        </form:form>


    </body>
</html>
