<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="language"/>
<html lang="${param.lang}">
    <head><title>Lecture page</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    <body>
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <!-- Icon -->
        <script src="https://kit.fontawesome.com/db00d4fe80.js" crossorigin="anonymous"></script>
        
        
        <nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;"> 
      <div class="container-fluid">
        <a class="navbar-brand"> COMP S380F </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">

            <li class="nav-item">
                <a href="<c:url value="/ticket?lang=${param.lang}" />" class="nav-link active"><fmt:message key="language.returnlist"/><i class="bi bi-skip-backward-fill" style="font-size: 1.5rem;"></i></a>
            </li>
            <li class="nav-item">
              <a href="<c:url value="/user?lang=${param.lang}" />"  class="nav-link active"><fmt:message key="language.managePage3"/><i class="bi bi-person-lines-fill" style="font-size: 1.5rem;"></i></a>
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
            </div><!-- comment -->

             
                <c:url var="logoutUrl" value="/cslogout?lang=${param.lang}"/>
                    <form action="${logoutUrl}" method="post" class="form-inline my-2 my-lg-0 px-4">
                        <button type="submit" class="btn btn-dark my-2 my-lg-0 px-4" id"logout"><fmt:message key="language.logout"/><i class="bi bi-box-arrow-left"></i></button>
                        <!-- <input type="submit" value="Log out" id="logout" /> -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                
            </form>

      </div>
    </nav>
                    
    <center><h2></h2></center>

<center>
    <div id="logincard" class="card text-dark bg-light mb-3 text-center" style="max-width: 35rem;" >
            <div class="card-header text-dark bg-light mb-3"><h2><fmt:message key="language.createPage3"/></h2></div>
                <div class="card-body text-dark bg-light mb-3">
                <form:form method="POST" enctype="multipart/form-data" modelAttribute="ticketForm">
                    <form:label path="subject"><h5><fmt:message key="language.subject"/></h5></form:label><br />
                    <form:input type="text" path="subject" placeholder="Subject" class="d-grid gap-2 col-8 mx-auto outline-secondary" style="height: 3rem;"/><br /><br />
                    <form:label path="body"><h5><fmt:message key="language.body"/></h5></form:label><br />
                    <form:textarea path="body" rows="5" cols="30" placeholder="Lecture Information" class="d-grid gap-2 col-8 mx-auto outline-secondary"  /><br /><br />
                    <b><fmt:message key="language.attach"/></b><br />
                    <center><div class="mb-3"> 
                        <h5><fmt:message key="language.plzupload"/><i class="bi bi-arrow-down-square-fill" style="font-size: 1.5rem; color: cornflowerblue;"></i></h5>
                        <input class="form-control"  style="width: 24rem;height: 8rem;" type="file" id="formFileMultiple" name="attachments" multiple="multiple">
                        </div></center>
                    </br>

                    <!--<input type="file" name="attachments" multiple="multiple" /><br /><br />-->
                    
                    <button type="submit" class="btn btn-primary d-grid gap-2 col-8 mx-auto " style="height: 3rem;"><h5><fmt:message key="language.createPage3"/></h5></button><br/>
                </form:form>
                </div>
    </div>
</center>
</body>
</html>
