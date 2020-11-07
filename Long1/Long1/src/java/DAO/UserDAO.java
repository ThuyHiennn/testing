/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.connectDB;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author stulab
 */
public class UserDAO {
    public User getUser(String username, String password) {
        try {
            Connection conn = connectDB.getConnection();
            PreparedStatement st = conn.prepareStatement("Select * from user where Username=? and Password=?");
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setType(rs.getString("Type"));
                user.setEmail(rs.getString("Email"));
                return user;
            }
            else return null;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void registerUser(String user, String pass, String type, String email) {
        try {
            Connection conn = connectDB.getConnection();
            PreparedStatement st = conn.prepareStatement("Insert into user values(?,?,?,?)");
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3,type);
            st.setString(4, email);
            st.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static boolean checkDuplicatedID(String ID){
        try{
            Connection conn = connectDB.getConnection();
            PreparedStatement st = conn.prepareStatement("Select Username from user where Username=?");
            st.setString(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next()) return true;
            else return false;
        }catch(Exception e){
            e.printStackTrace();
            return true;
        }
    }
}
