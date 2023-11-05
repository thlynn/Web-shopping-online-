<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Page</title>
    <style>
        body {
            background-color: #ffeaa7;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 10px;
        }
        .header img {
            width: 100px;
            border-radius: 50%;
            margin-left: 50px;
            margin-bottom: 10px;
        }
        .header p {
            padding-right: 50px;
            font-size: 20px;
        }
        .header input {
            width: 200px;
            height: 25px;
            margin-right: 10px;
        }
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px;
            margin-right: 50px;
        }
        .styled-table th, .styled-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
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
        .note {
            text-decoration: none;
            font-size: 20px;
            background-color: yellow;
            border: 2px solid black;
            border-radius: 5px;
            margin-left: 200px;
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
    <c:set var="listCart" value="${requestScope.orderNew}" />
    <c:choose>
        <c:when test="${empty listCart}">
            <p>No items</p>
        </c:when>
        <c:otherwise>
            <table class="styled-table">
                <tr>
                    <th>STT</th>
                    <th>Ten khach hang</th>
                    <th>Ten san pham</th>
                    <th>Dia chi khach hang</th>
                    <th>So dien thoai</th>
                    <th>So luong</th>
                    <th>Don gia</th>
                    <th>Tong don hang</th>
                </tr>
                <c:forEach var="order" items="${listCart}" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.index + 1}" /></td>
                        <td><c:out value="${order.getCustomerName()}" /></td>
                        <td><c:out value="${order.getProductName()}" /></td>
                        <td><c:out value="${order.getCustomerAddress()}" /></td>
                        <td><c:out value="${order.getPhoneNumber()}" /></td>
                        <td><c:out value="${order.getQuantity()}" /></td>
                        <td><c:out value="${order.getUnitPrice()}" /></td>
                        <td><c:out value="${order.getTotalPrice()}" /></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <a href="cid2?cid2=0" class="note">Continue shopping online.</a>
</body>
</html>
