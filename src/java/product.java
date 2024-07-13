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

public class product {
    
    //fields of product
    public int    productid;
    public String productname;
    public String description;
    public int price;
    public int supplierid;
    public int categoryid;
    
    //field of new attributes
    public String newProductName;
    public String newDescription;
    public int newPrice;
    public int newSupplierId;
    public int newCategoryId;
    
    //list of products
    public ArrayList<Integer>  product_idlist     = new ArrayList<> ();
    public ArrayList<String>   productname_list   = new ArrayList<> ();
    public ArrayList<String>   description_list   = new ArrayList<> ();
    public ArrayList<Integer>  price_list         = new ArrayList<> ();
    public ArrayList<Integer>  supplier_idlist    = new ArrayList<> ();
    public ArrayList<Integer>  category_idlist    = new ArrayList<> ();
    
    public product () {
        
    }
    
    public int selectProduct(int supplierid) {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            // Modify the SQL query to select products based on the supplier
            String sql = "SELECT productid, productname, price FROM products WHERE supplierid = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, supplierid);
            
            ResultSet rst = pstmt.executeQuery();
            
            product_idlist.clear();
            price_list.clear();
            productname_list.clear();
            
            
            while(rst.next()) {
                productid = rst.getInt("productid");
                productname = rst.getString("productname");
                price = rst.getInt("price");
                
                product_idlist.add(productid);
                productname_list.add(productname);
                price_list.add(price);
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
    
    public int deleteProduct(int productid) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            String sql = "DELETE FROM products WHERE productid= ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productid);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public static List<product> searchProduct(String productName, Integer v_price, Integer supplierId, Integer categoryId) {
        
        List<product> productList = new ArrayList<>();

            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

                // Construct the SQL query based on provided parameters
                String sql = "SELECT * FROM products WHERE 1=1";

                if (productName != null && !productName.isEmpty()) {
                    sql += " AND productname LIKE ?";
                }

                if (v_price > 0) {
                    sql += " AND price = ?";
                }

                if (supplierId > 0) {
                    sql += " AND supplierid = ?";
                }

                if (categoryId > 0) {
                    sql += " AND categoryid = ?";
                }


                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Set values for the prepared statement based on provided parameters
                int parameterIndex = 1;

                if (productName != null && !productName.isEmpty()) {
                    pstmt.setString(parameterIndex++, "%" + productName + "%");
                }

                if (v_price > 0) {
                    pstmt.setInt(parameterIndex++, v_price);
                }

                if (supplierId > 0) {
                    pstmt.setInt(parameterIndex++, supplierId);
                }

                if (categoryId > 0) {
                    pstmt.setInt(parameterIndex++, categoryId);
                }

                // Execute the query
                ResultSet rs = pstmt.executeQuery();

                // Process the results and populate the productList
                while (rs.next()) {
                    product thisProduct = new product();
                    thisProduct.productid = rs.getInt("productid");
                    thisProduct.productname = rs.getString("productname");
                    thisProduct.description = rs.getString("description");
                    thisProduct.price = rs.getInt("price");
                    thisProduct.supplierid = rs.getInt("supplierid");
                    thisProduct.categoryid = rs.getInt("categoryid");

                    productList.add(thisProduct);
                }

                // Close resources
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        return productList;
    }

    
    public int updateProduct(String newProductName, String newDescription, int newPrice, int newSupplierId, int newCategoryId) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String updateQuery = "UPDATE products SET productname=?, description=?, price=?, supplierid=?, categoryid=? WHERE productid=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setString(1, newProductName);
            pstmt.setString(2, newDescription);
            pstmt.setInt(3, newPrice);
            pstmt.setInt(4, newSupplierId);
            pstmt.setInt(5, newCategoryId);
            pstmt.setInt(6, productid);

            int rowsUpdated = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return rowsUpdated > 0 ? 1 : 0; // Return 1 if the update was successful, 0 otherwise
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0; // Update failed
        }
    }
    
    public int productInformation(){
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM products WHERE productid = ?");
            pstmt.setInt(1, productid);
            ResultSet rst = pstmt.executeQuery();
            
            
            if (rst.next()){
                productid = rst.getInt("productid");
                productname = rst.getString("productname");
                description = rst.getString("description");
                price = rst.getInt("price");
                supplierid = rst.getInt("supplierid");
                categoryid = rst.getInt("categoryid");
                
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
    
    public static List<product> searchInventoryProduct(Integer supplierId) {
        
        List<product> productList = new ArrayList<>();

            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM products p JOIN inventory i ON i.productid = p.productid WHERE i.supplierid = ?");
                pstmt.setInt(1, supplierId);
                ResultSet rst = pstmt.executeQuery();

                // Process the results and populate the productList
                while (rst.next()) {
                    product thisProduct = new product();
                    thisProduct.productid = rst.getInt("productid");
                    thisProduct.productname = rst.getString("productname");
                    thisProduct.description = rst.getString("description");
                    thisProduct.price = rst.getInt("price");
                    thisProduct.supplierid = rst.getInt("supplierid");
                    thisProduct.categoryid = rst.getInt("categoryid");

                    productList.add(thisProduct);
                }

                // Close resources
                rst.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        return productList;
    }
    
    public int getInventoryProduct(Integer supplierId) {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM products p JOIN inventory i ON i.productid = p.productid WHERE i.supplierid = ?");
            pstmt.setInt(1, supplierId);
            ResultSet rst = pstmt.executeQuery();
            
            product_idlist.clear();
            productname_list.clear();
            
            while(rst.next()) {
                
                productid = rst.getInt("productid");
                productname = rst.getString("productname");
                
                product_idlist.add(productid);
                productname_list.add(productname);
                
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
    
    public int delete_product(String input) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            String smt = "DELETE FROM products WHERE productid=" + input;
            
            PreparedStatement pstmt = conn.prepareStatement(smt);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            //ResultSet rst = pstmt.executeQuery(); //error
            
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int register_product() {
        
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(productid) + 1 AS newID FROM products");
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()) {
                productid = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO products (productid, productname, description, price, supplierid, categoryid) VALUE (?, ?, ?, ?, ?, ?)");
            pstmt.setInt   (1, productid);
            pstmt.setString(2, productname);
            pstmt.setString(3, description);
            pstmt.setInt(4, price);
            pstmt.setInt   (5, supplierid);
            pstmt.setInt(6, categoryid);
            
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
            
            product product = new product();
            product.getInventoryProduct(1);
        }
    }
