<%-- 
    Document   : cart3
    Created on : Oct 22, 2023, 11:49:29 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cart" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .styled-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0; /* Add margin for spacing */
            }

            .styled-table th, .styled-table td {
                border: 1px solid #ddd;
                padding: 10px; /* Add padding for better spacing */
                text-align: center; /* Center-align text */
            }

            .styled-table th {
                background-color: #f2f2f2;
            }

            .styled-table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .styled-table tr:hover {
                background-color: #ddd;
            }

            /* Add styles for specific columns if needed */
            .styled-table th:nth-child(1),
            .styled-table td:nth-child(1) {
                font-weight: bold;
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
        <c:set var="listCart" value="${requestScope.list}" />
        <c:choose>
            <c:when test="${empty listCart}">
                <p>No items</p>
            </c:when>
            <c:otherwise>
                <table class="styled-table">
                    <tr>
                        <th>STT</th>
                        <th>Ten san pham</th>
                        <th>So luong</th>
                        <th>Don gia</th>
                        <th>Tong don hang</th>
                        <th>Choose</th>
                    </tr>
                    <c:forEach var="cart" items="${listCart}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${cart.productName}</td>
                            <td>${cart.quantity}</td>
                            <td>${cart.unitPrice}</td>
                            <td>${cart.totalPrice}</td>
                            <td>
                                <form action="delete" method="post">
                                    <input type="hidden" name="itemID" value="${cart.cartID}">
                                    <input type="submit" value="Delete"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>

        <a href="cid2?cid2=0" class="note">Continue shopping online.</a>
    </body>
</html>
