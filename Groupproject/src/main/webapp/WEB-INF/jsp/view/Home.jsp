<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="language"/>
<html lang="${param.lang}">
<head>
    <title>COMP S380F</title>
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
        <a class="navbar-brand" > COMP S380F </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a href="<c:url value="/Home?lang=${param.lang}" />" class="nav-link active"  > <fmt:message key="language.home"/> <i class="fa-solid fa-house"></i></a>
              
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

            <form class="form-inline my-2 my-lg-0 px-4">
                <a href="<c:url value="/cslogin?lang=${param.lang}" />" class="btn btn-dark my-2 my-lg-0 px-4"><fmt:message key="language.login"/><i class="bi bi-box-arrow-in-right"></i></a>

            </form>

      </div>
    </nav>
           

           
        
<h2><fmt:message key="language.1tittle"/></h2>
  
<br />
<c:choose>
    <c:when test="${fn:length(ticketDatabase) == 0}">
        <i><fmt:message key="language.noLec"/></i>
    </c:when>
    <c:otherwise>
        <br>
        <ul><h5><fmt:message key="language.current"/></h5></ul>
        <c:forEach items="${ticketDatabase}" var="ticket">
            <ul>
            <div class="card border-info mb-3" style="width: 24rem;" >
            <div class="card-header"><fmt:message key="language.lecture"/> ${ticket.id}: 
                <c:out value="${ticket.subject}" /></div>
            <div class="card-body">
              <h6 class="card-subtitle mb-2 text-muted"><fmt:message key="language.post"/><i> </i><c:out value="${ticket.customerName}" /></h6>
              <p class="card-text"><c:out value="${ticket.body}"/></p>
            </div>
         </div>
            </ul>
            <br>
        </c:forEach>
    </c:otherwise>
</c:choose>
      
</body>