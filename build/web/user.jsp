<%-- 
    Document   : user.jsp
    Created on : May 19, 2024, 11:21:42 PM
    Author     : lienm
--%>

<%@page import="java.util.List"%>
<%@page import="Product.ProductDTO"%>
<%@page import="User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
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
                background: url('img/hacker4.jpg')no-repeat;
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
            .header-col p{
                color: buttonface;
                font-size: large;
                padding: 11px;
                text-transform: uppercase;
                font-weight: bold;
            }
            .header-col h1{
                color: orange;
            }
            td input{
                background: linear-gradient(to right,#30cfd0 ,#330867);
                color: white; 
                padding: 10px;
                border-color:#001b48; 
                transition: 0.4s;
            }
            td input:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
                opacity: 0.9;
                color: blue;
            }
            th{
                background: linear-gradient(to right,#30cfd0 ,#330867);
                color: white; 
                border-color:#001b48; 
                transition: 0.4s;
            }
            th:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
                opacity: 0.9;
                color: blue;
            }
            td{
                background: linear-gradient(to right,#30cfd0 ,#330867);
                color: white; 
                border-color:#001b48; 
                transition: 0.4s;
            }
            td:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
                opacity: 0.9;
                color: blue;
            }
            .table-box{
                box-shadow: 0 0 50px #2495bf;
                color: white;
                margin-top: 100px;
                border-color: #73c6d9;
            }
            .button{
                border-radius: 10px;
                background: linear-gradient(to right,#30cfd0 ,#330867);
                transition: 0.4s;
            }
            .button:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
            }
            .header-col img{
                opacity: 0.7;
                height: 100px;
                margin-top: 10px;
                margin-bottom: 10px;
                border-radius: 50px;
            }
            .noti{
                background-color: darkblue;
                color: white;
                margin-top: 15px;
                font-size: large;
                font-weight: bold;
                text-transform: uppercase;
                opacity: 0.5;
                transition: 0.5s;
            }
            .noti:hover{
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="header-col">
            <div class="flex">
                <img src="img/hacker6.png">
            </div>
            <div class="flex">
                <p>Welcome back user: </p>
                <h1><%= loginUser.getFullName()%></h1>
            </div>
        </div>
        <form action="MainController" method="POST">
            <div class="flex">
                <div class="header-col">
                    <input type="submit" name="action" value="Logout" class="button"/>
                    <input type="submit" name="action" value="ViewCart" id="viewcart" class="button"/>
                    <input class="button" type="submit" name="action" value="Search All Book"/>
                </div>
            </div>
            <%
                List<ProductDTO> list = (List) session.getAttribute("listProduct");
                if (list != null) {
            %>
            <div class="flex">
                <table border="1" class="table-box">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>SKU</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (ProductDTO i : list) {
                        %>
                    <form action="MainController" method="GET">
                        <tr>
                            <td><%= count++%></td>
                            <td>
                                <input type="text" name="SKU" value="<%= i.getSKU()%>" readonly=""/>
                            </td>
                            <td>
                                <input type="text" name="Name" value="<%= i.getName()%>" required=""/>
                            </td>
                            <td>
                                <input type="text" name="Price" value="<%= i.getPrice()%>" required=""/>
                            </td>
                            <td>
                                <input type="text" name="Description" value="<%= i.getDescription()%>" required=""/>
                            </td>
                            <td>
                                <input type="submit" value="AddToCart" name="action" class="button"/>  
                            </td>
                        </tr>
                    </form>           

                    <%
                            }
                        }
                    %>


                    </tbody>
                </table>

            </div>
        </form>
        <div class="flex noti">
            <%
                String message = (String) session.getAttribute("MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <%= message%>   
        </div>
    </form

</body>
</html>
