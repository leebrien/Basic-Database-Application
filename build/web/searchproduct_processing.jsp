<%-- 
    Document   : searchproduct_processing
    Created on : 11 19, 23, 1:09:58 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Information</title>
    </head>
    <body>
        <%
            String v_productName = request.getParameter("productname");
            String v_strPrice = request.getParameter("price");
            String v_strSupplierId = request.getParameter("supplierid");
            String v_strCategoryId = request.getParameter("categoryid");
            
            System.out.println("productName: " + v_productName);
            System.out.println("strPrice: " + v_strPrice);
            System.out.println("strSupplierId: " + v_strSupplierId);
            System.out.println("strCategoryId: " + v_strCategoryId);
            
            int v_price = (v_strPrice != null && !v_strPrice.isEmpty()) ? Integer.parseInt(v_strPrice) : 0;
            int v_supplierId = (v_strSupplierId != null && !v_strSupplierId.isEmpty()) ? Integer.parseInt(v_strSupplierId) : 0;
            int v_categoryId = (v_strCategoryId != null && !v_strCategoryId.isEmpty()) ? Integer.parseInt(v_strCategoryId) : 0;
            
            List<product> productList = product.searchProduct(v_productName, v_price, v_supplierId, v_categoryId);
            
            System.out.println("Converted Price: " + v_price);
            System.out.println("Converted SupplierId: " + v_supplierId);
            System.out.println("Converted CategoryId: " + v_categoryId);
            System.out.println("Product List Size: " + productList.size());
        %>
        
        <h2>Search Results:</h2>
        
        <%
            if (productList.isEmpty()) {
        %>
            <p>No matching products found.</p>
        <%
            } else {
        %>
            <table border="1">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Product Price</th>
                    <th>Supplier ID</th>
                    <th>Category ID</th>
                    
                </tr>

                <% for (product thisProduct : productList) { %>
                    <tr>
                        <td><%= thisProduct.productid %></td>
                        <td><%= thisProduct.productname %></td>
                        <td><%= thisProduct.description %></td>
                        <td><%= thisProduct.price %></td>
                        <td><%= thisProduct.supplierid %></td>
                        <td><%= thisProduct.categoryid %></td>
                        
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="searchproduct.jsp"><input type="button" value="Search for Another Product"></a>
                
    </body>
</html>
