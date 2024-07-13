<%-- 
    Document   : update_processing
    Created on : 11 20, 23, 11:39:27 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Inventory</title>
    </head>
    <body>
        <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
        <%
        // Retrieve parameters from the form submission
        String quantityStr = request.getParameter("quantityinstock");
        String streetname = request.getParameter("streetname");
        String city = request.getParameter("city");
        String zipcodeStr = request.getParameter("zipcode");
        String region = request.getParameter("region");

        // Validate that all fields are provided
        if (streetname == null || city == null || zipcodeStr == null || region == null || quantityStr == null ||
            streetname.isEmpty() || city.isEmpty() || zipcodeStr.isEmpty() || region.isEmpty() || quantityStr.isEmpty()) {
    %>
    <h1>All fields are required. Please provide values for all fields.</h1>
        <a href="updateinventory.jsp?productid=<%= I.productid %>"><input type="button" value="Back to Update"></a>
        <%
        } else {
            // Proceed with data type validation
            try {
                // Parse values to check data type
                int quantityinstock = Integer.parseInt(quantityStr);
                int zipcode = Integer.parseInt(zipcodeStr);
                
                int oldQuantity = Integer.parseInt(request.getParameter("old_quantity"));
                String oldStreetName = request.getParameter("old_streetname");
                String oldCity = request.getParameter("old_city");
                int oldZipcode = Integer.parseInt(request.getParameter("old_zipcode"));
                String oldRegion = request.getParameter("old_region");

                // Retrieve new values from the submitted form
                int new_quantity = Integer.parseInt(request.getParameter("quantityinstock"));
                String new_streetname = request.getParameter("streetname");
                String new_city = request.getParameter("city");
                int new_zipcode = Integer.parseInt(request.getParameter("zipcode"));
                String new_region = request.getParameter("region");

                int updateStatus = I.updateInventory(new_quantity, new_streetname, new_city, new_zipcode, new_region);


                // Check if the update was successful
                if (updateStatus == 1) {
    %>
        <h1>Inventory Updated Successfully!</h1>

                <table border="1">
                    <caption>Old Values</caption>
                    <tr>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Street Name</td>
                        <td><%= oldStreetName %></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><%= oldCity %></td>
                    </tr>
                    <tr>
                        <td>Zip Code</td>
                        <td><%= oldZipcode%></td>
                    </tr>
                    <tr>
                        <td>Region</td>
                        <td><%= oldRegion %></td>
                    </tr>
                    <tr>
                        <td>Quantity In Stock</td>
                        <td><%= oldQuantity %></td>
                    </tr>
                </table>
                    <br>
                <table border="1">
                    <caption>New Values</caption>
                    <tr>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Street Name</td>
                        <td><%= new_streetname %></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><%= new_city %></td>
                    </tr>
                    <tr>
                        <td>Zip Code</td>
                        <td><%= new_zipcode %></td>
                    </tr>
                    <tr>
                        <td>Region</td>
                        <td><%= new_region %></td>
                    </tr>
                    <tr>
                        <td>Quantity In Stock</td>
                        <td><%= new_quantity %></td>
                    </tr>
                </table>
                    <br>
                <a href="index.html"><input type="button" value="Back to Main Menu"></a>
                <a href="updateinventory.html"><input type="button" value="Update Another Inventory"></a>
    <%
                } else {
    %>
                    <h1>Error Updating Inventory!</h1>
                    <a href="updateinventory.jsp?productid=<%= I.productid %>"><input type="button" value="Try Again"></a>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h1>Invalid data type. Please provide valid numeric values for Zip Code and Quantity in Stock.</h1>
                <a href="updateinventory.jsp?productid=<%= I.productid %>"><input type="button" value="Back to Update"></a>
    <%
            }
        }
    %>
        
    </body>
</html>
