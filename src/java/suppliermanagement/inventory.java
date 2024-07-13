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
public class inventory {
    public int inventoryid;
    public int productid;
    public int supplierid;
    public int quantityinstock;
    public String streetname;
    public String city;
    public int zipcode;
    public String region;
    
    public ArrayList<Integer> inventoryidlist = new ArrayList<> ();
    public ArrayList<Integer> productidlist = new ArrayList<> ();
    public ArrayList<Integer> supplieridlist = new ArrayList<> ();
    public ArrayList<Integer> quantityinstocklist = new ArrayList<> ();
    public ArrayList<String> streetnamelist = new ArrayList<> ();
    public ArrayList<String> citylist = new ArrayList<> ();
    public ArrayList<Integer> zipcodelist = new ArrayList<> ();
    public ArrayList<String> regionlist = new ArrayList<> ();
    
    public int new_quantity;
    public String new_streetname;
    public String new_city;
    public int new_zipcode;
    public String new_region;
    
    
    public inventory() {
        
    }
    
    public static List<inventory> searchInventoryProduct(int supplierid) {
        List<inventory> inventoryList = new ArrayList<>();
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM inventory WHERE supplierid = ?");
            pstmt.setInt(1, supplierid);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                inventory thisInventory = new inventory();
                thisInventory.inventoryid = rs.getInt("inventoryid");
                thisInventory.productid = rs.getInt("productid");
                thisInventory.supplierid = rs.getInt("supplierid");
                thisInventory.quantityinstock = rs.getInt("quantityinstock");
                thisInventory.streetname = rs.getString("streetname");
                thisInventory.city = rs.getString("city");
                thisInventory.zipcode = rs.getInt("zipcode");
                thisInventory.region = rs.getString("region");

                inventoryList.add(thisInventory);
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return inventoryList;
    }
    
    public static List<inventory> searchInventory(int productid, int supplierid, String streetname, String city, int zipcode, String region) {
        List<inventory> inventoryList = new ArrayList<>();
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            String sql = "SELECT * FROM inventory WHERE 1=1";
            
            if (productid > 0) {
                sql += " AND productid = ?";
            }
            if (supplierid > 0) {
                sql += " AND supplierid = ?";
            }
            if (streetname != null && !streetname.isEmpty()) {
                 sql += " AND streetname LIKE ?";
            }
            if (city != null && !city.isEmpty()) {
                 sql += " AND city LIKE ?";
            }
            if (zipcode > 0) {
                sql += " AND zipcode = ?";
            }
            if (region != null && !region.isEmpty()) {
                 sql += " AND region LIKE ?";
            }
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            int index = 1;
            
            if (productid > 0) {
                    pstmt.setInt(index++, productid);
            }
            if (supplierid > 0) {
                    pstmt.setInt(index++, supplierid);
            }
            if (streetname != null && !streetname.isEmpty()) {
                pstmt.setString(index++, "%" + streetname + "%");
            }
            if (city != null && !city.isEmpty()) {
                pstmt.setString(index++, "%" + city + "%");  
            }
            if (zipcode > 0) {
                    pstmt.setInt(index++, zipcode);
                }
            if (region != null && !region.isEmpty()) {
                pstmt.setString(index++, "%" + region + "%");
            }
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                inventory thisInventory = new inventory();
                thisInventory.inventoryid = rs.getInt("inventoryid");
                thisInventory.productid = rs.getInt("productid");
                thisInventory.supplierid = rs.getInt("supplierid");
                thisInventory.quantityinstock = rs.getInt("quantityinstock");
                thisInventory.streetname = rs.getString("streetname");
                thisInventory.city = rs.getString("city");
                thisInventory.zipcode = rs.getInt("zipcode");
                thisInventory.region = rs.getString("region");

                inventoryList.add(thisInventory);
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return inventoryList;
    }
    
    public int getInventory() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM inventory");
            ResultSet rst = pstmt.executeQuery();
    
            inventoryidlist.clear();
            productidlist.clear();
            supplieridlist.clear();
            quantityinstocklist.clear();
            streetnamelist.clear();
            citylist.clear();
            zipcodelist.clear();
            regionlist.clear();
            
