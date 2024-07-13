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

public class supplier {
    
    //fields of suppliers
    public int    supplierid;
    public String lastname;
    public String firstname;
    public String middlename;
    public String contact;
    public String streetname;
    public String city;
    public int    zipcode;
    public String region;
    
    //list of suppliers
    public ArrayList<Integer>  supplier_idlist       = new ArrayList<> ();
    public ArrayList<String>   completename_list     = new ArrayList<> ();
    public ArrayList<String>   lastname_list         = new ArrayList<> ();
    public ArrayList<String>   firstname_list        = new ArrayList<> ();
    public ArrayList<String>   middlename_list       = new ArrayList<> ();
    public ArrayList<String>   contact_list          = new ArrayList<> ();
    public ArrayList<String>   streetname_list       = new ArrayList<> ();
    public ArrayList<String>   city_list             = new ArrayList<> ();
    public ArrayList<Integer>  zipcode_list          = new ArrayList<> ();
    public ArrayList<String>   region_list           = new ArrayList<> ();
    public ArrayList<supplier> supplier_list         = new ArrayList<supplier> ();
    
    public supplier () {
        
    }
    
    public ArrayList<supplier> checkSuppliers(boolean lFlag, boolean fFlag, boolean cFlag, String lastname, String firstname, String city) {
        try {Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            supplier_list.clear();
            
            PreparedStatement pstmt = conn.prepareStatement("");
            if (lFlag == false && fFlag == false && cFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers");
            }
            if (lFlag == true && fFlag == false && cFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE lastname=?");
                pstmt.setString(1, lastname);
            } 
            if (lFlag == false && fFlag == true && cFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE firstname=?");
                pstmt.setString(1, firstname);
            } 
            if (lFlag == false && fFlag == false && cFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE city=?");
                pstmt.setString(1, city);
            } 
            if (lFlag == true && fFlag == true && cFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE lastname=? AND firstname=?");
                pstmt.setString(1, lastname);
                pstmt.setString(2, firstname);
            }
            if (lFlag == false && fFlag == true && cFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE firstname=? AND city=?");
                pstmt.setString(1, firstname);
                pstmt.setString(2, city);
            }
            if (lFlag == true && fFlag == false && cFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE lastname=? AND city=?");
                pstmt.setString(1, lastname);
                pstmt.setString(2, city);
            }
            if (lFlag == true && fFlag == true && cFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE lastname=? AND city=? AND firstname=?");
                pstmt.setString(1, lastname);
                pstmt.setString(2, city);
                pstmt.setString(3, firstname);
            }
            
            ResultSet rst = pstmt.executeQuery();
        
            while(rst.next()) {
                supplier thisSupplier = new supplier();
                
                thisSupplier.supplierid = rst.getInt("supplierid");
                thisSupplier.lastname = rst.getString("lastname");
                thisSupplier.firstname = rst.getString("firstname");
                thisSupplier.middlename = rst.getString("middlename");
                thisSupplier.contact = rst.getString("contact");
                thisSupplier.streetname = rst.getString("streetname");
                thisSupplier.city = rst.getString("city");
                thisSupplier.zipcode = rst.getInt("zipcode");
                thisSupplier.region = rst.getString("region");
                
                supplier_list.add(thisSupplier);
            }
            
            pstmt.close();
            conn.close();
            
            return supplier_list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return supplier_list;
        }
    }
    
    public ArrayList<supplier> getList(String criteria, String specs) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE ?=?");
            pstmt.setString(1, criteria);
            pstmt.setString(2, specs);
            
            ResultSet rst = pstmt.executeQuery();
            ArrayList<supplier> supplierList= new ArrayList<supplier>();
            
            supplier_list.clear();
            while(rst.next()) {
                supplier thisSupplier = new supplier();
                
                thisSupplier.supplierid = rst.getInt("supplierid");
                thisSupplier.lastname = rst.getString("lastname");
                thisSupplier.firstname = rst.getString("firstname");
                thisSupplier.middlename = rst.getString("middlename");
                thisSupplier.contact = rst.getString("contact");
                thisSupplier.streetname = rst.getString("streetname");
                thisSupplier.city = rst.getString("city");
                thisSupplier.zipcode = rst.getInt("zipcode");
                thisSupplier.region = rst.getString("region");
                
                supplier_list.add(thisSupplier);
            }
            
