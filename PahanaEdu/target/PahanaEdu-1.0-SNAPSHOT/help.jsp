<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help Page</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1;
        }
        
        .help-container {
            margin-top: 30px;
            margin-bottom: 40px;
        }
        .card-header {
            background-color: darkslategray;
            color: #fff;
            cursor: pointer;
        }
        .card-header:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp" %>

    <div class="container help-container content">
        <h2 class="text-center mb-4 text-success"><i class="fa-solid fa-circle-question"></i> Help Section</h2>
        <p class="text-center text-muted">
            Welcome to the <b>Pahana Edu Bookshop Billing System</b>.  
            Use this guide to understand how to operate the system effectively.
        </p>

        <div class="accordion" id="helpAccordion">

            <div class="card">
                <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne">
                    <h5 class="mb-0"><i class="fa-solid fa-right-to-bracket"></i> 1. Login Instructions</h5>
                </div>
                <div id="collapseOne" class="collapse" data-parent="#helpAccordion">
                    <div class="card-body">
                         <b>Register with your details, then log in using email & password.</b><br><br>
                         Registration: <br>
                         1)Enter the Name <br>
                         2)Add the Valid Email <br>
                         3)Enter the Valid Contact No <br>
                         4)Add the Permanent Address <br>
                         5)Enter the Strong Password <br><br>
                         <b>*After registration, an ID number is automatically generated for each user.</b>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo">
                    <h5 class="mb-0"><i class="fa-solid fa-users"></i> 2. Customer Management</h5>
                </div>
                <div id="collapseTwo" class="collapse" data-parent="#helpAccordion">
                    <div class="card-body">
                        *Admin/User(Staff) can Manage Customers (add, edit, delete, and view customer details). <br> 
                        *Customers cannot access the system directly.
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" id="headingThree" data-toggle="collapse" data-target="#collapseThree">
                    <h5 class="mb-0"><i class="fa-solid fa-bag-shopping"></i> 3. Item Management</h5>
                </div>
                <div id="collapseThree" class="collapse" data-parent="#helpAccordion">
                    <div class="card-body">
                        *Admin/User(Staff) can Manage Items (add, edit, delete, and view item details)<br>
                        *Each item has an ID, name, price, type, and photo.
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" id="headingFour" data-toggle="collapse" data-target="#collapseFour">
                    <h5 class="mb-0"><i class="fa-solid fa-id-card"></i> 4. User(Staff) Management (Admin Only)</h5>
                </div>
                <div id="collapseFour" class="collapse" data-parent="#helpAccordion">
                    <div class="card-body">
                        *Admin can Manage the Users (view, edit, and delete registered users(staff)).<br>  
                        *User(Staff) accounts are created individually via registration.
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" id="headingFive" data-toggle="collapse" data-target="#collapseFive">
                    <h5 class="mb-0"><i class="fa-solid fa-file-invoice-dollar"></i> 5. Billing Management</h5>
                </div>
                <div id="collapseFive" class="collapse" data-parent="#helpAccordion">
                    <div class="card-body">
                        *Staff can create bills by selecting a customer and items.  <br>
                        *System automatically calculates totals.  <br>
                        *Bills can be printed and viewed later from the database.<br>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" id="headingEight" data-toggle="collapse" data-target="#collapseEight">
                    <h5 class="mb-0"><i class="fa-solid fa-headset"></i> 8. Support</h5>
                </div>
                <div id="collapseEight" class="collapse" data-parent="#helpAccordion">
                    <div class="card-body">
                        For assistance:<br>
                        📧 Email: <b>support@pahanaedu.lk</b><br>
                        ☎ Hotline: <b>+94 11 234 5758</b>
                    </div>
                </div>
            </div>

        </div>
    </div>
    
    

    <%@ include file="all_component/footer.jsp" %>
</body>
</html>
