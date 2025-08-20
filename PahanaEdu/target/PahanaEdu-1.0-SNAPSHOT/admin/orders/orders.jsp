<%@page import="java.util.List"%>
<%@page import="com.pahanaedu.entity.Bill"%>
<%@page import="com.pahanaedu.entity.BillItem"%>
<%@page import="com.pahanaedu.DAO.BillDAOImpl"%>
<%@page import="com.pahanaedu.DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Bill Items</title>
    <%@include file="/admin/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
    <%@include file="/admin/navbar.jsp" %>
    <h3 class="text-center">Orders</h3>

    <c:if test="${not empty succMsg}">
        <p class="text-center text-success">${succMsg}</p>
        <c:remove var="succMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty failedMsg}">
        <p class="text-center text-danger">${failedMsg}</p>
        <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <table class="table table-striped">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">No</th>
                <th scope="col">Bill ID</th>
                <th scope="col">Item ID</th>
                <th scope="col">Item Name</th>
                <th scope="col">Quantity</th>
                <th scope="col">Unit Price</th>
                <th scope="col">Amount</th>
            </tr>
        </thead>
        <tbody>
                <% 
                BillDAOImpl dao= new BillDAOImpl(DBConnection.getConn());
                List<BillItem> list =dao.getAllBillItems();
                for(BillItem bi:list){
                %>
                    
                <tr>
                <td><%=bi.getBill_item_id()%></td>
                <td><%=bi.getBill_id()%></td>
                <td><%=bi.getItemid()%></td>
                <td><%=bi.getIname()%></td>
                <td><%=bi.getQuantity()%></td>
                <td><%=bi.getUnit_price()%></td>
                <td><%=bi.getAmount()%></td>
              </tr>
                 
                 <%
              }
             %>
              
            </tbody>
          </table>

    <div class="container p-2 flex-grow-1"></div>
    <%@include file="/admin/footer.jsp"%>
</body>
</html>
