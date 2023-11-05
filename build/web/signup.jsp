<%-- 
    Document   : signup
    Created on : Oct 4, 2023, 11:50:16 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-color: #ffeaa7;
            }
            .singupForm{
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
            .bottom img{
                width:  50px;
                position: absolute;
                margin-left: 300px
            }
        </style>
    </head>
    <body>
        <div class="singupForm">
            <h1>Sign up Form</h1>
            <h3 style="color: red">${requestScope.error}</h3>
            <form action="signup" method="post">
                Username: <input type="text" name="user" required><br>
                Password: <input type="password" name="pass" required><br>
                Your Full Name: <input type="text" name="name" required><br>
                Role (admin or user): <input type="text" name="role" required><br>
                <input class="button" type="submit" value="Sign up">
            </form>
            <div class="bottom">
                <img src="image/click.png" alt="alt"/>
            </div>
        </div>
    </body>
</html>
