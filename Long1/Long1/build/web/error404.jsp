<%-- 
    Document   : error404
    Created on : Oct 15, 2020, 9:04:25 AM
    Author     : Nguyen Phat Tai - CE140527 khong con nua dau ma kim has ha ha
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link rel="stylesheet" href="style.css">
    <body>
        <!--if user haven't login will redirect to index-->
        <%User user = (User) request.getSession(false).getAttribute("user");%>
        <%if(user == null){
            response.sendRedirect("index.jsp");
        }%>
        <div class="top-box">
            <div class="menu navbar">
                <a href="index.jsp">Home</a>
                <a href="TakeQuiz.jsp">Take Quiz</a>
                <a href="MakeQuiz.jsp">Make Quiz</a>
                <a href="ManageQuiz.jsp">Manage Quiz</a>
                <a href="logoutController">Log out</a>
            </div>

            <div class="container">
                <div class="pair">
                    <div class="question">
                        <h2>Didn't found this URL page !!!</h2>
                    </div>
                </div>
            </div>    
        </div>
    </body>
</html>
