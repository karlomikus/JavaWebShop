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
                  <label for="fname">First name</label>
                  <input name="fname" type="text" class="form-control" id="fname" placeholder="Enter first name" value="${profile.firstName}">
                </div>
                <div class="form-group">
                  <label for="lname">Last name</label>
                  <input name="lname" type="text" class="form-control" id="lname" placeholder="Enter last name" value="${profile.lastName}">
                </div>
                <div class="form-group">
                  <label for="country">Country</label>
                  <select name="country" class="form-control" id="country">
                    <c:forEach items="${countries}" var="country">
                        <option value="${country.id}" ${country.name == profile.country ? 'selected' : ''}>${country.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group">
                  <label for="city">City</label>
                  <input name="city" type="text" class="form-control" id="city" placeholder="Enter city" value="${profile.city}">
                </div>
                <div class="form-group">
                  <label for="post">Post number</label>
                  <input name="post" type="text" class="form-control" id="post" placeholder="Enter post number" value="${profile.postNumber}">
                </div>
                <div class="form-group">
                  <label for="street">Street</label>
                  <input name="street" type="text" class="form-control" id="street" placeholder="Enter street" value="${profile.street}">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
        <div class="col-md-4">
            <h1>Current information:</h1>
            <div class="well">
                <dl class="dl-horizontal">
                    <dt>Full name</dt>
                    <dd>${profile.firstName} ${profile.lastName}</dd>
                    <dt>Country</dt>
                    <dd>${profile.country}</dd>
                    <dt>City</dt>
                    <dd>${profile.city}</dd>
                    <dt>Post Number</dt>
                    <dd>${profile.postNumber}</dd>
                    <dt>Street</dt>
                    <dd>${profile.street}</dd>
                    <dt>Username</dt>
                    <dd>${profile.username}</dd>
                    <dt>Email</dt>
                    <dd>${profile.email}</dd>
                </dl>
            </div>
        </div>
    </div>
    
</div>
<tpl:foot_tag />