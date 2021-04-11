<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%--<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>--%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix= "form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>User Add/Edit</title>
    </head>
    <body>
        <h1>Add/Edit a User</h1>        

    


        <c:if test="${user==null}">
            <form:form action="${pageContext.request.contextPath}/admin/user/create" method="POST" modelAttribute="user">          

                <form:hidden id="userid" path="userid"/>

                <br/>
                <label for="username">username :</label>
                <form:input id="username" path="username"  />
                <form:errors path="username"/>
                <br/>


                <label for="password">password :</label>
                <form:input id="password" path="password" />
                <form:errors path="password"/>
                <br/>


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


                <br/>
                <input type="submit" value="Submit"/>




            </form:form>
        </c:if>
        <c:if test="${user!=null}">    
            <form:form action="${pageContext.request.contextPath}/admin/user/update" method="POST" modelAttribute="user">          

                <form:hidden id="userid" path="userid"/>

                <br/>
                <label for="username">username :</label>
                <form:input id="username" path="username"  />
                <form:errors path="username"/>
                <br/>


                <label for="password">password :</label>
                <form:input type="hidden" id="password" path="password" />
                <form:errors path="password"/>
                <br/>


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


                <br/>
                <input type="submit" value="Submit"/>
            </form:form>

        </c:if>

    </body>

</html>
