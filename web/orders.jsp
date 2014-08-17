<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<tpl:head_tag title="Your orders" />
<tpl:navbar_tag />
    
<div class="container">
    <div class="row">
        <div class="col-md-12">
            
            <div class="alert alert-info" role="alert">Click on order to see more information</div>
           
            <div class="panel-group" id="accordion">
                <c:forEach items="${orders}" var="order">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse${order.id}">
                        Order HR-${order.id}
                      </a>
                      <span class="pull-right">${order.date} [${order.status}]</span>
                    </h4>
                  </div>
                  <div id="collapse${order.id}" class="panel-collapse collapse">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Product name</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${order.products}" var="product">
                            <tr>
                                <td><a href="${pageContext.request.contextPath}/product?id=${product.id}">${product.manufacturer} - ${product.name}</a></td>
                                <td>$${product.price}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                  </div>
                </div>
                </c:forEach>
            </div>
            
        </div>
    </div>
</div>
    
<tpl:foot_tag />