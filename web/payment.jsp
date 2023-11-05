


<%-- 
    Document   : payment
    Created on : Oct 19, 2023, 10:45:54 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
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
            .content-payment{
                margin-left: 480px;
                margin-right: 480px;
                padding: 10px;
                font-size: 25px;
                font-weight: bold;
                color: white;
                background-color: red;
                border-radius: 5px;
                border: 3px solid black;
            }
            .payment p{
                margin-bottom: 5px;
                margin-left: 100px
            }
            .payment p > input{
                width: 300px;
                height: 20px;
                margin-left: 20px
            }
            .form-payment{
                width: 200px
            }
            .footer-payment{
                margin-bottom: 5px;
                margin-left: 100px;
                font-size: 20px
            }
            .footer-payment p:first-child{
                font-size: 30px;
                font-weight: bold;
                color: green;
            }
            .form-payment{
                margin-left: 200px;
                height: 20px;
                padding: 5px;
            }
            /* Apply this CSS to make the input buttons wider */
            .payment-form .form-payment {
                width: 200px; /* Adjust the width as needed */
                margin-bottom: 10px;
            }
            .note{
                text-decoration: none;
                font-size: 20px;
                background-color: yellow;
                border: 2px solid black;
                border-radius: 5px;
                margin-left: 200px
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
        <p class="content-payment">
            THANH TOAN HOA DON
        </p>
        <div class="payment">
            <%
   Integer OrderID = (Integer) application.getAttribute("OrderID");

    if (OrderID == null) {
        // Nếu CartID chưa được khởi tạo, gán nó bằng 1
        OrderID = 1;
    } else {
        // Nếu đã có CartID, tăng giá trị lên 1 cho sản phẩm tiếp theo
        OrderID++;
    }

    // Lưu giá trị CartID vào biến toàn cục
    application.setAttribute("OrderID", OrderID);        %>

            <form class="payment-form" action="payment" method="post">
                <p>Number Order: <input name="OrderID" value="<%= OrderID  %>"/></p><br/>
                <p>Customer Name: <input name="CustomerName" required/></p><br/>
                <p>Customer Address: <input name="CustomerAddress" required/></p><br/>
                <p>Phone Number: <input name="PhoneNumber" required/></p><br/>
                <input type="hidden" name="productName" value="<%= request.getParameter("productName") %>"/>
                <input type="hidden" name="quantity" value="<%= request.getParameter("quantity") %>"/>
                <input type="hidden" name="price" value="<%= request.getParameter("price") %>"/>

                <input class="form-payment" type="submit" value="Xac nhan mua hang">
            </form>

            <hr/>
            <div class="footer-payment">
                <p>Thong tin san pham da chon: </p>
                <p>Product Name: <%= request.getParameter("productName") %><p>
                <p>Quantity: <%= request.getParameter("quantity") %><p>
                <p>Price: <%= request.getParameter("price") %><p>
            </div>

        </div>
        <a href="cid2?cid2=0" class="note">Continue shopping online.</a>
    </body>
</html>
