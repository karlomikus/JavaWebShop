<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="stuff" />
<tpl:navbar_tag />
<div class="container">

    <div class="row">
        <div class="col-md-6">
            <form role="form" action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                  <label for="email">Email address</label>
                  <input name="email" type="email" class="form-control" id="email" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="pass">Password</label>
                  <input name="pwd" type="password" class="form-control" id="pass" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
        <div class="col-md-6">
            <div class="well">
                <h3>Don't have an account?</h3>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Register</a>
            </div>
        </div>
    </div>
    
</div>
<tpl:foot_tag />