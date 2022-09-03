<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="language"/>
<html lang="${param.lang}">
   
    <head>
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        
        <style>
        body {
        background-image: url("https://jupas.mingpao.com/wp-content/uploads/2021/09/01-vlogo.jpg");
        height: 1600px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: 30%;
        position: relative;
        } 
        


        </style>
        
    </head>
    
    <body>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        
        <nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;"> 
            <div class="container-fluid">
              <a class="navbar-brand" >COMP S380F </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a href="<c:url value="/Home?lang=${param.lang}" />" class="nav-link active"  ><fmt:message key="language.home"/><i class="fa-solid fa-house"></i></a>

                  </li>                   
              </ul>

              </div>
                  <div class="nav-item dropdown">
                        <button class="btn btn-outline-primary nav-link dropdown-toggle "  id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <fmt:message key="language.lang"/> <i class="bi bi-translate"></i>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="?lang=en"><fmt:message key="language.en"/></a></li>
                          <li><a class="dropdown-item" href="?lang=zh"><fmt:message key="language.zh"/></a></li>
                        </ul>
                      </div>

                  <form class="form-inline my-2 my-lg-0 px-4">
                      <a href="<c:url value="/cslogin?lang=${param.lang}" />" class="btn btn-dark my-2 my-lg-0 px-4"><fmt:message key="language.login"/><i class="bi bi-box-arrow-in-right"></i></a>

                  </form>

            </div>
          </nav>
        
        
        
    <center><br>
        <div class="opacity-75">
        <div id="logincard" class="card text-dark bg-light mb-3 text-center" style="max-width: 35rem;" >
            <div class="card-header text-dark bg-light mb-3"><h2><fmt:message key="language.tittlePage2"/></h2></div>
                <div class="card-body text-dark bg-light mb-3">
                        
                    <c:if test="${param.error != null}">
                 
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill"></i>
                            <strong><fmt:message key="language.failPage2"/></strong> <fmt:message key="language.checkpage2"/>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        
                    </c:if>
                    <c:if test="${param.logout != null}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <strong><fmt:message key="language.logoutPage2"/></strong> 
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    
                        <form action="cslogin" method="POST">
                          
                            <label for="username"><b><h5><fmt:message key="language.login2"/></h5></b></label><br/>
                          <input type="text" id="username" name="username" placeholder="<fmt:message key="language.username"/>" class="d-grid gap-2 col-8 mx-auto outline-secondary" style="height: 3rem;"/><br/>
                          
                          <input type="password" id="password" name="password" placeholder="<fmt:message key="language.password"/>" class="d-grid gap-2 col-8 mx-auto outline-secondary" style="height: 3rem;"/><br/><br/>
                          
                          <button type="submit" class="btn btn-primary d-grid gap-2 col-8 mx-auto " style="height: 3rem;"><h5><fmt:message key="language.login"/></h5></button><br/>
                          <!-- <input type="submit" value="Log In"/> -->
                          
                          <input type="checkbox" id="remember-me" name="remember-me" />
                          <label for="remember-me"><fmt:message key="language.rememberPage2"/></label><br/><br/>
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                          
                      </form>
                
                </div>
            <div class="card-footer text-dark bg-light mb-3">
                <br>
                <i><fmt:message key="language.newPage2"/></i>
                <a href="<c:url value="/registration?lang=${param.lang}" />"><fmt:message key="language.nowPage2"/></a>
            </div>
         </div>
        </div>
    </center>        
            
    </body>
</html>
