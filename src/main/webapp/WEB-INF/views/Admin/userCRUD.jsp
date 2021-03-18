<%-- 
    Document   : productList
    Created on : 14 Μαρ 2021, 5:32:22 μμ
    Author     : AngPan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - UserManagement</title>
    </head>
    <body>
        <h1>This is my List of Users!</h1>
        <div>
            <h3>Users</h3>
            <p>
                ${message}
            </p>
            <a href="${pageContext.request.contextPath}/admin/user/create">Add user</a>

            <table border="1">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>username</th>
                        <th>password</th>
                        <th>email</th>
                        <th>firstname</th>
                        <th>lastname</th>
                        <th>phonenumber</th>
                        <th>credits</th>                        
                        <th colspan="2">Actions</th>
                      
                    </tr>
                </thead>

                <c:forEach items="${listOfUsers}" var = "user">
                    <tr>
                        <td>${user.userid}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.email}</td>
                        <td>${user.firstname}</td>
                        <td>${user.lastname}</td>
                        <td>${user.phonenumber}</td>
                        <td>${user.credits}</td>

                        


                        <td>      
                            <a href="${pageContext.request.contextPath}/admin/user/update/${user.userid}">Update</a>
                        </td>

                        <td>
                            <a href="${pageContext.request.contextPath}/admin/user/delete?id=${user.userid}">Delete</a>
                        </td>
                        
                        

                        

                    </tr>
                </c:forEach>

            </table>
        </div>
            
            
    </body>
</html>
