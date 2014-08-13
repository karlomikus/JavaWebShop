<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="stuff" />
<tpl:navbar_tag />
<div class="container">
    
    <div class="row">
        <div class="col-md-3">
            
            <h2>Categories:</h2>
            
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/products" class="list-group-item ${empty categoryID ? 'active' : ''}">All</a>
                <c:forEach items="${categories}" var="category">
                <a href="${pageContext.request.contextPath}/products?category=${category.id}" class="list-group-item ${categoryID == category.id ? 'active' : ''}">${category.name}</a>
                </c:forEach>
            </div>
            
        </div>
        <div class="col-md-9">
            
            <h2>Products:</h2>
            
            <div class="products">
                <c:forEach items="${products}" var="product">
                <div class="product">
                    <div class="product-image">
                        <a href="${pageContext.request.contextPath}/product?id=${product.id}">
                            <img src="<c:url value="/uploads/products/${product.image}" />" alt="Product" />
                        </a>
                    </div>
                    <div class="product-info">
                        <h4>${product.manufacturer} - ${product.name}</h4>
                        <span class="text-info">$${product.price}</span>
                    </div>
                </div>
                </c:forEach>
            </div>

        </div>
    </div>
    
</div>
<tpl:foot_tag />