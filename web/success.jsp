<%-- 
    Document   : success
    Created on : Oct 4, 2023, 11:48:48 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
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
            .content{
                margin-top: 20px;
                margin-left: 200px;
                
            }
            .content a{
                text-decoration: none;
                border: 1px solid black;
                color: white;
                background: red;
                border-radius: 5px;
                font-family: "Times New Roman", Times, serif;
                font-size: 20px;
                padding: 5px;
                font-weight: bold;
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
        Customer customer = (Customer) request.getAttribute("accountNew");
        %>
        <div class="content">
            <h1>Hello <%= customer.getUsername() %></h1>
            <h3>Welcome to your shopping interface.</h3>
            <a href="login.jsp">Please Login to continue Shopping</a>
        </div>
    </body>
</html>
