<%-- 
    Document   : adminProduct
    Created on : Oct 24, 2023, 4:53:15 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Buying" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            img{
                width: 100px;
                height:100px
            }
            .link{
                text-decoration: none;
                font-size: 15px;
                font-weight: bold;
                padding-top: 20px;
            }
            /* Add more specific styles as needed */
        </style>

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
    <h1>Your Product Information</h1>
    <%-- Check for success message attribute --%>

    <% 
        Buying buying = (Buying) request.getAttribute("buying");
    %>
    <div class="content">
        <table>
            <tr>
                <th>Admin User</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Image</th>
                <th>Category</th>
            </tr>
            <tr>
                <td><%=buying.getAdminUserName()%></td>
                <td><%=buying.getProductName()%></td>
                <td><%=buying.getQuantity()%></td>
                <td><%=buying.getPrice()%></td>
                <td><img src="<%=buying.getImage()%>" alt="alt"/></td>
                <td><%=buying.getCid().getCategoryName()%></td>
            </tr>
        </table>
            <a class="link" href="cid3?cid3=0">Continue to shopping</a>
    </div>
</body>

</html>
