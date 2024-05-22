<%-- 
    Document   : Notification
    Created on : May 19, 2024, 10:32:35 PM
    Author     : lienm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: 'poppins', sans-serif;
            }

            section {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 100%;

                background: url('img/lightbulb.jpg')no-repeat;
                background-position: center;
                background-size: cover;
            }

            .form-box {
                position: relative;
                width: 500px;
                height: 550px;
                background: transparent;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            h1 {
                color: rgb(47, 180, 237);
                font-size: xx-large;
            }
            .button {
                width: 100%;
                height: 40px;
                background: linear-gradient(to right, #30cfd0, #330867);
                border: none;
                outline: none;
                cursor: pointer;
                font-size: 1em;
                font-weight: 600;
                text-decoration: none;
                color: azure;
            }
        </style>
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="wrapper">
                    <h1>Register Successfully!!!</h1>
                    <a href="login.jsp" class="button">Click here to back login page</a> 
                </div>
            </div>
        </section>
    </body>
</html>
