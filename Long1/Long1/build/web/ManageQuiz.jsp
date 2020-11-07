<%-- 
    Document   : ManageQuiz
    Created on : Sep 24, 2020, 9:04:12 AM
    Author     : Nguyen Phat Tai - CE140527
--%>

<%@page import="DAO.QuestionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Question"%>
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
        <!--check session if user haven't login will redirect to index-->
        <%User user = (User)request.getSession(false).getAttribute("user");%>     
        <%if(user == null) {
            response.sendRedirect("index.jsp");
        }else {%>
            <div class="top-box">
                <div class="menu navbar">
                    <a href="index.jsp">Home</a>
                    <a href="TakeQuiz.jsp">Take Quiz</a>
                    <a href="MakeQuiz.jsp">Make Quiz</a>
                    <a href="ManageQuiz.jsp">Manage Quiz</a>
                    <a href="logoutController">Log out</a>
                </div>
                <!--if account not teacher is cannot access this page-->
                <%if(user.getType().equals("User")) {%>
                <h2>You cannot access to this web page</h2>
                <%}else {%>
                <!--List contain question list-->
                <%ArrayList<Question> qList = (ArrayList<Question>)QuestionDAO.getAllQuestionByTeacher(user.getUsername());%>
                
                <div class="container">
                    <div class="pair">
                        Number of questions: <%=qList.size()%><br><br>
                        <div class="question">
                            <span>Question</span>
                        </div>
                        <span class="created">Created</span>
                    </div>
                        
                    <%for (int i=0; i<qList.size(); i++){%>
                    <div class="pair">
                        <div class="question">
                            <span><%=(i+1)%>. <%=qList.get(i).getQuestion()%></span>
                        </div>
                        <span class="created"><%=qList.get(i).getDate()%></span>
                    </div>
                    <%}%>
                </div>    
            </div>
            <%}%>
        <%}%>
    </body>
</html>