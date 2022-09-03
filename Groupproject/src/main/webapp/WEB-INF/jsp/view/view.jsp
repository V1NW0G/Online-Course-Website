<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="language"/>
<html lang="${param.lang}">
    <head><title>COMP S380F Web Applications: Design And Development</title>
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
            </div>

             
                <c:url var="logoutUrl" value="/cslogout?lang=${param.lang}"/>
                    <form action="${logoutUrl}" method="post" class="form-inline my-2 my-lg-0 px-4">
                        <button type="submit" class="btn btn-dark my-2 my-lg-0 px-4" id"logout"><fmt:message key="language.logout"/><i class="bi bi-box-arrow-left"></i></button>
                        <!-- <input type="submit" value="Log out" id="logout" /> -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                
            </form>

      </div>
    </nav>

        <h2></h2>
 <center>
        <div id="logincard" class="card text-dark bg-light mb-3 text-center" style="max-width: 35rem;" >
                    <div class="card-header text-dark bg-light mb-3"><h2><fmt:message key="language.lecture"/>#${ticket.id}: <c:out value="${ticket.subject}" /></h2></div>
                        <div class="card-body text-dark bg-light mb-3">        
                        <h5 class="card-title"><fmt:message key="language.post"/> - <c:out value="${ticket.customerName}" /></h5>
                        <br />
                        <c:out value="${ticket.body}" /><br /><br />
                        
                        <br/>

                        </div>
                        <div class="card-body text-dark bg-light border-light mb-3">
                        <c:if test="${fn:length(ticket.attachments) > 0}">
                            <fmt:message key="language.attach"/>
                            <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
                                <c:if test="${!status.first}">, </c:if>
                                <a href="<c:url value="/ticket/${ticket.id}/attachment/${attachment.name}" />">
                                    <c:out value="${attachment.name}" /></a>
                            </c:forEach><br />
                        </c:if>
                        <c:forEach items="${ticketUsers}" var="user" varStatus="loop">
                            <c:if test="${loop.last}"><fmt:message key="language.CourseUser"/>${loop.count}</c:if>
                        </c:forEach></br></br>
                        <security:authorize access="hasRole('ADMIN')">  

                            <a href="<c:url value="/ticket/edit/${ticket.id}"/>" class="btn btn-secondary " style="width: 6rem;" ><fmt:message key="language.edit"/><i class="bi bi-pencil" ></i></a>
                            <a href="<c:url value="/ticket/delete/${ticket.id}"/>" class="btn btn-danger " style="width: 6rem;"><fmt:message key="language.delete"/><i class="bi bi-trash"></i></a>
                        </security:authorize>
                        </div>
                        

                              
        </div>
    </body>
</html>