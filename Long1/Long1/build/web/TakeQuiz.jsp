<%-- 
    Document   : TakeQuiz
    Created on : Sep 24, 2020, 9:04:43 AM
    Author     : Nguyen Phat Tai - CE140527
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Question"%>
<%@page import="DAO.QuestionDAO"%>
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
        <!--if user haven't login will redirect to index.jsp-->
        <%User user = (User) request.getSession(false).getAttribute("user");%>
        
        <%if (user == null) {
                response.sendRedirect("index.jsp");
            } else {%>
        <!--list contain all number of questions-->
        <%ArrayList<Question> qList = (ArrayList<Question>) QuestionDAO.getAllQuestion();%>
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
                        <h2>Welcome <%=user.getUsername()%></h2><br>
                        <p>
                            Enter number of questions: 
                        </p>
                        <form action="takeQuiz">
                            <input style="width:200px;" type="number" min="1" max="<%=qList.size()%>" name="question"/><input type="submit" value="Start"/>
                        </form>
                    
                    </div>
                </div>
            </div>    
        </div>

        <%}%>
    </body>
    
</html>