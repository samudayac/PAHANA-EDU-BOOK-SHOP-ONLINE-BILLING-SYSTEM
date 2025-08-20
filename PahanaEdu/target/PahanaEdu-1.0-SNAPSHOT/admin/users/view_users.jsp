<%@page import="java.util.List"%>
<%@page import="com.pahanaedu.entity.User"%>
<%@page import="com.pahanaedu.DAO.UserDAOImpl"%>
<%@page import="com.pahanaedu.DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Users</title>
        <%@include file="/admin/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="/admin/navbar.jsp" %>
        <h3 class="text-center">Users</h3>
        
        
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
                <th scope="col">User Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact No</th>
                <th scope="col">Address</th>
                <th scope="col">Password</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
                
                <% 
                UserDAOImpl dao= new UserDAOImpl(DBConnection.getConn());
                List<User> list =dao.getAllUsers();
                for(User u:list){
                %>
                    
                <tr>
                <td><%=u.getId()%></td>
                <td><%=u.getName()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getContactno()%></td>
                <td><%=u.getAddress()%></td>
                <td><%=u.getPassword()%></td>
                <td>
                    <a href="edit_users.jsp?id=<%=u.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="<%= request.getContextPath() %>/users/delete?id=<%=u.getId()%>"
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
        <%@include file="/admin/footer.jsp"%>

    </body>
</html>
