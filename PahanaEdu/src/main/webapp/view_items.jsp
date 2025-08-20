<%@page import="java.util.List"%>
<%@page import="com.pahanaedu.entity.Item"%>
<%@page import="com.pahanaedu.DB.DBConnection"%>
<%@page import="com.pahanaedu.DAO.ItemDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Items</title>
        <%@include file="/all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="/all_component/navbar.jsp" %>
        <h3 class="text-center">View Items</h3>
        
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
                <th scope="col">Item Id</th>
                <th scope="col">Item Name</th>
                <th scope="col">Price</th>
                <th scope="col">Item Type</th>
                <th scope="col">Photo</th>
              </tr>
            </thead>
            <tbody>
                
                <% 
                ItemDAOImpl dao= new ItemDAOImpl(DBConnection.getConn());
                List<Item> list =dao.getAllItems();
                for(Item i:list){
                %>
                    
                <tr>
                <td><%=i.getItemid()%></td>
                <td><%=i.getIname()%></td>
                <td><%=i.getPrice()%></td>
                <td><%=i.getType()%></td>
                <td><img src="<%= request.getContextPath() %>/img/item/<%= i.getPhoto() %>"
                style="width:100px; height:100px;">
                </td>
              </tr>
                 
                 <%
              }
             %>
              
            </tbody>
          </table>
        
        
        <div class="container p-2 flex-grow-1">  
        </div>
        <%@include file="/all_component/footer.jsp"%>

    </body>
</html>

