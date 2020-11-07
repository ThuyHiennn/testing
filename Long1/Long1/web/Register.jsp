<%-- 
    Document   : Register
    Created on : Sep 24, 2020, 9:11:28 AM
    Author     : Nguyen Phat Tai - CE140527
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link rel="stylesheet" href="style.css">
    <body>
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
                        <h2>Register Form</h2><br>
                        <%if(request.getAttribute("duplicated") != null){%>
                            <h3><%=request.getAttribute("duplicated")%></h3>
                        <%}%>
                        <form action="Register">
                            Username:<input type="text" name="username" required/><br>
                            Password:<input type="password" name="password"required/><br>
                            User type:
                            <select name="type">
                                <option>Teacher</option>
                                <option>User</option>
                            </select><br>
                            Email:<input type="email" name="email" required/><br>

                            <input type="submit" value="Register"/>
                        </form>
                        <a href="index.jsp">Sign in</a>
                    </div>
                </div>
            </div>    
        </div>


    </body>
</html>
