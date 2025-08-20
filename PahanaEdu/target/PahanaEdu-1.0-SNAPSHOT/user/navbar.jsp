<div class="container-fluid" style="height: 10px;background-color: darkslategray;"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row align-items-center">
        
        <div class="col-md-3 text-success">
            <h3><i class="fa-solid fa-store"></i> Pahana Edu</h3>
        </div>
        
        <div class="col-md-9" style="text-align: right;">
            <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-danger">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>
        </div>

    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="<%= request.getContextPath() %>/admin/items/all_items.jsp">
                <i class="fa-solid fa-book fa-lg me-2"></i> All Items
            </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="<%= request.getContextPath() %>/customer/view_customers.jsp">
                <i class="fa-solid fa-file-pen fa-lg me-2"></i> View Customers
            </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="<%= request.getContextPath() %>/admin/users/view_users.jsp">
                <i class="fa-solid fa-users fa-lg me-2"></i> View Users
            </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="<%= request.getContextPath() %>/admin/orders/orders.jsp">
                <i class="fa-solid fa-box-open fa-lg me-2"></i> Orders
            </a>
        </li>
    </ul>

    <form class="form-inline my-2 my-lg-0">
        <a href="<%= request.getContextPath() %>/about.jsp" class="btn btn-light my-2 my-sm-0 me-3">
            <i class="fa-regular fa-file"></i> About
        </a>
        <a href="<%= request.getContextPath() %>/help.jsp" class="btn btn-light my-2 my-sm-0 me-3">
        <i class="fa-solid fa-circle-question"></i> Help
        </a>
    </form>
  </div>
</nav>
