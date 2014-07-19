<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Products</h1>
        
        <ul>
            <c:forEach items="${products}" var="product">
                <li><a href="/product?id=${product.id}">${product.name}</a> in ${product.category}</li>
            </c:forEach>
        </ul>
    </body>
</html>
