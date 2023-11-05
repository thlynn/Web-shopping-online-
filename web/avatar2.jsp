<%-- 
    Document   : avatar2
    Created on : Oct 25, 2023, 11:41:31 PM
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
            .content{
                margin-top: 100px;
                margin-left: 400px;
                margin-right: 500px;
                border: 2px black solid;
                border-radius: 2px;
                background-color: yellow;
                padding: 20px
            }
            .content p{
                font-size: 20px;
                font-weight: bold;
            }
            .content img{
                width: 70px;
                margin-top: 10px;
                border-radius: 50%;
                border: 2px solid black;
            }
            .content-avatar{
                display: flex;
                margin-bottom: 20px
            }
            .content-avatar p{
                padding-top: 20px;
            }
            .content a{
                text-decoration: none;
                color: red;
                font-weight: bold;
                
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
        <div class="content">
            <p>Your Name: ${sessionScope.account.getCustomerName()}</p>
            <div class="content-avatar">
                <p>Your avatar:</p> <img src="image/avatar.jpg"/><br/>
            </div>
            <a href="allorder">1. Xem don mua cua ban</a><br/>
            <a class="logout" href="home.jsp">2. Log out</a><br/>
            <a href="cid2?cid2=0">3. CONTINUE TO BACK HOME PAGE TO SHOPPING</a><br/>
            <a href="get">4.Don ban hang cua ban</a>
        </div>
            
    </body>
</html>
