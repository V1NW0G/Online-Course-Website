<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="language"/>
<html lang="${param.lang}">
    <head><title>User Management</title>
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
              <a href="<c:url value="/user/create?lang=${param.lang}" />"  class="nav-link active"><fmt:message key="language.CreateUser"/><i class="bi bi-person-plus-fill" style="font-size: 1.5rem;"></i></a>
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
                    
        <center><h2><fmt:message key="language.userlist"/></h2></center>

        <c:choose>
            <c:when test="${fn:length(ticketUsers) == 0}">
                <i><fmt:message key="language.noLec"/></i>
            </c:when>
            <c:otherwise>
            <center>
                <table class="table table-striped table-hover table table-bordered text-center" style="width: 100rem;">
                    <tr>
                        <th><fmt:message key="language.username"/></th>
                        <th><fmt:message key="language.password"/></th>
                        <th><fmt:message key="language.fullname"/></th>
                        <th><fmt:message key="language.phone"/></th>
                        <th><fmt:message key="language.address"/></th>
                        <th><fmt:message key="language.role"/></th>
                        <th><fmt:message key="language.action"/></th>
                    </tr>
                    <c:forEach items="${ticketUsers}" var="user">
                        <tr>
                            <td>${user.username}</td><td>${user.password}</td>
                            <td>${user.fullname}</td><td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>
                                <c:forEach items="${user.roles}" var="role" varStatus="status">
                                    <c:if test="${!status.first}">, </c:if>
                                    ${role.role}
                                </c:forEach>
                            </td>
                            <td>
                                
                                <a href="<c:url value="/user/edit/${user.username}"/>" class="btn btn-secondary " style="width: 6rem;" ><fmt:message key="language.edit"/><i class="bi bi-pencil"></i></a>
                                <a href="<c:url value="/user/delete/${user.username}" />" class="btn btn-danger " style="width:6rem;" ><fmt:message key="language.delete"/><i class="bi bi-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                </center>
            </c:otherwise>
        </c:choose>
    </body>
