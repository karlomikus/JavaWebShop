<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld.tld" %>
<tpl:head_tag title="${product.category} ${product.name}" />
<tpl:navbar_tag />
    
<div class="container">
    <h1>${product.name}</h1>
    <p>
        ${product.description}
    </p>
    <a href="#">Add to cart</a>
</div>
    
<tpl:foot_tag />