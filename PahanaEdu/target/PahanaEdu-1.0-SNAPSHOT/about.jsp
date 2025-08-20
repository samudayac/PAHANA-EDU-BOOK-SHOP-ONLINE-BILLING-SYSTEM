<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Page</title>
    <%@ include file="all_component/allCss.jsp" %>

    <style>
        .content-about {
            padding: 60px 15%;
            margin: 50px auto;
            background-color: #f1f3f5;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .content-about h1, .content-about h2 {
            color: #024402;
        }

        .content-about p {
            font-size: 18px;
            text-align: justify;
        }

        .content-about ul {
            margin-left: 40px;
            font-size: 18px;
        }

        .contact-section {
            margin-top: 50px;
            padding: 40px 15%;
            background-color: #e9ecef;
            border-radius: 12px;
        }

        .contact-section h2 {
            color: #024402;
            margin-bottom: 20px;
        }

        .contact-details p {
            font-size: 18px;
            margin: 8px 0;
        }

        .social-links a {
            margin-right: 20px;
            font-size: 22px;
            color: #024402;
            text-decoration: none;
        }

        .social-links a:hover {
            color: #0b6623;
        }
    </style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp" %>

    <div class="container content-about">
        <h1>About Us</h1>
        <p>
            Welcome to <b>Pahana Edu Bookshop Billing System</b>.  
            We are a trusted leading bookshop in Colombo, providing a wide range of academic books, stationery, and learning materials 
            for students, teachers, and professionals.
        </p>

        <h2>Our Mission</h2>
        <p>
            To provide an efficient and user-friendly billing system that improves customer service, transparency, 
            and reliability in managing bookshop operations. We aim to blend technology with education by making transactions 
            seamless and secure.
        </p>

        <h2>Why Choose Us?</h2>
        <ul>
            <li><b>Accuracy:</b> Automated billing ensures error-free transactions.</li>
            <li><b>Convenience:</b> Manage accounts and bills online from anywhere.</li>
            <li><b>Support:</b> Dedicated help section and support team available.</li>
        </ul>

        <h2>Privacy & Security</h2>
        <p>
            We value your trust and are committed to protecting your personal data.  
            Our system uses secure authentication and encrypted transactions to keep your information safe.  
        </p>
    </div>

    <div class="contact-section">
        <h2>Contact Us</h2>
        <div class="contact-details">
            <p><b>Address:</b> Pahana Edu Bookshop, Main Street, Colombo 07, Sri Lanka</p>
            <p><b>Phone:</b> +94 77 123 4567</p>
            <p><b>Hotline:</b>+94 11 234 5758</p>
            <p><b>Email:</b> info@pahanaedu.lk</p>
        </div>

        <h3>Follow Us</h3>
        <div class="social-links">
            <a href="https://www.facebook.com/pahanaedu" target="_blank"><i class="fab fa-facebook"></i> Facebook</a>
            <a href="https://www.instagram.com/pahanaedu" target="_blank"><i class="fab fa-instagram"></i> Instagram</a>
            <a href="https://twitter.com/pahanaedu" target="_blank"><i class="fab fa-twitter"></i> X (Twitter)</a>
            <a href="https://wa.me/94771234567" target="_blank"><i class="fab fa-whatsapp"></i> WhatsApp</a>
        </div>
    </div>

    <%@ include file="all_component/footer.jsp" %>
</body>
</html>
