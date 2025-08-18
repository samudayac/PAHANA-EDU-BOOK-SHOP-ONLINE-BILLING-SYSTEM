<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN HOME</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;" class="d-flex flex-column min-vh-100">
        <%@include file="navbar.jsp" %>
        <div class="container p-3 flex-grow-1">
            <div class="row p-5">
                
                <div class="col-md-3">
                    <a href="../admin/items/all_items.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-book fa-5x"></i><br>
                            <h4>All Items</h4>
                            ------------------
                            
                        </div>
                        
                    </div>
                    </a>
                </div>
                
                <div class="col-md-3">
                    <a href="../customer/view_customers.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-file-pen fa-5x"></i><br>
                            <h4>View Customers</h4>
                            ------------------
                            
                        </div>
                      
                    </div>
                    </a>
                </div>
                
                <div class="col-md-3">
                    <a href="../admin/orders/orders.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-box-open fa-5x"></i><br>
                            <h4>Orders</h4>
                            ------------------
                            
                        </div>
                        
                    </div>
                    </a>
                </div>
                
                <div class="col-md-3">
                    <a href="../admin/items/add_items.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-circle-plus fa-5x"></i><br>
                            <h4>Add Items</h4>
                            ------------------
                            
                        </div>
                        
                    </div>
                    </a>
                </div>
                
                <div class="col-md-3">
                    <a href="../customer/add_customers.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-right-to-bracket fa-5x"></i><br>
                            <h4>Add Customers</h4>
                            ------------------
                            
                        </div>
                        
                    </div>
                    </a>
                </div>
                
                <div class="col-md-3">
                    <a href="../bill/generate_bill.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-right-to-bracket fa-5x"></i><br>
                            <h4>Create Bill</h4>
                            ------------------
                            
                        </div>
                        
                    </div>
                    </a>
                </div>
                
            </div>
            
        </div>
        
                <%@include file="footer.jsp"%>
    </body>
</html>
