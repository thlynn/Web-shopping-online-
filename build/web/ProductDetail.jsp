<%-- 
    Document   : ProductDetail
    Created on : Oct 5, 2023, 8:57:33 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Page</title>
        <style>
            .product-detail{
                display: flex;
                margin-top: 20px;
                margin-left: 30px;
                height:  460px
            }
            .product-detail img{
                width: 300px;
                height: 400px;
                border: 3px solid black;
                padding: 5px
            }
            .product-detail-items{
                margin-left: 50px;
                margin-top: 100px;
                background-color: #f1f2f6;
                border-radius: 3px;
                border: 2px solid black;
                margin-bottom: 150px;
                padding: 5px
            }
            .product-detail-items p{
                font-size: 20px
            }
            .product-detail-items p:last-child{
                font-weight: bold;
                color:red
            }
            .product-detail-buying{
                margin-left: 100px;
                padding-left: 100px;
                padding-top: 100px;
                border-left: 1px black solid;
            }
            .product-detail-buying input{
                width: 30px
            }
            body{
                background-color: #ffeaa7;
            }
            .header{
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding-top: 10px;
            }
            .header img{
                width: 100px;
                border-radius: 50%;
                margin-left: 50px;
                margin-bottom: 10px;
            }
            .header p{
                padding-right: 50px;
                font-size: 20px
            }
            .header input{
                width: 200px;
                height: 25px;
                margin-right: 10px
            }
            form input:last-child{
                height: 25px;
                width: 80px;
            }
            .phone{
                text-decoration: none;
                border: 2px solid #ffffff;
                color: black;
                background-color: #ffffff;
                padding: 5px
            }
            .footer{
                display: flex;

            }
            .footer img{
                width: 50px
            }
            .footer a{
                text-decoration: none;
                color:  #ffffff;
                font-weight: bold;
                background-color: red;
                border: 2px solid #ffffff;
                padding: 5px;
                height: 13px
            }
            .content1{
                font-size: 20px;
                font-weight: bold;
                color:red;
            }
            .content2{
                font-size: 16px;
            }
            .content3{
                font-size: 16px;
            }
            .content3 span{
                color: red;
                font-size: 16px;
                font-weight: bold;
            }
            .link{
                text-decoration: none;
                color: black;
                font-size: 15px
            }
        </style>
    </head>
    <body>
        <div class="header">
            <a href="cid?cid=0"><img src="image/Logo.png"/></a>
            <form action="search" method="post">
                <input type="text" name="Enter"/>
                <a href="search.jsp"><input type="submit" value="Search"/></a>
            </form>
            <p>Contact: <a class="phone" href="">+84 345 194 934</a></p>
        </div> 
        <%
        Product product = (Product) request.getAttribute("product");
        
        if (product != null) {
        %>
        <div class="product-detail">
            <img src="<%= product.getImage() %>"/>
            <div class="product-detail-items">
                <p>No: <%= product.getProductID() %></p>
                <p>Product Name: <%= product.getProductName() %></p>
                <p>Quantity: <%= product.getQuantity() %></p>
                <p>Price: <%= product.getPrice() %></p>
            </div>
            <div class="product-detail-buying">
                <p class="content1">THONG TIN MUA HANG</p>
                <p class="content2">So luong ban muon mua:</p>
                <input type="number" id="quantity" value="1" min="1"/>
                <input type="hidden" id="price" value="<%= product.getPrice() %>" />
                <hr/>
                <p class="content3">Tong tien phai thanh toan: 
                    <span id="total"><%= product.getPrice() %></span>
                </p>
                <button><a class="link" href="login.jsp">Mua hang</a></button>
                <button><a class="link" href="login.jsp">Them vao gio hang</a></button>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="product-detail">
            <p>Product not found.</p>
        </div>
        <%
        }
        %>

        <div class="footer">
            <a href="cid?cid=0">CONTINUE TO BACK HOME PAGE TO SHOPPING</a>
            <img src="image/click.png" alt="alt"/>
        </div>
        <script>
        // Get the quantity and price elements
        var quantityInput = document.getElementById("quantity");
        var priceInput = document.getElementById("price");
        var totalElement = document.getElementById("total");

        // Function to calculate and update the total
        function updateTotal() {
            var quantity = parseInt(quantityInput.value, 10);
            var price = parseFloat(priceInput.value);
            var total = quantity * price;
            totalElement.innerText = total;
        }
          quantityInput.addEventListener("input", updateTotal);

        // Initial calculation
        updateTotal();
    </script>
    </body>
</html>