            while(rst.next()) {
                inventoryid = rst.getInt("inventoryid");
                productid = rst.getInt("productid");
                supplierid = rst.getInt("supplierid");
                quantityinstock = rst.getInt("quantityinstock");
                streetname = rst.getString("streetname");
                city = rst.getString("city");
                zipcode = rst.getInt("zipcode");
                region = rst.getString("region");
                
                inventoryidlist.add(inventoryid);
                productidlist.add(productid);
                supplieridlist.add(supplierid);
                quantityinstocklist.add(quantityinstock);
                streetnamelist.add(streetname);
                citylist.add(city);
                zipcodelist.add(zipcode);
                regionlist.add(region);
            }
            
            pstmt.close();
            conn.close();
            //ResultSet rst = pstmt.executeQuery(); //error
            // Print statements for debugging
        System.out.println("I.supplieridlist size: " + supplieridlist.size());
        
            
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; //register failed
        }
    }
    
    public int updateInventory(int newQuantity, String street, String city,int zip, String reg) {
    try {
        Connection conn;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

        // Update inventory with new quantity
        String updateQuery = "UPDATE inventory SET quantityinstock=?, streetname=?, city=?, zipcode=?, region=? WHERE productid=?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setInt(1, newQuantity);
        pstmt.setString(2, street);
        pstmt.setString(3, city);
        pstmt.setInt(4, zip);
        pstmt.setString(5, reg);
        pstmt.setInt(6, productid);

        int rowsUpdated = pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        return rowsUpdated > 0 ? 1 : 0; // Return 1 if the update was successful, 0 otherwise
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0; // Update failed
    }
}

    
    public int viewInventoryInformation() {
    try {
        Connection conn;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");

        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM inventory WHERE productid = ?");
        pstmt.setInt(1, productid);
        ResultSet rst = pstmt.executeQuery();

        if (rst.next()) {
            productid = rst.getInt("productid");
            quantityinstock = rst.getInt("quantityinstock");
            streetname = rst.getString("streetname");
            city = rst.getString("city");
            zipcode = rst.getInt("zipcode");
            region = rst.getString("region");

            pstmt.close();
            conn.close();

            return 1; // Successful retrieval
        } else {
            pstmt.close();
            conn.close();
            return 0; // Product not found in inventory
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0; // Retrieval failed
    }
}

    public int deleteInventory(int inventoryid) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            String sql = "DELETE FROM inventory WHERE inventoryid= ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, inventoryid);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int createinventory(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventorydb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(inventoryid) + 1 AS newID FROM inventory");
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()) {
                inventoryid = rst.getInt("newID");
            }
            pstmt = conn.prepareStatement("INSERT INTO inventory(inventoryid, productid, supplierid, quantityinstock, streetname, city, zipcode, region) VALUE (?, ?, ?, ?, ?, ?, ?, ?(");
            pstmt.setInt(1, inventoryid);
            pstmt.setInt(2, productid);
            pstmt.setInt(3, supplierid);
            pstmt.setInt(4, quantityinstock);
            pstmt.setString(5, streetname);
            pstmt.setString(6, city);
            pstmt.setInt(7, zipcode);
            pstmt.setString(8, region);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int deductQuantityFromInventory(int quantityToDeduct) {
    try {
        Connection conn;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

        // Retrieve the current quantityinstock
        String selectQuery = "SELECT quantityinstock FROM inventory WHERE productid=?";
        PreparedStatement selectPstmt = conn.prepareStatement(selectQuery);
        selectPstmt.setInt(1, productid);
        ResultSet selectResult = selectPstmt.executeQuery();

        int currentQuantity = 0;
        if (selectResult.next()) {
            currentQuantity = selectResult.getInt("quantityinstock");
        }

        // Calculate the new quantityinstock
        int newQuantity = currentQuantity - quantityToDeduct;

        // Update inventory with the new quantity
        String updateQuery = "UPDATE inventory SET quantityinstock=? WHERE productid=?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setInt(1, newQuantity);
        pstmt.setInt(2, productid);

        int rowsUpdated = pstmt.executeUpdate();

        // Close resources
        selectResult.close();
        selectPstmt.close();
        pstmt.close();
        conn.close();

        return rowsUpdated > 0 ? 1 : 0; // Return 1 if the update was successful, 0 otherwise
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0; // Update failed
    }
}

    
    public static void main(String args[]){
       
        inventory thisa = new inventory();
        
        thisa.getInventory();
    }
}