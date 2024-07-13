/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package couriersmgt;

/**
 *
 * @author ccslearner
 */

import java.util.*;
import java.sql.*;

public class couriers{

    //fields of couriers
    public int      courier_id;
    public String   courier_companyname;
    public String   courier_contact;
    public String   courier_streetname;
    public String   courier_city;
    public int      courier_zipcode;
    public String   courier_region;

    //list of couriers
    public ArrayList<Integer>   courier_idlist          = new ArrayList<>();
    public ArrayList<String>    courier_companynamelist = new ArrayList<>();
    public ArrayList<String>    courier_contactlist     = new ArrayList<>();
    public ArrayList<String>    courier_streetnamelist  = new ArrayList<>();
    public ArrayList<String>    courier_citylist        = new ArrayList<>();
    public ArrayList<Integer>   courier_zipcodelist     = new ArrayList<>();
    public ArrayList<String>    courier_regionlist      = new ArrayList<>();
    public ArrayList<couriers>  couriers_list           = new ArrayList<couriers>();


    public couriers() {}
    
    public int get_courier() {
        try {
            Connection connection;
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT courierid, companyname FROM couriers");
            ResultSet resultSet = preparedStatement.executeQuery();

            courier_idlist.clear();
            courier_companynamelist.clear();

            while (resultSet.next()) {
                courier_id = resultSet.getInt("courierid");
                courier_companyname = resultSet.getString("companyname");
                
                courier_idlist.add(courier_id);
                courier_companynamelist.add(courier_companyname);
            }

            preparedStatement.close();
            connection.close();

            return 1;
        } catch (Exception exception) {
            System.out.println(exception.getMessage());
            return 0;
        }
    }

    public int register_courier(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT IFNULL(MAX(courierid), 0) + 1 AS newID FROM couriers");
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()) {
                courier_id = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO couriers (courierid, companyname, contact, streetname, city, zipcode, region) VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt   (1, courier_id);
            pstmt.setString(2, courier_companyname);
            pstmt.setString(3, courier_contact);
            pstmt.setString(4, courier_streetname);
            pstmt.setString(5, courier_city);
            pstmt.setInt   (6, courier_zipcode);
            pstmt.setString(7, courier_region);
            
            pstmt.executeUpdate(); 
            pstmt.close();
            conn.close();
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int update_courier(String companyname, String contact, String streetname, String city, String zipcode, String region, String supplierid){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            String updateQuery = "UPDATE couriers SET companyname=?, contact=?, streetname=?, city=?, zipcode=?, region=? WHERE courierid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setString(1, companyname);
            pstmt.setString(2, contact);
            pstmt.setString(3, streetname);
            pstmt.setString(4, city);
            pstmt.setInt(5, Integer.parseInt(zipcode));
            pstmt.setString(6, region);
            pstmt.setInt(7, Integer.parseInt(supplierid));

            int rowsUpdated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int view_courier(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE courierid = ?");
            pstmt.setInt(1, courier_id);
            ResultSet rst = pstmt.executeQuery();

            if (rst.next()) {
                courier_id          = rst.getInt("courierid");
                courier_companyname = rst.getString("companyname");
                courier_contact     = rst.getString("contact");
                courier_streetname  = rst.getString("streetname");
                courier_city        = rst.getString("city");
                courier_zipcode     = rst.getInt("zipcode");
                courier_region      = rst.getString("region");

                pstmt.close();
                conn.close();

                return 1;
            } else {
                System.out.println("Error");

                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int delete_courier(String input){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement preparedStatement = conn.prepareStatement("DELETE FROM couriers WHERE courierid = ?");
            preparedStatement.setInt(1, Integer.parseInt(input));
            preparedStatement.executeUpdate();
            preparedStatement.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public boolean check_courier(int courier_id){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) AS count FROM deliveries WHERE courierid = ?");
            pstmt.setInt(1, courier_id);

            ResultSet rSet = pstmt.executeQuery();

            if(rSet.next()){
                int count = rSet.getInt("count");
                return count > 0;
            }

            rSet.close();
            pstmt.close();
            conn.close();
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        
        return false;
    }

    public int search_courier(){
        try{
            
            
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public ArrayList<couriers> checkCouriers(boolean cFlag, boolean ciFlag, boolean rFlag, String companyname, String city, String region) {
        try {Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            couriers_list.clear();
            
            PreparedStatement pstmt = conn.prepareStatement("");
            if (cFlag == false && ciFlag == false && rFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers");
            }
            if (cFlag == true && ciFlag == false && rFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE companyname=?");
                pstmt.setString(1, companyname);
            } 
            if (cFlag == false && ciFlag == true && rFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE city=?");
                pstmt.setString(1, city);
            } 
            if (cFlag == false && ciFlag == false && rFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE region=?");
                pstmt.setString(1, region);
            } 
            if (cFlag == true && ciFlag == true && rFlag == false) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE companyname=? AND city=?");
                pstmt.setString(1, companyname);
                pstmt.setString(2, city);
            }
            if (cFlag == false && ciFlag == true && rFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE city=? AND region=?");
                pstmt.setString(1, city);
                pstmt.setString(2, region);
            }
            if (cFlag == true && ciFlag == false && rFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE companyname=? AND region=?");
                pstmt.setString(1, companyname);
                pstmt.setString(2, region);
            }
            if (cFlag == true && ciFlag == true && rFlag == true) {
                pstmt = conn.prepareStatement("SELECT * FROM couriers WHERE companyname=? AND city=? AND region=?");
                pstmt.setString(1, companyname);
                pstmt.setString(2, city);
                pstmt.setString(3, region);
            }
            
            ResultSet rst = pstmt.executeQuery();
        
            while(rst.next()) {
                couriers thisCouriers = new couriers();
                
                thisCouriers.courier_id = rst.getInt("courierid");
                thisCouriers.courier_companyname = rst.getString("companyname");
                thisCouriers.courier_contact = rst.getString("contact");
                thisCouriers.courier_streetname = rst.getString("streetname");
                thisCouriers.courier_city = rst.getString("city");
                thisCouriers.courier_zipcode = rst.getInt("zipcode");
                thisCouriers.courier_region = rst.getString("region");
                
                couriers_list.add(thisCouriers);
            }
            
            pstmt.close();
            conn.close();
            
            return couriers_list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return couriers_list;
        }
    }
    
    public int report_courier(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(o.orderid) AS 'Total_Deliveries', c.couriers, d.deliverystatusid, o.productid, o.supplierid FROM couriers c LEFT JOIN deliveries d ON (c.courierid = d.courierid) JOIN orders o ON (d.orderid = o.orderid) GROUP BY c.courerid ORDER BY COUNT(o.orderid) DESC;");
            ResultSet rst = pstmt.executeQuery();

            return 1;
        } catch (Exception e) {
            return 0;
        }
    }
}