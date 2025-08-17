<%@page import="com.pahanaedu.DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
  <title>Pahana Edu</title>
        <%@include file="all_component/allCss.jsp" %>
<style type="text/css">
    .back-img {
        background: url("img/background.jpeg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        height: 70vh; 
        width: 100%;
    }
    
    .crd-ho:hover{
        background-color: aliceblue;
    }
    
    #slider {
        overflow: hidden;
        width: 100%;
        height: 200%; 
        position: relative;
        background-color: aliceblue;
    }

    #slider figure {
        position: relative;
        width: calc(100% * 12); 
        margin: 0;
        left: 0;
        display: flex;
        animation: 40s slider infinite;
    }

    #slider figure img {
        width: 100%;
        max-width: 100%;
        padding: 5px;
        height: 500px;         
        object-fit: contain;    

    }

    @keyframes slider {
        0% { left: 0; }
        8% { left: 0; }
        12% { left: -100%; }
        20% { left: -100%; }
        24% { left: -200%; }
        32% { left: -200%; }
        36% { left: -300%; }
        44% { left: -300%; }
        48% { left: -400%; }
        56% { left: -400%; }
        60% { left: -500%; }
        68% { left: -500%; }
        72% { left: -600%; }
        80% { left: -600%; }
        84% { left: -700%; }
        92% { left: -700%; }
        96% { left: -800%; }
        100% { left: -800%; }
    }
    
</style>

    </head>
    <body>  
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid back-img d-flex justify-content-center align-items-center">
        <h2 class="text-white display-3" style="font-weight: bold;">Pahana Edu Bookshop</h2>
        </div>
        
        <hr>
        

        
        <div class="container" style="background-color:beige">
            <h3 class="text-center">Items</h3>
<div class="row"> 
    <div class="col-md-3">
        <div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="img/item/Madol_Duwa.jpeg"
                     style="width: 150px; height: 200px" class="img-thumbnail">
                <p>Madol Duwa</p>
                <p>Martin Wickramasinghe</p>
                <p>Categories : Novel</p>
                <p>Rs.500.00</p>

            </div>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="img/item/FAMOUS FIVE BOOK COLLECTION.jpg"
                     style="width: 150px; height: 200px" class="img-thumbnail">
                <p>Famous Five(Complete Collection)</p>
                <p>Enid Blyton</p>
                <p>Categories : Novel</p>
                <p>Rs.5000.00</p>

            </div>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="img/item/ATLAS BLUE PEN BOX.jpg"
                     style="width: 150px; height: 200px" class="img-thumbnail">
                <p>Blue Pen Box(50pcs)</p>
                <p>Atlas</p>
                <p>Categories : Stationary</p>
                <p>Rs.350.00</p>

            </div>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="img/item/ATL-RUL-6-01.webp"
                     style="width: 150px; height: 200px" class="img-thumbnail">
                <p>6inch Ruller</p>
                <p>Atlas</p>
                <p>Categories : Stationary</p>
                <p>Rs.80.00</p>

            </div>
        </div>
    </div>
    
</div>

            <div class="text-center mt-1">
                <a href="" class="btn btn-danger btn-sm text-white">View All</a>
            </div>
            
        </div>
        


<hr>
                

        
<div id="slider">
    <figure>
        <img src="img/bookshop.jpg">
        <img src="img/bookshop1.jpg">
        <img src="img/bookshop2.jpg">
        <img src="img/bookshop3.jpg">
        <img src="img/books1.jpg">
        <img src="img/books2.jpg">
        <img src="img/books3.jpg">
        <img src="img/books4.jpg">
        <img src="img/stationery1.jpg">
        <img src="img/stationery2.jpg">
        <img src="img/stationary3.jpg">
        <img src="img/bookshop.jpg">
    </figure>
            
</div>

<hr>
        

                
        </div>
        
        <%@include file="all_component/footer.jsp"%>
        
        </body> 
    
</html>


