/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;
import DAO.QuestionDAO;

/**
 *
 * @author stulab
 */
//public class Quiz {
//    private List<Question> questions;
//    private int current = 0;
//    private List<Question> listChoice;
//    
//    public Quiz(int n){
//        questions = QuestionDAO.getAllQuestion();
//        n = questions.size() - n;
//        while(n-- > 0){
//            int i = (int)(Math.random()*questions.size());
//            questions.remove(i);
//        }
//    }
//    
//    public Question getCurrentQ(){
//        return questions.get(current);
//    }
//    
//    public void next(int choice){
//        listChoice.set(current, choice);
//    }
//}
