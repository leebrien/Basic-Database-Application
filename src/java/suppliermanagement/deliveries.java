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
public class deliveries {
    public int orderid;
    public int courierid;
    public int deliverystatusid;
    public int shippingcost;
    public String dateacknowledged;
    public String dateshipped;
    public String fromlocation;
    public String tolocation;
    
    public ArrayList<Integer> orderidlist = new ArrayList<> ();
    public ArrayList<Integer> courieridlist = new ArrayList<> ();
    public ArrayList<Integer> deliverystatusidlist = new ArrayList<> ();
    public ArrayList<Integer> shippingcostlist = new ArrayList<> ();
    public ArrayList<String> dateacknowledgedlist = new ArrayList<> ();
    public ArrayList<String> dateshippedlist = new ArrayList<> ();
    public ArrayList<String> fromlocationlist = new ArrayList<> ();
    public ArrayList<String> tolocationlist = new ArrayList<> ();
    
    public int new_courierid;
    public int new_deliverystatusid;
    public int new_shippingcost;
    public String new_dateacknowledged;
    public String new_dateshipped;
    public String new_fromlocation;
    public String new_tolocation;
    
    public deliveries() {
        
    }
    
    public int getDelivery() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM deliveries");
            ResultSet rst = pstmt.executeQuery();
    
            orderidlist.clear();
            courieridlist.clear();
            deliverystatusidlist.clear();
            shippingcostlist.clear();
            dateacknowledgedlist.clear();
            dateshippedlist.clear();
            fromlocationlist.clear();
            tolocationlist.clear();
            
            while(rst.next()) {
                orderid = rst.getInt("orderid");
                courierid = rst.getInt("courierid");
                deliverystatusid = rst.getInt("deliverystatusid");
                shippingcost = rst.getInt("shippingcost");
                dateacknowledged = rst.getString("dateacknowledged");
                dateshipped = rst.getString("dateshipped");
                fromlocation = rst.getString("fromlocation");
                tolocation = rst.getString("tolocation");
                
                orderidlist.add(orderid);
                courieridlist.add(courierid);
                deliverystatusidlist.add(deliverystatusid);
                shippingcostlist.add(shippingcost);
                dateacknowledgedlist.add(dateacknowledged);
                dateshippedlist.add(dateshipped);
                fromlocationlist.add(fromlocation);
                tolocationlist.add(tolocation);
            }
            
            pstmt.close();
            conn.close();
            //ResultSet rst = pstmt.executeQuery(); //error
            // Print statements for debugging
        
        
            
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; //register failed
        }
    }
    public static List<deliveries> searchDelivery(int orderid, int courierid, int deliverystatusid, int shippingcost, String dateacknowledged, String dateshipped, String fromlocation, String tolocation) {
        List<deliveries> deliveryList = new ArrayList<>();
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            String sql = "SELECT * FROM deliveries WHERE 1=1";
            
            if (orderid > 0) {
                sql += " AND orderid = ?";
            }
            if (courierid > 0) {
                sql += " AND courierid = ?";
            }
            if (deliverystatusid > 0) {
                sql += " AND deliverystatusid = ?";
            }
            if (shippingcost > 0) {
                sql += " AND shippingcost = ?";
            }
            if (dateacknowledged != null && !dateacknowledged.isEmpty()) {
                 sql += " AND dateacknowledged LIKE ?";
            }
            if (dateshipped != null && !dateshipped.isEmpty()) {
                 sql += " AND dateshipped LIKE ?";
            }
          
            if (fromlocation != null && !fromlocation.isEmpty()) {
                 sql += " AND fromlocation LIKE ?";
            }
            if (tolocation != null && !tolocation.isEmpty()) {
                 sql += " AND tolocation LIKE ?";
            }
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            int index = 1;
            
            if (orderid > 0) {
                    pstmt.setInt(index++, orderid);
            }
            if (courierid > 0) {
                    pstmt.setInt(index++, courierid);
            }
            if (deliverystatusid > 0) {
                    pstmt.setInt(index++, deliverystatusid);
            }
            if (shippingcost > 0) {
                    pstmt.setInt(index++, shippingcost);
            }
            if (dateacknowledged != null && !dateacknowledged.isEmpty()) {
                pstmt.setString(index++, "%" + dateacknowledged + "%");
            }
            if (dateshipped != null && !dateshipped.isEmpty()) {
                pstmt.setString(index++, "%" + dateshipped + "%");  
            }
          
            if (fromlocation != null && !fromlocation.isEmpty()) {
                pstmt.setString(index++, "%" + fromlocation + "%");
            }
            if (tolocation != null && !tolocation.isEmpty()) {
                pstmt.setString(index++, "%" + tolocation + "%");
            }
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                deliveries thisDelivery = new deliveries();
                thisDelivery.orderid = rs.getInt("orderid");
                thisDelivery.courierid = rs.getInt("courierid");
                thisDelivery.deliverystatusid = rs.getInt("deliverystatusid");
                thisDelivery.shippingcost = rs.getInt("shippingcost");
                thisDelivery.dateacknowledged = rs.getString("dateacknowledged");
                thisDelivery.dateshipped = rs.getString("dateshipped");
                thisDelivery.fromlocation = rs.getString("fromlocation");
                thisDelivery.tolocation = rs.getString("tolocation");

                deliveryList.add(thisDelivery);
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return deliveryList;
    }
    
    public int updateDelivery(int new_shippingcost, String new_dateacknowledged, String new_dateshipped, String new_fromlocation, String new_tolocation) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            String updateQuery = "UPDATE deliveries SET shippingcost=?, dateacknowledged=?, dateshipped=?, fromlocation=?, tolocation=? WHERE courierid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            
            pstmt.setInt(1, new_shippingcost);
            pstmt.setString(2, new_dateacknowledged);
            pstmt.setString(3, new_dateshipped);
            pstmt.setString(4, new_fromlocation);
            pstmt.setString(5, new_tolocation);
            
            int updated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return updated > 0 ? 1 : 0;
        }
        catch(SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int createDelivery(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventorydb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(orderid) + 1 AS newID FROM deliveries");
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()) {
                orderid = rst.getInt("newID");
            }
            pstmt = conn.prepareStatement("INSERT INTO deliveries(orderid, courierid, deliverystatusid, shippingcost, dateacknowledged, dateshipped, fromlocation, tolocation) VALUE (?, ?, ?, ?, ?, ?, ?, ?(");
            pstmt.setInt(1, orderid);
            pstmt.setInt(2, courierid);
            pstmt.setInt(3, deliverystatusid);
            pstmt.setInt(4, shippingcost);
            pstmt.setString(5, dateacknowledged);
            pstmt.setString(6, dateshipped);
            pstmt.setString(7, fromlocation);
            pstmt.setString(8, tolocation);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public static void main(String args[]){
       
        deliveries thisa = new deliveries();
        
        thisa.getDelivery();
    }
}
