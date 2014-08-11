<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<!-- Fixed navbar -->
    <div class="navbar navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">AudioCamp</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/products">Browse</a></li>
            <c:if test="${not empty user}">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">${user.username}  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Orders</a></li>
                    <li><a href="#">Wishlist</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Administration</a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </ul>
            </li>
            </c:if>
            <c:if test="${empty user}">
                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/about">About</a></li>
          </ul>
          <c:if test="${not empty user}">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart (${cartCount})</a></li>
          </ul>
          </c:if>
        </div>
      </div>
    </div>