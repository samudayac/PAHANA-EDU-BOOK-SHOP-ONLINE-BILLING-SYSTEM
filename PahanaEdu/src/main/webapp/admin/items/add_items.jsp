<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Items</title>
        <%@include file="/admin/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="/admin/navbar.jsp" %>
        
        <div class="container p-2 flex-grow-1">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h4 class="text-center">Add Items</h4>
                            
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                   
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                            <form action="add_items" method="post" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label for="name">Item Name</label>
                                    <input type="text" class="form-control" id="iname"
                                           required name="iname">
                                </div>


                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input type="number" class="form-control" id="price"
                                           required name="price">
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Item Type</label>
                                     <input type="text" class="form-control" id="type"
                                           required name="type">
                                </div>
                             

                                <div class="form-group">
                                    <label for="exampleformControlFile1">Upload Photo</label>
                                    <input name="photo" type="file" class="form-control-file" 
                                    id="exampleformControlFile1">
                                           
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
