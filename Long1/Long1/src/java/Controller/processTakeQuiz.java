/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Question;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author stulab
 */
public class processTakeQuiz extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
            if (session.getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
            } else {
                // contain index of question in list takeQuiz
                int numofQ;
                String temp = request.getParameter("numofQ");
                if (temp == null) {
                    numofQ = 0;
                } else {
                    numofQ = Integer.parseInt(temp);
                }

                // variable is used to store number of correct questions
                int correct;
                String temp2 = request.getParameter("correct");
                if (temp2 == null) {
                    correct = 0;
                } else {
                    correct = Integer.parseInt(temp2);
                }

                // get list to takeQuiz from session
                ArrayList<Question> newList = (ArrayList<Question>) request.getSession(false).getAttribute("newList");
                // case if take all Quiz in list
                if (numofQ == newList.size()) {
                    String answerDB = newList.get(numofQ - 1).getAnswer();
                    //check correct and send to Result page
                    String choice = request.getParameter("answer");
                    if (choice.equals(answerDB)) {
                        correct++;
                        ArrayList<Integer> list = (ArrayList<Integer>) request.getSession(false).getAttribute("listCorrectAnswer");
                        list.add(newList.get(numofQ - 1).getID());
                        session.setAttribute("listCorrectAnswer", list);
                    }
                    response.sendRedirect("Result.jsp");
                } // case if index = 0, don't check correct question
                else if (numofQ == 0) {
                    //lay thang vi tri thu 0
                    Question question = newList.get(numofQ);
                    request.setAttribute("numofQ", numofQ);
                    request.setAttribute("correct", correct);
                    request.setAttribute("question", question);
                    request.getRequestDispatcher("takeQuiz2.jsp").forward(request, response);
                } else {
                    String answerDB = newList.get(numofQ - 1).getAnswer();
                    String choice = request.getParameter("answer");
                    if (choice.equals(answerDB)) {
                        correct++;
                        ArrayList<Integer> list = (ArrayList<Integer>) request.getSession(false).getAttribute("listCorrectAnswer");
                        list.add(newList.get(numofQ - 1).getID());
                        session.setAttribute("listCorrectAnswer", list);
                    }
                    Question question = newList.get(numofQ);

                    request.setAttribute("numofQ", numofQ);
                    request.setAttribute("correct", correct);
                    request.setAttribute("question", question);
                    request.getRequestDispatcher("takeQuiz2.jsp").forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
