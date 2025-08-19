<%@page import="com.pahanaedu.entity.Item"%>
<%@page import="com.pahanaedu.DAO.ItemDAOImpl"%>
<%@page import="com.pahanaedu.DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Items</title>
        <%@include file="/admin/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="/admin/navbar.jsp" %>
        
        <div class="container p-2 flex-grow-1">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h4 class="text-center">Edit Items</h4>
                                
                                <%
                                int id=Integer.parseInt(request.getParameter("id"));
                                ItemDAOImpl dao= new ItemDAOImpl(DBConnection.getConn());
                                Item i = dao.getItemById(id);                                
                                %>
                                
                            <form action="<%= request.getContextPath() %>/admin/items/edit_items" method="post">
                             <input type="hidden" name="itemid" value="<%=i.getItemid()%>">


                                <div class="form-group">
                                    <label for="name">Item Name</label>
                                    <input type="text" class="form-control" id="iname"
                                           required name="iname" value="<%=i.getIname()%>">
                                </div>


                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input type="number" class="form-control" id="price"
                                           required name="price" >
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Item Type</label>
                                     <input type="text" class="form-control" id="type"
                                     required name="type" value="<%=i.getType()%>">
                                </div>
                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update</button><br>

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
