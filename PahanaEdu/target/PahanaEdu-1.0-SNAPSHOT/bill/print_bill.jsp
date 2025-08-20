<%@ page import="com.pahanaedu.entity.Bill, com.pahanaedu.entity.BillItem" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Print Bill</title>
    <%@ include file="/admin/allCss.jsp" %>
    <style>
        .bill-container {
            max-width: 700px;
            margin: auto;
            padding: 15px;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #aaa;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .total-row td {
            font-weight: bold;
        }
        .print-btn {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="bill-container">
    <h2>Bill Details</h2>

    <%
        Bill bill = (Bill) request.getAttribute("bill");
        if (bill == null) {
    %>
        <p>Bill data not available.</p>
    <%
        } else {
    %>

    <p><strong>Bill ID:</strong> <%= bill.getBill_id() %></p>
    <p><strong>Customer Account No:</strong> <%= bill.getAccountno() %></p>
    <p><strong>Staff/User ID:</strong> <%= bill.getUser_id() %></p>

    <table>
        <thead>
            <tr>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (BillItem item : bill.getItems()) {
            %>
            <tr>
                <td><%= item.getIname() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= String.format("%.2f", item.getUnit_price()) %></td>
                <td><%= String.format("%.2f", item.getAmount()) %></td>
            </tr>
            <%
                }
            %>
            <tr class="total-row">
                <td colspan="3">Total Amount</td>
                <td><%= String.format("%.2f", bill.getTotal_amount()) %></td>
            </tr>
        </tbody>
    </table>

    <div class="print-btn">
        <button onclick="window.print()" class="btn btn-primary">Print Bill</button>
        <a href="generate_bill.jsp" class="btn btn-secondary">Back</a>
    </div>

    <%
        }
    %>
</div>
</body>
</html>
