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
        <title>Products</title>
    </head>
    <body>
        <h1>This is my List of products!</h1>
        <div>
            <h3>Products</h3>
            <p>
                ${message}
            </p>
            <a href="${pageContext.request.contextPath}/admin/product/create">Add product</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Brand</th>
                        <th>Category</th>
                        <th>Gender</th>
                        <th>Offer</th>
                        <th>Size</th>
                        <th>Color</th>
                        <th>Stock</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <c:forEach items="${listOfProducts}" var = "product">
                    <tr>
                        <td>${product.productid}</td>
                        <td>${product.title}</td>
                        <td>${product.image}</td>
                        <td>${product.price}</td>
                        <td>${product.brand.brandname}</td>
                        <td>${product.category.categoryname}</td>
                        <td>${product.gender.gendername}</td>
                        <td>${product.offer}</td>
                        <td>${product.size.sizename}</td>
                        <td>${product.color.colorname}</td>
                        <td>${product.stock}</td>

                        <td>      
                            <a href="${pageContext.request.contextPath}/admin/product/update/${product.productid}">Update</a>
                        </td>
                        <td>
                            <c:if test="${product.status == 0}">
                            <a href="${pageContext.request.contextPath}/admin/product/activation?id=${product.productid}">Activate</a>
                            </c:if>
                            <c:if test="${product.status == 1}">
                            <a href="${pageContext.request.contextPath}/admin/product/activation?id=${product.productid}">Deactivate</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
