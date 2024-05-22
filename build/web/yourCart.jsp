<%-- 
Document   : yourCart
Created on : May 15, 2024, 1:18:58 PM
Author     : lienm
--%>

<%@page import="Product.ProductDTO"%>
<%@page import="Product.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                font-family: 'poppins',sans-serif;
            }
            body{
                /*                display: flex;
                                justify-content: center;
                                align-items: center;*/
                min-height: 100vh;
                width: 100%;
                background: url('img/hacker2.jpg')no-repeat;
                background-position: center;
                background-size: cover;

            }
            .flex{
                display: flex;  
                justify-content: center;
            }
            .header-col{
                flex-direction: column;
            }
            .header-col h1{
                color: orange;
            }
            .header-col a{
                text-decoration: none;
                color: greenyellow;
                font-weight: bold;
            }
            .button{
                border-radius: 5px;
                background: linear-gradient(to right,#434343, black);
            }
            .button:hover{
                background: linear-gradient(to right,#d7d2cc,#304352);
            }
            td input{
                background: linear-gradient(to right,#434343, black);
                color: white; 
                padding: 10px;
                border-color:#001b48; 
            }
            td input:hover{
                background: linear-gradient(to right,#d7d2cc,#304352);
                opacity: 0.9;
                color: green;
            }
            td{
                background: linear-gradient(to right,#434343, black);
                color: white; 
                border-color:#001b48; 
            }
            td:hover{
                background: linear-gradient(to right,#d7d2cc,#304352);
                opacity: 0.9;
                color: green;
            }
            th{
                background: linear-gradient(to right,#434343, black);
                color: white; 
                border-color:#001b48; 
            }
            th:hover{
                background: linear-gradient(to right,#d7d2cc,#304352);
                opacity: 0.9;
                color: green;
            }
            .table-box{
                box-shadow: 0 0 50px #2495bf;
                color: white;
                margin-top: 200px;
                border-color: #73c6d9;
            }
            .noti{
                color: white;
                margin-top: 20px;
                font-size: large;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="header-col">
            <div class="flex">
                <h1>Your Cart:</h1>
            </div>
            <div class="flex">
                <a href="user.jsp" class="button">Add more</a>
            </div>
        </div>
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
        %>
        <div class="flex">
            <table border="1" class="table-box">
                <thead>
                    <tr>
                        <th>SKU</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double total = 0;
                        for (ProductDTO p : cart.getCart().values()) {
                            total += p.getPrice() * p.getQuantity();
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td> 
                            <input type="text" name="SKU" value="<%= p.getSKU()%>" readonly=""/>
                        </td>
                        <td><%= p.getName()%></td>
                        <td>
                            <input type="number" min="1" name="quantity" value="<%= p.getQuantity()%>" required=""/>
                        </td>
                        <td><%= p.getPrice()%>$</td>
                        <td><%= p.getPrice() * p.getQuantity()%>$</td>
                        <td>
                            <input type="submit" name="action" value="Remove" class="button"/>
                        </td>
                    </tr>
                </form>

                <%
                    }
                %>

                </tbody>
            </table>
        </div>

        <div class="flex noti">
            <h1>Total: <%= total%> $  </h1>    
        </div>  
        <%
            }
        %>

    </body>
</html>
