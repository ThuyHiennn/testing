<%-- 
    Document   : MakeQuiz
    Created on : Sep 24, 2020, 9:03:42 AM
    Author     : Nguyen Phat Tai - CE140527
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
        <!-- check Session if user not login will redirect to index-->
        <%User user = (User) request.getSession(false).getAttribute("user");%>
        <%String fill = (String) request.getAttribute("fill");%>
        <%if (user == null) {
                response.sendRedirect("index.jsp");
            } else {%>
        <!--menu bar-->    
        <div class="top-box">
            <div class="menu navbar">
                <a href="index.jsp">Home</a>
                <a href="TakeQuiz.jsp">Take Quiz</a>
                <a href="MakeQuiz.jsp">Make Quiz</a>
                <a href="ManageQuiz.jsp">Manage Quiz</a>
                <a href="logoutController">Log out</a>
            </div>
            <%if (user.getType().equals("User")) {%>
            <h2>You cannot access to this web page</h2>
            <%} else {%>
            <!-- create quiz -->
            <div class="container">
                <div class="pair">
                    <div class="question">
                        <form action="makeQuiz">
                            Question: <input style="height: 100px; width: 100%; font-size:14px;" type="text" name="question"/><br>
                            Option1: <input style="height: 50px; width: 100%; font-size:14px;" type="text" name="option1"/><br>
                            Option2: <input style="height: 50px; width: 100%; font-size:14px;" type="text" name="option2"/><br>
                            Option3: <input style="height: 50px; width: 100%; font-size:14px;" type="text" name="option3"/><br>
                            Option4: <input style="height: 50px; width: 100%; font-size:14px;" type="text" name="option4"/><br>
                            Answer(s): 
                            <br>
                            <input type="radio" value="1" name="check" checked="checked"/>
                            <label>Option 1</label>
                            <input type="radio" value="2" name="check"/>
                            <label>Option 2</label>
                            <input type="radio" value="3" name="check"/>
                            <label>Option 3</label>
                            <input type="radio" value="4" name="check"/>
                            <label>Option 4</label>
                            <input type="hidden" value="<%=user.getUsername()%>" name="created"/>
                            <input type="submit" value="Create"/>
                        </form>
                            <%if(fill != null){%>
                                <h3 style="color:red;"><%=fill%></h3>
                            <%}%>
                    </div>
                </div>
            </div>    
        </div>

        <%}
           
        }%>
    </body>
</html>
