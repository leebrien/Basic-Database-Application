<%-- 
    Document   : searchinventory_processing
    Created on : 11 21, 23, 3:50:53 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Inventory</title>
    </head>
    <body>
        <%
            String v_strSupplierId = request.getParameter("supplierid");
            String v_streetname = request.getParameter("streetname");
            String v_strZipcode = request.getParameter("zipcode");
            String v_city = request.getParameter("city");
            String v_region = request.getParameter("region");
            String v_strQuantity = request.getParameter("quantityinstock");
            
            System.out.println("strSupplierId: " + v_strSupplierId);
            System.out.println("streetname: " + v_streetname);
            System.out.println("city: " + v_city);
            System.out.println("strZipcode: " + v_strZipcode);
            System.out.println("region: " + v_region);
            System.out.println("quantityinstock: " + v_strQuantity);
            
            int v_zipcode = (v_strZipcode != null && !v_strZipcode.isEmpty()) ? Integer.parseInt(v_strZipcode) : 0;
            int v_supplierId = (v_strSupplierId != null && !v_strSupplierId.isEmpty()) ? Integer.parseInt(v_strSupplierId) : 0;
            int v_quantity = (v_strQuantity != null && !v_strQuantity.isEmpty()) ? Integer.parseInt(v_strQuantity) : 0;
            
            List<inventory> inventoryList = inventory.searchInventory(v_streetname, v_city, v_zipcode, v_region, v_supplierId, v_quantity);
            
            System.out.println("Converted SupplierId: " + v_supplierId);
            System.out.println("Inventory List Size: " + inventoryList.size());
        %>
        
        <h2>Search Results:</h2>
        
        <%
            if (inventoryList.isEmpty()) {
        %>
            <p>No matching inventory found.</p>
        <%
            } else {
        %>
            <table border="1">
                <tr>
                    <th>Product ID</th>
                    <th>Street Name</th>
                    <th>City</th>
                    <th>Zip Code</th>
                    <th>Region</th>
                    <th>Supplier ID</th>
                    <th>Quantity in Stock</th>
                    
                    
                </tr>

                <% for (inventory thisInventory : inventoryList) { %>
                    <tr>
                        <td><%= thisInventory.productid %></td>
                        <td><%= thisInventory.streetname %></td>
                        <td><%= thisInventory.city %></td>
                        <td><%= thisInventory.zipcode %></td>
                        <td><%= thisInventory.region %></td>
                        <td><%= thisInventory.supplierid %></td>
                        <td><%= thisInventory.quantityinstock %></td>
                        
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="searchinventory.jsp"><input type="button" value="Search for Another Inventory"></a>
    </body>
</html>
