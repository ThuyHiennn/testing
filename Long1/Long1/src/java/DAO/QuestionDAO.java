/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.connectDB;
import Model.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author stulab
 */
public class QuestionDAO {
    public void addQuestion(String ques, String op1, String op2, String op3, String op4, String ans, String created, String date){
        try {
            Connection conn = connectDB.getConnection();
            PreparedStatement st = conn.prepareStatement("Insert into question(`Question`, `Option1`, `Option2`, `Option3`, `Option4`, `Answer`, `Created`, `Date`) values(?,?,?,?,?,?,?,?)");
            st.setString(1, ques);
            st.setString(2, op1);
            st.setString(3, op2);
            st.setString(4, op3);
            st.setString(5, op4);
            st.setString(6, ans);
            st.setString(7, created);
            st.setString(8, date);
            st.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static List<Question> getAllQuestionByTeacher(String teacher) {
        try {
            List<Question> list = new ArrayList<Question>();
            Connection conn = connectDB.getConnection();
            PreparedStatement st = conn.prepareStatement("Select * from question where created=?");
            st.setString(1, teacher);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add(new Question(rs.getInt("ID"), 
                        rs.getString("Question"), 
                        rs.getString("Option1"), 
                        rs.getString("Option2"), 
                        rs.getString("Option3"), 
                        rs.getString("Option4"), 
                        rs.getString("Answer"), 
                        rs.getString("Created"),
                        rs.getString("Date")));
            }
            return list;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static List<Question> getAllQuestion() {
        try {
            List<Question> list = new ArrayList<Question>();
            Connection conn = connectDB.getConnection();
            PreparedStatement st = conn.prepareStatement("Select * from question");
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add(new Question(rs.getInt("ID"), 
                        rs.getString("Question"), 
                        rs.getString("Option1"), 
                        rs.getString("Option2"), 
                        rs.getString("Option3"), 
                        rs.getString("Option4"), 
                        rs.getString("Answer"), 
                        rs.getString("Created"),
                        rs.getString("Date")));
            }
            return list;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
