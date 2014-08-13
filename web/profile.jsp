<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="stuff" />
<tpl:navbar_tag />
<div class="container">

    <div class="row">
        <div class="col-md-8">
            <h1>Edit shipping information:</h1>
            <form role="form" action="${pageContext.request.contextPath}/profile" method="post">
                <div class="form-group">
                  <label for="country">Country</label>
                  <input name="country" type="text" class="form-control" id="country" placeholder="Enter country">
                </div>
                <div class="form-group">
                  <label for="city">City</label>
                  <input name="city" type="text" class="form-control" id="city" placeholder="Enter city">
                </div>
                <div class="form-group">
                  <label for="street">Street</label>
                  <input name="street" type="text" class="form-control" id="street" placeholder="Enter street">
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
        <div class="col-md-4">
            <h1>Current information:</h1>
            <div class="well">
                <dl class="dl-horizontal">
                    <dt>Full name</dt>
                    <dd>Karlo mikus</dd>
                    <dt>Country</dt>
                    <dd>Croatia</dd>
                    <dt>City</dt>
                    <dd>Zagreb</dd>
                    <dt>Post Number</dt>
                    <dd>10 000</dd>
                    <dt>Street</dt>
                    <dd>Primorska 19</dd>
                    <dt>Username</dt>
                    <dd>admin</dd>
                    <dt>Email</dt>
                    <dd>admin@admin.com</dd>
                    <dt>Group</dt>
                    <dd>Admins</dd>
                </dl>
            </div>
        </div>
    </div>
    
</div>
<tpl:foot_tag />