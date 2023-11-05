<%-- 
    Document   : getAllBuying
    Created on : Oct 25, 2023, 10:33:50 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Buying" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Buying Page</title>
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
            .product {
                border: 1px solid #ddd;
                padding: 10px;
                margin: 10px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                width: 80%; /* Adjust the width as needed */
                margin: 0 auto; /* Center the product section horizontally */
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            img {
                max-width: 100px; /* Adjust the image size as needed */
                height: auto;
                display: block;
                margin: 0 auto; /* Center the image horizontally */
            }

            td.category {
                text-align: center;
            }
            .link{
                text-decoration: none;
                font-size: 15px;
                font-weight: bold;
                padding-top: 20px;
            }
            /* Add more specific styles as needed */
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
        <h1>Your Purchased Products</h1>

        <%
            List<Buying> list = (List<Buying>) request.getAttribute("listB");
            if (list != null) {
                for (Buying b : list) {
        %>
        <div class="product">
            <table>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th class="category">Category</th>
                </tr>
                <tr>
                    <td><%= b.getProductName() %></td>
                    <td><%= b.getQuantity() %></td>
                    <td>$<%= b.getPrice() %></td>
                    <td><img src="<%= b.getImage() %>" alt="Product Image"/></td>
                    <td class="category"><%= b.getCid().getCategoryName() %></td>
                </tr>
            </table>
        </div>

        <%
                }
            } else {
        %>
        <p>No purchased products available.</p>
        <%
            }
        %>
        <a class="link" href="cid3?cid3=0">Continue to shopping</a>
    </body>
</html>
