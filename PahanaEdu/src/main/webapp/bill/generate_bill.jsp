<%@ page import="java.sql.*, com.pahanaedu.DB.DBConnection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Bill</title>
    <%@ include file="../admin/allCss.jsp" %>
</head>
<body>
        <%@include file="../admin/navbar.jsp" %>
<div class="container mt-4">
    <h2>Generate Bill</h2>

    <c:if test="${not empty sessionScope.failedMsg}">
        <div class="alert alert-danger">${sessionScope.failedMsg}</div>
        <c:remove var="failedMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty sessionScope.succMsg}">
        <div class="alert alert-success">${sessionScope.succMsg}</div>
        <c:remove var="succMsg" scope="session"/>
    </c:if>

    <form action="${pageContext.request.contextPath}/bill/generateBill" method="post" id="billForm">

        <label for="customerSelect">Select Customer</label>
        <select id="customerSelect" name="accountno" class="form-control" required>
            <%
                try (Connection conn = DBConnection.getConn();
                     PreparedStatement ps = conn.prepareStatement("SELECT accountno, name FROM customer ORDER BY name");
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
            %>
                <option value="<%=rs.getInt("accountno")%>"><%=rs.getString("name")%></option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>

        <br>

        <select id="itemsData" style="display:none;">
            <%
                try (Connection conn = DBConnection.getConn();
                     PreparedStatement ps = conn.prepareStatement("SELECT itemid, iname, price FROM item ORDER BY iname");
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
            %>
                <option value="<%=rs.getInt("itemid")%>" data-price="<%= rs.getDouble("price") %>">
                    <%= rs.getString("iname") %> (<%= rs.getDouble("price") %>)
                </option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>

        <div id="itemContainer" class="mt-3">
            <label>Items</label>
        </div>

        <button type="button" class="btn btn-primary mt-2" onclick="addItemRow()">Add Item</button>

        <hr>
        <h4>Total: <span id="totalAmount">0.00</span></h4>

        <button type="submit" class="btn btn-success mt-2">Generate Bill</button>
    </form>
</div>

<script>
function addItemRow() {
    const row = document.createElement("div");
    row.className = "item-row";

    const itemSelect = document.createElement("select");
    itemSelect.name = "itemid"; 
    itemSelect.className = "form-control";
    itemSelect.required = true;
    itemSelect.onchange = calculateTotal;

    const hiddenSelect = document.getElementById("itemsData");
    for (let i = 0; i < hiddenSelect.options.length; i++) {
        const opt = hiddenSelect.options[i].cloneNode(true);
        itemSelect.appendChild(opt);
    }

    const qtyInput = document.createElement("input");
    qtyInput.type = "number";
    qtyInput.name = "qty"; 
    qtyInput.className = "form-control";
    qtyInput.min = "1";
    qtyInput.value = "1";
    qtyInput.required = true;
    qtyInput.oninput = calculateTotal;

    const removeBtn = document.createElement("button");
    removeBtn.type = "button";
    removeBtn.className = "btn btn-danger";
    removeBtn.textContent = "Remove";
    removeBtn.onclick = function () {
        row.remove();
        calculateTotal();
    };

    row.appendChild(itemSelect);
    row.appendChild(qtyInput);
    row.appendChild(removeBtn);

    document.getElementById("itemContainer").appendChild(row);

    calculateTotal();
}

function calculateTotal() {
    let total = 0;
    document.querySelectorAll(".item-row").forEach(row => {
        const select = row.querySelector("select");
        const qty = parseInt(row.querySelector("input").value) || 0;
        const price = parseFloat(select.selectedOptions[0].getAttribute("data-price")) || 0;
        total += price * qty;
    });
    document.getElementById("totalAmount").textContent = total.toFixed(2);
}

window.onload = addItemRow;
</script>
    <%@include file="../admin/footer.jsp"%>
</body>
</html>
