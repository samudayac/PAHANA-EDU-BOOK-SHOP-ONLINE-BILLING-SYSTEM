<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">

    <%@include file="all_component/navbar.jsp" %>

    <div class="container p-2 flex-grow-1">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">

                        <h4 class="text-center">Login Page</h4>
                        
                    <c:if test="${not empty failedMsg}">
                        <h5 class="text-center text-danger">${failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" required="required" name="email">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Login</button><br>
                                <a href="register.jsp">Create Account</a>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="all_component/footer.jsp" %>
</body>

</html>
