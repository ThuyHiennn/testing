<%-- 
    Document   : index
    Created on : Sep 24, 2020, 8:53:59 AM
    Author     : Nguyen Phat Tai - CE140527
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
    </head>
    <link rel="stylesheet" href="style.css">
    <body>
        
        <%User user = (User) request.getSession(false).getAttribute("user");%>
        <%String invalid = (String) request.getAttribute("invalid");%>
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
                        <%if (user == null) {%>
                        <h2>Login Form</h2>

                        <div>
                            <form action="loginController">
                                <%if(invalid != null){%>
                                    <span style="color: red; font-size: 20px;"><%=invalid%></span><br>
                                <%}%>
                                Username: <input type="text" name="u"/><br>
                                Password: <input type="password" name="p"/><br>
                                <input type="submit" value="Sign in"/><a href="Register.jsp">Register</a>
                            </form>
                        </div>
                        <%} else {%>
                        <h2>Welcome <%=user.getUsername()%></h2>
                        <form action="logoutController">
                            <input type="submit" value="Sign out"/>
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>    
        </div>
    </body>
</html>
