<%-- 
    Document   : takeQuiz2
    Created on : Oct 1, 2020, 10:43:05 AM
    Author     : Nguyen Phat Tai - CE140527
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Question"%>
<%@page import="DAO.QuestionDAO"%>
<%@page import="DAO.QuestionDAO"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .welcome {
            padding-left: 50px;
            width: 30%;
            font-size: xx-large;
            font-weight: 600;
        }
        
        .time {
           
            width: 30%;
        }
        
        .content {
            display: flex;
            justify-content: space-between;
            width: 80%;
            margin: auto;
        }
        
        .question {
            width: 500px;
            margin-left: 150px;
        }
    </style>
    <link rel="stylesheet" href="style.css">
    <body>

        <%User user = (User) request.getSession(false).getAttribute("user");%>
        <%Question question = (Question) request.getAttribute("question");%>
        <%int numofQ = (int) request.getAttribute("numofQ");%>
        <%int correct = (int) request.getAttribute("correct");%>
        <%if (user == null) {
                response.sendRedirect("index.jsp");
            } else {%>
        <div class="top-box">
            <div class="menu navbar">
                <a href="index.jsp">Home</a>
                <a href="TakeQuiz.jsp">Take Quiz</a>
                <a href="MakeQuiz.jsp">Make Quiz</a>
                <a href="ManageQuiz.jsp">Manage Quiz</a>
                <a href="logoutController">Log out</a>
            </div>
            <div class="content">
                <div class="welcome">
                    Welcome
                </div>
                <div class="time">
                    Time remaining <span style="color:red;" id="demo"></span>
                </div>
            </div>
            <div class="question">
                <form action="processTakeQuiz">
                    <p style="margin-top: 20px;">
                        Question: <%=question.getQuestion()%><br>
                        <input type="radio" name="answer" checked="checked" value="<%=question.getOption1()%>"><%=question.getOption1()%><br>
                        <input type="radio" name="answer" value="<%=question.getOption2()%>"><%=question.getOption2()%><br>
                        <input type="radio" name="answer" value="<%=question.getOption3()%>"><%=question.getOption3()%><br>
                        <input type="radio" name="answer" value="<%=question.getOption4()%>"><%=question.getOption4()%><br>
                    </p>
                    <input type="hidden" name="numofQ" value="<%=numofQ+1%>">
                    <input type="hidden" name="correct" value="<%=correct%>">
                    <div style="float:right;width: 200px;">
                            <button type="submit">Next</button>
                    </div>
                </form>
            </div>
        </div>

        <%}%>
    </body>
    <%int seconds = (int)request.getSession(false).getAttribute("left");%>
<script>
    var left = <%=seconds%>;
    function time(){
        left--;
        var mm = Math.floor(left / 60);
        var sss = left - mm * 60;
        document.getElementById("demo").textContent = mm+'m'+sss+'s';
        fetch("TimeProcess");
        if(left <= 0) {
            location.href = "Result.jsp";
        }
    }
    time();
    setInterval(time, 1000);
</script>
</html>
