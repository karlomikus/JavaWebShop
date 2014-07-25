<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tpl:head_tag title="stuff" />
<tpl:navbar_tag />
<div class="container">

    <form role="form" action="${pageContext.request.contextPath}/login">
      <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" class="form-control" id="email" placeholder="Enter email">
      </div>
      <div class="form-group">
        <label for="pass">Password</label>
        <input type="password" class="form-control" id="pass" placeholder="Password">
      </div>
      <button type="submit" class="btn btn-primary">Login</button>
    </form>
    
</div>
<tpl:foot_tag />