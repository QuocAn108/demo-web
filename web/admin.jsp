<%-- 
    Document   : admin
    Created on : May 19, 2024, 5:57:53 PM
    Author     : lienm
--%>

<%@page import="java.util.List"%>
<%@page import="User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
                background: url('img/data.jpg')no-repeat;
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
            .search-text{
                width: 41px;
                border-radius: 10px;
                transition:0.2s
            }
            .search-text:hover{
                width: 40%;
                border-radius: 10px;
            }
            .button{
                border-radius: 10px;
                background: linear-gradient(to right,#30cfd0 ,#330867);
            }
            .button:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
            }
            .header-col p{
                color: white;
                font-size: large;
                padding: 11px;
                text-transform: uppercase;
            }
            .header-col h1{
                color: orange;
            }
            .header-col img{
                opacity: 0.6;
                height: 100px;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            .decoration-none{
                text-decoration: none;
                color: white;
            }
            .table-box{
                box-shadow: 0 0 5px darkblue;
                color: white;
                margin-top: 100px;
            }
            td input{
                background: transparent;
                color: white;
                padding: 5px;
                border-radius: 5px;
                opacity: 0.9;
            }
            td input:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
                opacity: 1;
            }
            th{
                border-radius: 5px;
                background: linear-gradient(to right,#30cfd0 ,#330867);
            }
            th:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
            }
            td{
                border-radius: 5px;
                background: linear-gradient(to right,#30cfd0 ,#330867);
                opacity: 0.9;
            }
            td:hover{
                background: linear-gradient(to right,#007adf , #00ecbc);
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <div class="header-col">
            <div class="flex">
                <img src="img/mini-hacker.jpg">
            </div>
            <div class="flex">
                <p>Welcome back Admin:</p>
                <h1><%= loginUser.getFullName()%></h1>
            </div>
            <form action="MainController">
                <div class="flex">
                    <input type="text" name="search" value="<%= search%>" class="search-text" placeholder="Search"/>
                    <input type="submit" name="action" value="Search" class="button"/>
                </div>
            </form>
            <form action="MainController" method="POST">
                <div class="flex">
                    <input type="submit" name="action" value="Logout" class="button"/>
                </div>
            </form>
        </div>
        <%
            List<UserDTO> listUser = (List) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <div class="flex">
            <table border="1" class="table-box" >
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Role ID</th>
                        <th>Password</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td>
                            <input type="text" name="userID" value="<%= user.getUserID()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                        </td>
                        <td><%= user.getPassword()%></td>
                        <!--detele o day ne-->
                        <td>
                            <a href="MainController?userID=<%= user.getUserID()%>&action=Delete&search=<%= search%>" class="button decoration-none">Delete</a>
                        </td>
                        <!--update i day ne-->  
                        <td>
                            <input type="submit" name="action" value="Update"class="button"/>
                            <input type="hidden" name="search" value="<%= search%>"/>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>

        <%
                }
            }
        %>
    </body>
</html>