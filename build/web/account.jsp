<%-- 
    Document   : account
    Created on : Oct 4, 2023, 11:00:36 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.DAO" %>
<%@page import="model.Category" %>
<%@page import="model.Product" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
        <title>Borcelle</title>
        <style>
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
                margin-bottom: 10px
            }
            .header p{
                padding-right: 50px;
                font-size: 20px;
                font-family: "Times New Roman", Times, serif;
            }
            .header p>a{
                font-family: "Times New Roman", Times, serif;
            }
            .header a{
                font-family: "Times New Roman", Times, serif;
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
            .list a{
                display: flex;
                text-decoration: none;
                color: black;
            }
            .list ul{
                list-style-type: none;
                display: flex;
            }
            .list li{
                margin-right: 80px;
                font-size: 18px;
                color: #6D214F;
                font-weight: bold;
                padding-bottom: 10px
            }
            .list li a{
                margin-top: 10px;
                font-family: "Times New Roman", Times, serif;
            }
            .menu{
                display: flex;
                background-color: #dff9fb;
            }
            .cart img{
                width:20px;
                margin-right: 10px
            }
            .cart{
                margin-right: 200px;
                margin-top: 10px;
            }
            .identify{
                margin-top: 10px;
                display: flex;
            }
            .identify button{
                margin-right: 30px;
                width: 100px;
                background-color: #fbc531;
            }
            .identify a{
                font-size: 20px;
                text-decoration: none;
                color: black;
                font-family: "Times New Roman", Times, serif;

            }
            .cart a{
                font-size: 17px;
                text-decoration: none;
                color: #192a56;
                font-family: "Times New Roman", Times, serif;
            }
            .category-items img{
                width: 200px;
                height: 230px
            }
            .category-items{
                margin-top: 20px;
                margin-left: 20px;
                border: 1px black solid;
                padding: 10px;
                width: 250px;
                align-items: center;
            }
            .category{
                display: flex;
            }
            .category-items-content{
                margin-top: 20px;
                width: 200px;
                height:180px;
                background-color: yellow;
            }
            .category-items-content p:last-child{
                font-weight: bold;
                color: red;
            }
            .category {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .category-items {
                width: 20%; /* Each item occupies 24% of the container width to create 4 items in a row */
                margin-bottom: 20px;
            }

            .category-items a {
                display: block;
            }

            .category-items img {
                max-width: 100%;
                height: auto;
            }

            .category-items-content {
                background-color: yellow;
                padding: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 200px
            }
            .category {
                display: flex;
                overflow-x: auto; /* Enable horizontal scrolling */
                white-space: nowrap;
                
            }
            .avatar img{
                border-radius: 50%;
                width: 50px;

            }
            .logout{
                text-decoration: none;
                border: 2px solid black;
                margin-left: 10px;
                border-radius: 5px;
                background-color: yellow;
                height: 35px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <a href="cid2?cid2=0"><img src="image/Logo.png"/></a>
            <form action="search" method="post">
                <input type="text" name="Enter"/>
                <a href="search.jsp"><input type="submit" value="Search"/></a>
            </form>
            <p>Contact: <a class="phone" href="">+84 345 194 934</a></p>
        </div> 
        <div class="menu">
            <div class="list">
                <ul>

                    <li><a href="cid2?cid2=0">All</a></li>
                        <%
                                    DAO d = new DAO();
                                    List<Category> list = d.getAll();
                                    for(Category cate : list){
                        %>
                    <li><a href="cid2?cid2=<%=cate.getCategoryID()%>"><%=cate.getCategoryName()%></a></li>
                        <%
                            }
                        %>
                </ul>
            </div>
            <div class="cart">
                <img src="image/cart.png" alt="alt"/><a href="allcart">My shopping cart items</a>
            </div>

            <div class="identify">
                <p class="pa">${sessionScope.account.getCustomerName()}</p>
                <a class="avatar" href="avatar.jsp"><img src="image/avatar.jpg" alt="alt"/></a>
                <a class="logout" href="cid?cid=0">Log out</a>
            </div>
        </div>
        <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        %>
        <div class="category">
            <%
            if (products != null) {
                for (Product p : products) {
            %>
            <div class="category-items">
                <a href="ProductID2?ProductID2=<%= p.getProductID() %>"><img src="<%= p.getImage() %>"/></a>
                <div class="category-items-content">
                    <p>No: <%= p.getProductID() %></p>
                    <p>Product Name: <%= p.getProductName() %></p>
                    <p>Quantity: <%= p.getQuantity() %></p>
                    <p>Price: <%= p.getPrice() %></p>
                </div>
            </div>
            <%
                }
            }
            
            %>
        </div>



    </body>
</html>
