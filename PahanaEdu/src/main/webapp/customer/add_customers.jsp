<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customers</title>
        <%@include file="/admin/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="/admin/navbar.jsp" %>
        
        <div class="container p-2 flex-grow-1">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h4 class="text-center">Add Customers</h4>
                            
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                   
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                           <form action="../customer/add_customers" method="post">

                                <div class="form-group">
                                    <label for="name">Customer Name</label>
                                    <input type="text" class="form-control" id="name"
                                           required name="name">
                                </div>


                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address"
                                           required name="address">
                                </div>

                                <div class="form-group">
                                    <label for="contactno">Contact No</label>
                                    <input type="number" class="form-control" id="contactno"
                                           required name="contactno">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Add</button><br>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <%@include file="/admin/footer.jsp"%>
    </body>
</html>
