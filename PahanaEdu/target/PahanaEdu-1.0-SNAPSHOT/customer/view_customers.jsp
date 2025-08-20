<%@page import="com.pahanaedu.DAO.CustomerDAOImpl"%>
<%@page import="com.pahanaedu.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.pahanaedu.DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Users</title>
        <%@include file="../admin/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="../admin/navbar.jsp" %>
        
    <c:if test="${not empty succMsg}">
            <p class="text-center text-success">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
    </c:if>

                   
    <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
    </c:if>
        
        <table class="table table-striped">
            <thead class="bg-primary">
              <tr>
                <th scope="col">Account No</th>
                <th scope="col">Customer Name</th>
                <th scope="col">Address</th>
                <th scope="col">Contact No</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
                
                <% 
                CustomerDAOImpl dao= new CustomerDAOImpl(DBConnection.getConn());
                List<Customer> list =dao.getAllCustomers();
                for(Customer c:list){
                %>
                    
                <tr>
                <td><%=c.getAccountno()%></td>
                <td><%=c.getName()%></td>
                <td><%=c.getAddress()%></td>
                <td><%=c.getContactno()%></td>
                <td>
                    <a href="edit_customers.jsp?accountno=<%=c.getAccountno()%>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="<%= request.getContextPath() %>/customer/delete?accountno=<%=c.getAccountno()%>"
                    class="btn btn-sm btn-danger">Delete</a>
                </td>
              </tr>
                 
                 <%
              }
             %>
              
            </tbody>
          </table>
        
        
        <div class="container p-2 flex-grow-1">  
        </div>
        <%@include file="../admin/footer.jsp"%>

    </body>
</html>
