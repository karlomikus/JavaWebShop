<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="${product.category} ${product.name}" />
<tpl:navbar_tag />
    
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <h1>${product.manufacturer} &dash; ${product.name} <small>${product.category}</small></h1>
            <hr />
            <p>
                ${product.description}
            </p>
        </div>
        <div class="col-md-4 text-center">
            <img src="<c:url value="/uploads/products/${product.image}" />" alt="Product" />
            <h1>$${product.price}</h1>
            <a href="${pageContext.request.contextPath}/addToCart?product=${product.id}" class="btn btn-primary"><i class="fa fa-plus-circle fa-fw"></i> Add to cart</a>
        </div>
    </div>
</div>
    
<tpl:foot_tag />