            pstmt.close();
            conn.close();
            
            return supplier_list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return supplier_list;
        }
    }
    
    public int getSupplier() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierid, CONCAT(lastname, ' ', firstname, ' ', middlename) AS completename FROM suppliers");
            ResultSet rst = pstmt.executeQuery();
            
            supplier_idlist.clear();
            completename_list.clear();
            
            
            while(rst.next()) {
                supplierid = rst.getInt("supplierid");
                String completename = rst.getString("completename");
                
                supplier_idlist.add(supplierid);
                completename_list.add(completename);
            }
            
            pstmt.close();
            conn.close();
            
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; //register failed
        }
    }
    
    public int updateSupplier(String newLastName, String newFirstName, String newMiddleName, String newContact, String newStreetName, String newCity, int newZipCode, String newRegion, int supplierid) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String updateQuery = "UPDATE suppliers SET lastname=?, firstname=?, middlename=?, contact=?, streetname=?, city=?, zipcode=?, region=? WHERE supplierid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setString(1, newLastName);
            pstmt.setString(2, newFirstName);
            pstmt.setString(3, newMiddleName);
            pstmt.setString(4, newContact);
            pstmt.setString(5, newStreetName);
            pstmt.setString(6, newCity);
            pstmt.setInt(7, newZipCode);
            pstmt.setString(8, newRegion);
            
            pstmt.setInt(9, supplierid);

            int rowsUpdated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return rowsUpdated > 0 ? 1 : 0; // Return 1 if the update was successful, 0 otherwise
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0; // Update failed
        }
    }
    
    public int getSupplierInformation () {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM suppliers WHERE supplierid = ?");
            pstmt.setInt(1, supplierid);
            ResultSet rst = pstmt.executeQuery();
            
            
            if (rst.next()){
                supplierid = rst.getInt("supplierid");
                lastname = rst.getString("lastname");
                firstname = rst.getString("firstname");
                middlename = rst.getString("middlename");
                contact = rst.getString("contact");
                streetname = rst.getString("streetname");
                city = rst.getString("city");
                zipcode = rst.getInt("zipcode");
                region = rst.getString("region");
                
                
                pstmt.close();
                conn.close();
                return 1;
            }
            else{
                System.out.println("Conditional Error");
                
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int update_supplier(String lastname, String firstname, String middlename, String contact, String streetname, String city, String zipcode, String region, String supplierid) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            String updateQuery = "UPDATE suppliers SET lastname=?, firstname=?, middlename=?, contact=?, streetname=?, city=?, zipcode=?, region=? WHERE supplierid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setString(1, lastname);
            pstmt.setString(2, firstname);
            pstmt.setString(3, middlename);
            pstmt.setString(4, contact);
            pstmt.setString(5, streetname);
            pstmt.setString(6, city);
            pstmt.setInt(7, Integer.parseInt(zipcode));
            pstmt.setString(8, region);
            pstmt.setInt(9, Integer.parseInt(supplierid));

            int rowsUpdated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int delete_supplier(String input) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            String smt = "DELETE FROM suppliers WHERE supplierid=" + input;
            
            PreparedStatement pstmt = conn.prepareStatement(smt);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int register_supplier() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(supplierid) + 1 AS newID FROM suppliers");
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()) {
                supplierid = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO suppliers (supplierid, lastname, firstname, middlename, contact, streetname, city, zipcode, region) VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt   (1, supplierid);
            pstmt.setString(2, lastname);
            pstmt.setString(3, firstname);
            pstmt.setString(4, middlename);
            pstmt.setString(5, contact);
            pstmt.setString(6, streetname);
            pstmt.setString(7, city);
            pstmt.setInt   (8, Integer.valueOf(zipcode));
            pstmt.setString(9, region);
            
            pstmt.executeUpdate(); 
            pstmt.close();
            conn.close();
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; //register failed
        }
    }
    
    public static void main(String args[]) {
    
    }
}
