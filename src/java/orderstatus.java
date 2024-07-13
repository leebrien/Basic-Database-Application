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

public class orderstatus {
    
    public int    orderstatusid;
    public String description;
    
    public ArrayList<Integer>  orderstatus_idlist     = new ArrayList<> ();
    public ArrayList<String>   description_list    = new ArrayList<> ();
    
    public orderstatus () {
        
    }
    
    public int getOrderStatus() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT orderstatusid, description FROM orderstatus o WHERE o.orderstatusid != 4 AND o.orderstatusid != 3");
            ResultSet rst = pstmt.executeQuery();
            
            orderstatus_idlist.clear();
            description_list.clear();
            
            
            while(rst.next()) {
                
                orderstatusid = rst.getInt("orderstatusid");
                description = rst.getString("description");
                
                orderstatus_idlist.add(orderstatusid);
                description_list.add(description);
                
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
        
    }
}