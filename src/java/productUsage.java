/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
package suppliermanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class productUsage {

    public boolean isProductUsed(int productId) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            // Example: Check if the product is used in the orders table
            String sql = "SELECT COUNT(*) AS count FROM inventory WHERE productid = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0; // If count is greater than 0, the product is used
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return false; // Default to false if an exception occurs
    }
    
    public static void main(String args[]) {
        
        productUsage example = new productUsage();
        
        int number = 1000;
        boolean answer = example.isProductUsed(1000);
        
        System.out.println(answer);
               
    
    }
}


