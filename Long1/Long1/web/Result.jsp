<%-- 
    Document   : Result.jsp
    Created on : Oct 8, 2020, 2:37:41 PM
    Author     : Nguyen Phat Tai - CE140527
--%>

<%@page import="Model.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link rel="stylesheet" href="style.css">
    <style>
        .content {
            text-align: center; 
            margin:auto;
            width: 80%;
            background-color: #7575a3; 
            border: 2px solid red;
            height: 50px;
            font-size: 50px;
            font-weight: 600;
            padding: 20px;
        }

        .ques {
            border: 2px solid yellow; 
            width: 70%;
            margin: auto;
            position: relative;
            top: 50px;
        }
    </style>
    <body>
        <!--if account not teacher is cannot access this page-->
        <%User user = (User) request.getSession(false).getAttribute("user");%>
        <!--list contain correct questions-->
        <%ArrayList<Integer> listCorrectAnswer = (ArrayList<Integer>) request.getSession(false).getAttribute("listCorrectAnswer");%>
        <!--list contain question list-->
        <%ArrayList<Question> listQuestion = (ArrayList<Question>) request.getSession(false).getAttribute("newList");%>
        <%if (user == null) {
                response.sendRedirect("index.jsp");
            } else if (listCorrectAnswer == null) {
                response.sendRedirect("TakeQuiz.jsp");
            } else {%>
        <%request.getSession().removeAttribute("now");%>
        <%request.getSession().removeAttribute("minutes");%>
        <div class="top-box">
            <div class="menu navbar">
                <a href="index.jsp">Home</a>
                <a href="TakeQuiz.jsp">Take Quiz</a>
                <a href="MakeQuiz.jsp">Make Quiz</a>
                <a href="ManageQuiz.jsp">Manage Quiz</a>
                <a href="logoutController">Log out</a>
            </div>
            <!--show result-->
            <div class="container">
                <h2>Welcome <%=user.getUsername()%></h2><br>
                <div class="content">Result: <%=listCorrectAnswer.size()%>/<%=listQuestion.size()%> </div>

                <div class="ques">
                    
                    <TABLE BORDER="5"    WIDTH="100%" >
                        <TR>
                            <TH COLSPAN="2"><BR><H1>Statistic</H1>
                            </TH>
                        </TR>
                        <TR>
                            <TH>Question</TH>
                            <TH>Result</TH>
                        </TR>
                        <%for(Question i: listQuestion){%>
                            <TR ALIGN="CENTER">
                                <TD><%=i.getQuestion()%></TD>
                                <TD><%if(listCorrectAnswer.contains(i.getID())){%>
                                    CORRECT
                                <%}else{%>
                                    INCORRECT
                                <%}%></TD>
                            </TR>
                        <%}%>
                    </TABLE>
                    
                </div>
            </div>    
        </div>
        <%}%>

    </body>
</html>
