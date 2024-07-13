package suppliermanagement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
import java.util.*;
import java.sql.*;

public class category {
    
    //fields of suppliers
    public int    categoryid;
    public String categoryname;
    public String description;
    
    //list of suppliers
    public ArrayList<Integer>  category_idlist     = new ArrayList<> ();
    public ArrayList<String>   category_namelist   = new ArrayList<> ();
    public ArrayList<String>   description_list    = new ArrayList<> ();
    
    public category () {
        
    }
    
    public int getCategory() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT categoryid, categoryname FROM category");
            ResultSet rst = pstmt.executeQuery();
            
            category_idlist.clear();
            category_namelist.clear();
            
            
            while(rst.next()) {
                categoryid = rst.getInt("categoryid");
                categoryname = rst.getString("categoryname");
                
                category_idlist.add(categoryid);
                category_namelist.add(categoryname);
            }
            
            pstmt.close();
            conn.close();
            //ResultSet rst = pstmt.executeQuery(); //error
            
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; //register failed
        }
    }
    
    public static void main(String args[]) {
        category C = new category();
        /*A.lastname = "Uy";
        A.register_supplier();*/
        
        C.getCategory();
        for (int i = 0; i < C.category_idlist.size();i++){
            System.out.print(C.category_idlist.get(i));
            System.out.println(" : " + C.category_namelist.get(i));
        }
    }
}