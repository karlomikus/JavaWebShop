<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld.tld" %>
<tpl:head_tag title="${product.category} ${product.name}" />
<tpl:navbar_tag />
    
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <h1>${product.manufacturer} &dash; ${product.name}</h1>
            <p>
                ${product.description}
            </p>
        </div>
        <div class="col-md-3 text-center">
            <h1>$${product.price}</h1>
            <a href="${pageContext.request.contextPath}/addToCart?product=${product.id}" class="btn btn-primary btn-block">Add to cart</a>
        </div>
    </div>
</div>
    
<tpl:foot_tag />