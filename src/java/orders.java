/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package suppliermanagement;

/**
 *
 * @author ccslearner
 */
import java.util.*;
import java.sql.*;

public class orders {
    
    public int    orderid;
    public int    productid;
    public int    productquantity;
    public int    supplierid;
    public String dateacknowledged;
    public String dateshipped;
    public int    orderstatusid;
    public String productcategory;
    //public int    datediff;
    
    public ArrayList<Integer>  order_idlist     = new ArrayList<> ();
    public ArrayList<Integer>  product_idlist     = new ArrayList<> ();
    public ArrayList<Integer>  productquantity_list     = new ArrayList<> ();
    public ArrayList<Integer>  supplier_idlist     = new ArrayList<> ();
    public ArrayList<String>   dateack_list    = new ArrayList<> ();
    public ArrayList<String>   dateshi_idlist      = new ArrayList<> ();
    public ArrayList<Integer>  orderstatus_idlist     = new ArrayList<> ();
    public ArrayList<orders>   order_list               = new ArrayList<orders>();
    
    public orders () {
        
    }
    
    public ArrayList<orders> checkOrders(boolean sFLag, boolean pFlag, boolean daFlag, boolean dsFlag, String supplierid, String productid,
                                        String dateacknowledged, String dateshipped) {
        try {Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            order_list.clear();
            
            PreparedStatement pstmt = conn.prepareStatement("");
            if (sFLag==true && pFlag==true && daFlag==true && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND productid=? AND dateacknowledged=? AND dateshipped=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, productid);
                pstmt.setString(3, dateacknowledged);
                pstmt.setString(4, dateshipped);
            }
            if (sFLag==true && pFlag==true && daFlag==true && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND productid=? AND dateacknowledged=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, productid);
                pstmt.setString(3, dateacknowledged);
            } 
            if (sFLag==true && pFlag==true && daFlag==false && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND productid=? AND dateshipped=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, productid);
                pstmt.setString(3, dateshipped);
            } 
            if (sFLag==true && pFlag==true && daFlag==false && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND productid=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, productid);
            } 
            if (sFLag==true && pFlag==false && daFlag==true && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND dateacknowledged=? AND dateshipped=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, dateacknowledged);
                pstmt.setString(3, dateshipped);
            }
            if (sFLag==true && pFlag==false && daFlag==true && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND dateacknowledged=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, dateacknowledged);
            }
            if (sFLag==true && pFlag==false && daFlag==false && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=? AND dateshipped=?");
                pstmt.setString(1, supplierid);
                pstmt.setString(2, dateshipped);
            }
            if (sFLag==true && pFlag==false && daFlag==false && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE supplierid=?");
                pstmt.setString(1, supplierid);
            }
            if (sFLag==false && pFlag==true && daFlag==true && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE productid=? AND dateacknowledged=? AND dateshipped=?");
                pstmt.setString(1, productid);
                pstmt.setString(2, dateacknowledged);
                pstmt.setString(3, dateshipped);
            }
            if (sFLag==false && pFlag==true && daFlag==true && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE productid=? AND dateacknowledged=?");
                pstmt.setString(1, productid);
                pstmt.setString(2, dateacknowledged);
            }
            if (sFLag==false && pFlag==true && daFlag==false && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE productid=? AND dateshipped=?");
                pstmt.setString(1, productid);
                pstmt.setString(2, dateshipped);
            }
            if (sFLag==false && pFlag==true && daFlag==false && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE productid=?");
                pstmt.setString(1, productid);
            }
            if (sFLag==false && pFlag==false && daFlag==true && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE dateacknowledged=? AND dateshipped=?");
                pstmt.setString(1, dateacknowledged);
                pstmt.setString(2, dateshipped);
            }
            if (sFLag==false && pFlag==false && daFlag==true && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE dateacknowledged=?");
                pstmt.setString(1, dateacknowledged);
            }
            if (sFLag==false && pFlag==false && daFlag==false && dsFlag==true) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p WHERE dateshipped=?");
                pstmt.setString(1, dateshipped);
            }if (sFLag==false && pFlag==false && daFlag==false && dsFlag==false) {
                pstmt = conn.prepareStatement("SELECT * FROM orders o JOIN products p");
            }
            
            
            ResultSet rst = pstmt.executeQuery();
        
            while(rst.next()) {
                orders thisOrder = new orders();
                
                thisOrder.supplierid = rst.getInt("supplierid");
                thisOrder.productid = rst.getInt("productid");
                thisOrder.productcategory = rst.getString("productcategory");
                thisOrder.productquantity = rst.getInt("productquantity");
                thisOrder.orderid = rst.getInt("orderid");
                thisOrder.dateacknowledged = rst.getString("dateacknowledged");
                thisOrder.dateshipped = rst.getString("dateshipped");
                thisOrder.orderstatusid = rst.getInt("status");
                order_list.add(thisOrder);
            }
            
            pstmt.close();
            conn.close();
            
            return order_list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return order_list;
        }
    }
    
    public int completeOrder(int orderId, String dateShipped) {
    try {
        Connection conn;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

        // Update order status to 3
        String updateQuery = "UPDATE orders SET orderstatusid = 3 WHERE orderid=?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setInt(1, orderId);

        int rowsUpdated = pstmt.executeUpdate();
        pstmt.close();

        // Check if the update was successful
        if (rowsUpdated > 0) {
            // Update the date shipped
            updateQuery = "UPDATE orders SET dateshipped = ? WHERE orderid=?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, dateShipped);
            pstmt.setInt(2, orderId);

            rowsUpdated = pstmt.executeUpdate();
            pstmt.close();

            return rowsUpdated > 0 ? 1 : 0; // Return 1 if both updates were successful, 0 otherwise
        }

        conn.close();
        return 0; // Update failed
    } catch (SQLException e) {
        System.out.println(e.getMessage());
        return 0; // Update failed
    }
}

    public int updateOrderStatus(int orderId) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String updateQuery = "UPDATE orders SET orderstatusid = 2 WHERE orderid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setInt(1, orderId);

            int rowsUpdated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return rowsUpdated > 0 ? 1 : 0; // Return 1 if the update was successful, 0 otherwise
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0; // Update failed
        }
    }
    
    public int cancelOrder(int orderId) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String updateQuery = "UPDATE orders SET orderstatusid = 4 WHERE orderid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setInt(1, orderId);

            int rowsUpdated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return rowsUpdated > 0 ? 1 : 0; // Return 1 if the update was successful, 0 otherwise
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0; // Update failed
        }
    }
    
    public static List<orders> listOrders() {
        
        List<orders> orderList = new ArrayList<>();
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM orders");
            ResultSet rst = pstmt.executeQuery();
            
            // Process the results and populate the productList
                while (rst.next()) {
                    orders thisOrder = new orders();
                    thisOrder.orderid = rst.getInt("orderid");
                    thisOrder.productid = rst.getInt("productid");
                    thisOrder.productquantity = rst.getInt("productquantity");
                    thisOrder.supplierid = rst.getInt("supplierid");
                    thisOrder.dateacknowledged = rst.getString("dateacknowledged");
                    thisOrder.dateshipped = rst.getString("dateshipped");
                    thisOrder.orderstatusid = rst.getInt("orderstatusid");

                    orderList.add(thisOrder);
                }

                // Close resources
                rst.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        return orderList;
    }
    
    public int getOrders() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM orders o WHERE o.orderstatusid != 4 AND o.orderstatusid != 3");
            ResultSet rst = pstmt.executeQuery();
            
            order_idlist.clear();
            orderstatus_idlist.clear();
            
            while(rst.next()) {
                
                orderid = rst.getInt("orderid");
                orderstatusid = rst.getInt("orderstatusid");
                
                order_idlist.add(orderid);
                orderstatus_idlist.add(orderstatusid);
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
    
    public int getPOrders() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM orders o WHERE o.orderstatusid = 1");
            ResultSet rst = pstmt.executeQuery();
            
            order_idlist.clear();
            orderstatus_idlist.clear();
            
            while(rst.next()) {
                
                orderid = rst.getInt("orderid");
                orderstatusid = rst.getInt("orderstatusid");
                
                order_idlist.add(orderid);
                orderstatus_idlist.add(orderstatusid);
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
    
    public int getUncompleteOrders() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM orders o WHERE o.orderstatusid = 2");
            ResultSet rst = pstmt.executeQuery();
            
            order_idlist.clear();
            orderstatus_idlist.clear();
            
            while(rst.next()) {
                
                orderid = rst.getInt("orderid");
                orderstatusid = rst.getInt("orderstatusid");
                
                order_idlist.add(orderid);
                orderstatus_idlist.add(orderstatusid);
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
    
    
    public int orderInformation(){
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM orders WHERE orderid = ?");
            pstmt.setInt(1, orderid);
            ResultSet rst = pstmt.executeQuery();
            
            
            if (rst.next()){
                orderid = rst.getInt("orderid");
                productid = rst.getInt("productid");
                productquantity = rst.getInt("productquantity");
                supplierid = rst.getInt("supplierid");
                dateacknowledged = rst.getString("dateacknowledged");
                dateshipped = rst.getString("dateshipped");
                orderstatusid = rst.getInt("orderstatusid");
                
                pstmt.close();
                conn.close();
                //ResultSet rst = pstmt.executeQuery(); //error
            
                return 1;
            }
            else{
                System.out.println("Conditional Error");
                
                return 0;
            }
            
            
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; //register failed
        }
        
    }
    
    public static void main(String args[]) {
        
    }
}