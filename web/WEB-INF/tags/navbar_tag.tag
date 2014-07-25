<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<!-- Fixed navbar -->
    <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/home">AudioCamp</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Browse</a></li>
            <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart (0)</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>