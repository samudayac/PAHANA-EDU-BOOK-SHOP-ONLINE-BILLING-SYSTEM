<%@page import="com.pahanaedu.DAO.CustomerDAOImpl"%>
<%@page import="com.pahanaedu.entity.Customer"%>
<%@page import="com.pahanaedu.DAO.UserDAOImpl"%>
<%@page import="com.pahanaedu.entity.User"%>
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
        <title>Edit Users</title>
        <%@include file="../admin/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="../admin/navbar.jsp" %>
        
        <div class="container p-2 flex-grow-1">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h4 class="text-center">Edit Customers</h4>
                      
                                <%
                                int accountno=Integer.parseInt(request.getParameter("accountno"));
                                CustomerDAOImpl dao= new CustomerDAOImpl(DBConnection.getConn());
                                Customer c = dao.getCustomerByAccountno(accountno);                                
                                %>
                                
                            <form action="<%= request.getContextPath() %>/customer/edit_customers" method="post">
                             <input type="hidden" name="accountno" value="<%=c.getAccountno()%>">


                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name"
                                           required name="name" value="<%=c.getName()%>">
                                </div>

                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address"
                                           required name="address" value="<%=c.getAddress()%>">
                                </div>

                                <div class="form-group">
                                    <label for="contactno">Contact Number</label>
                                    <input type="text" class="form-control" id="contactno"
                                           required name="contactno" pattern="\d{10}" maxlength="10"
                                           value="<%= c.getContactno()%>">
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
        
        
        <%@include file="../admin/footer.jsp"%>
    </body>
</html>
