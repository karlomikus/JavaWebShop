<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="Homepage" />
<tpl:navbar_tag />
<div class="container">

    <div class="jumbotron">
        <h1>Welcome to AudioCamp!</h1>
        <p>Your number 1 choice for audio equipment and accessories.</p>
        <p><a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-lg" role="button">Start browsing</a></p>
    </div>
    
    <div class="row">
        <div class="col-md-6">
            
            <div class="panel panel-primary">
                <div class="panel-heading">New items:</div>
                <ul class="list-group">
                    <c:forEach items="${newProducts}" var="product">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/product?id=${product.id}">${product.manufacturer} - ${product.name}</a><span class="pull-right">$${product.price}</span></li>
                    </c:forEach>
                </ul>
            </div>
            
        </div>
        <div class="col-md-6">
            
            <div class="panel panel-primary">
                <div class="panel-heading">Top sellers:</div>
                <ul class="list-group">
                    <c:forEach items="${topProducts}" var="product">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/product?id=${product.id}">${product.manufacturer} - ${product.name}</a><span class="pull-right">$${product.price}</span></li>
                    </c:forEach>
                </ul>
            </div>
            
        </div>
    </div>
    
</div>
<tpl:foot_tag />