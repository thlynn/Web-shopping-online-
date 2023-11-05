<%-- 
    Document   : search
    Created on : Oct 5, 2023, 2:10:10 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-color: #ffeaa7;
            }
            .category-items img{
                width: 200px;
                height: 230px
            }
            .category-items{
                margin-top: 20px;
                margin-left: 50px;
                border: 1px black solid;
                padding: 10px;
                width: 200px;
                align-items: center;
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
            .category{
                display: flex;
            }
            .category li{
                display: flex;
                list-style-type: none;
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
        <ul class="category">
            <%
List<Product> products = (List<Product>) request.getAttribute("listP");
if(products == null ){
            %>
            <h3>No Product</h3>
            
            <%                        
                }
            if (products != null) {
                for (Product p : products) {
            %>
             
            <li>
                <div class="category-items">
                <a href="ProductID?ProductID=<%= p.getProductID() %>"><img src="<%= p.getImage() %>"/></a>
                <div class="category-items-content">
                    <p>No: <%= p.getProductID() %></p>
                    <p>Product Name: <%= p.getProductName() %></p>
                    <p>Quantity: <%= p.getQuantity() %></p>
                    <p>Price: <%= p.getPrice() %></p>
                </div>
            </div>
            </li>
            
            <%
                }
                            }
                            
            %>
            </div>
            
        </ul>
            <div class="footer">
            <a href="cid?cid=0">CONTINUE TO BACK HOME PAGE TO SHOPPING</a>
            <img src="image/click.png" alt="alt"/>
        </div>
    </body>
</html>
