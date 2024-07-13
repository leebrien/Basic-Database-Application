<%-- 
    Document   : deleteinventory
    Created on : 11 21, 23, 2:30:00 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Inventory</title>
    </head>
    <body>
        <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
        <%
            Integer v_productid = Integer.parseInt(request.getParameter("productid"));

            I.productid = v_productid;

            // Call the method to retrieve product information
            int status = I.viewInventoryInformation();

            // Check if information retrieval was successful
            if (status == 1) {
                
        %>

            <h1>Inventory Information</h1>
            <ul>
                <li>Product ID: <%= I.productid %></li>
                <li>Supplier ID: <%=I.supplierid %></li>
                <li>Quantity in Stock: <%= I.quantityinstock %></li>
                <li>Street Name: <%= I.streetname %></li>
                <li>City: <%= I.city %></li>
                <li>Zip Code: <%= I.zipcode %></li>
                <li>Region: <%= I.region %></li>
            </ul>
            <%
            } else {
        %>

            <h1>Inventory not found!</h1>
            <a href="deleteinventory.html"><input type="button" value="Try Again"></a>
            
        <%
            }
        %>
    </body>
</html>
