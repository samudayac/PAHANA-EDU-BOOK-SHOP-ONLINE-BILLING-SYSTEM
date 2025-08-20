<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">

<%@include file="all_component/navbar.jsp" %>

<div class="container p-2 flex-grow-1">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">

                    <h4 class="text-center">Registration Page</h4>

                   
                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                   
                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <form action="register" method="post">

                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name"
                                   required name="name">
                        </div>

                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email"
                                   required name="email">
                        </div>

                        <div class="form-group">
                            <label for="contactno">Contact Number</label>
                            <input type="number" class="form-control" id="contactno"
                                   required name="contactno">
                        </div>
                        
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address"
                                   required name="address">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password"
                                   required name="password">
                        </div>

                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                            <label class="form-check-label" for="exampleCheck1">
                                I agree to the Terms & Conditions
                            </label>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Submit</button><br>
                            <a href="login.jsp">Already have an account?</a>
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

