<%-- 
    Document   : AddProduct
    Created on : Oct 24, 2023, 12:49:05 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product Page</title>
        <style>
            /* Style the form container */
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
            .search input:last-child{
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
            .buy {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f7f7f7;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }

            /* Style the form labels */
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            /* Style the input fields */
            input[type="text"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            /* Style the submit button */
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Style the submit button on hover */
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>

    </head>
    <body>
        <div class="header">
            <a href="cid3?cid3=0"><img src="image/Logo.png"/></a>
            <form class="search" action="search" method="post">
                <input type="text" name="Enter"/>
                <a href="search.jsp"><input type="submit" value="Search"/></a>
            </form>
            <p>Contact: <a class="phone" href="">+84 345 194 934</a></p>
        </div> 
        <form class="buy" action="buy" method="POST">
            <input type="hidden" name="AdminUserName" value="${sessionScope.account.getCustomerName()}">
            ProductID: <input type="text" name="ProductID" id="productIDInput" readonly>
            ProductName: <input type="text" name="ProductName">
            Quantity: <input type="text" name="Quantity">
            Price: <input type="text" name="Price">
            Image: <input type="text" name="Image">
            CategoryID (Choose 1. Woman, 2. Man, 3. Children) <input type="text" name="cid">
            <input type="submit" name="Add">
        </form>
        <script>
            // Lấy trường ProductID bằng id
            var productIDInput = document.getElementById("productIDInput");

            // Đặt giá trị ban đầu là 13
            var currentProductID = 13;
            productIDInput.value = currentProductID;

            // Hàm để cập nhật giá trị ProductID
            function updateProductID() {
                // Tăng giá trị tiếp theo lên 1
                currentProductID++;

                // Gán giá trị mới vào trường ProductID
                productIDInput.value = currentProductID;
            }

            // Gọi hàm để cập nhật ProductID khi tải trang
            window.onload = updateProductID;

            // Gọi hàm để cập nhật ProductID khi thêm sản phẩm
            function addProduct() {
                updateProductID();
            }
        </script>





    </body>
</html>
