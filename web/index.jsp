<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="stuff" />
        <h1>Products</h1>
        
        <ul>
            <c:forEach items="${products}" var="product">
                <li><a href="${pageContext.request.contextPath}/product?id=${product.id}">${product.name}</a> in ${product.category}</li>
            </c:forEach>
        </ul>
    </body>
</html>
