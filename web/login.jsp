<%-- 
    Document   : login
    Created on : Oct 4, 2023, 10:43:41 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body{
                background-color: #ffeaa7;
            }
            .loginForm{
                background-color: #fab1a0;
                border: 1px solid black;
                border-radius: 2px;
                padding: 5px;
                position: absolute;
                margin-left: 500px;
                margin-top: 150px
            }
            h1{
                font-weight: bold;
                text-align: center
            }
            form{
                margin-bottom: 20px
            }
            form input{
                margin: 10px;
            }
            .button{
                margin-left: 100px;
                width: 100px
            }
            .bottom a{
                font-size: 20px;
                color: #273c75;
                text-decoration: none;
            }
            .bottom img{
                width:  50px;
                position: absolute;
            }
        </style>
    </head>
    <body>
        <div class="loginForm">
            <h1>Login Form</h1>
            <h3 style="color: red">${requestScope.error}</h3>
            <form action="login" method="post"> 
                Enter username: <input type="text" name="user" required/><br/>
                Enter password: <input type="password" name="pass" required/><br/>
                <input class="button" type="submit" name="LOGIN"/><br/>
            </form>
            <div class="bottom">
                <a href="signup.jsp">Do you have an account. Register here!</a>
                <img src="image/click.png" alt="alt"/>
            </div>
        </div>
    </body>
</html>
