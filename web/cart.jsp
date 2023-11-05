<%-- 
    Document   : cart
    Created on : Oct 21, 2023, 1:01:25 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
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
            .payment-form{
                margin-left: 400px
            }
            .payment-form p > input{
                width: 100px;
                height: 20px;
                margin-top: 20px
            }
            .payment-form p{
                font-size: 20px;
                font-family: "Times New Roman", Times, serif;

            }
            .note1{
                font-weight: bold;
                color: green;
                font-size: 25px
            }
            .payment-form .form-payment{
                width: 250px;
                font-size: 15px;
                font-weight: bold;
                background: yellow
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
        <hr/>
        <%
   Integer currentCartID = (Integer) application.getAttribute("currentCartID");

    if (currentCartID == null) {
        // Nếu CartID chưa được khởi tạo, gán nó bằng 1
        currentCartID = 1;
    } else {
        // Nếu đã có CartID, tăng giá trị lên 1 cho sản phẩm tiếp theo
        currentCartID++;
    }

    // Lưu giá trị CartID vào biến toàn cục
    application.setAttribute("currentCartID", currentCartID);        %>

        <form class="payment-form" action="cart" method="post">
            <p>Number Cart: <input name="CartID" value = "<%= currentCartID  %>" /></p><br/>
            <p class="note1">Thong tin san pham da chon: </p>
            <p>Product Name: <%= request.getParameter("productName") %><p>
            <p>Quantity: <%= request.getParameter("quantity") %><p>
            <p>Price: <%= request.getParameter("price") %><p>
                <input type="hidden" name="productName" value="<%= request.getParameter("productName") %>"/>
                <input type="hidden" name="quantity" value="<%= request.getParameter("quantity") %>"/>
                <input type="hidden" name="price" value="<%= request.getParameter("price") %>"/>

                <input class="form-payment" type="submit" value="Xac nhan them vao gio hang">
        </form>

        <hr/>

    </body>
</html>
