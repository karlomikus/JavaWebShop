<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="Your shopping cart" />
<tpl:navbar_tag />
    
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Product name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cartItems}" var="cart">
                    <tr>
                        <td><a href="${pageContext.request.contextPath}/cart?remove=${cart.product.id}"><i class="fa fa-times-circle"></i></a></td>
                        <td>${cart.product.manufacturer} - ${cart.product.name}</td>
                        <td>${cart.quantity}</td>
                        <td>$${cart.product.price}</td>
                    </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">Total:</td>
                        <td>${totalQuantity}</td>
                        <td>$${totalPrice}</td>
                    </tr>
                </tfoot>
            </table>
            <div class="well">
                <a href="${pageContext.request.contextPath}/placeOrder" class="btn btn-success">Place order</a>
            </div>
        </div>
    </div>
</div>
            
<tpl:foot_tag />