<%-- 
    Document   : viewinvinfo_processing
    Created on : 11 20, 23, 11:29:41 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Information</title>
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
                <li>Supplier ID: <%= I.supplierid %></li>
                <li>Quantity in Stock: <%= I.quantityinstock %></li>
                <li>Street Name: <%= I.streetname %></li>
                <li>City: <%= I.city %></li>
                <li>Zip Code: <%= I.zipcode %></li>
                <li>Region: <%= I.region %></li>
                
            </ul>
            
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            
            <a href="viewinvinfo.html"><input type="button" value="View Another Inventory"></a>
        <%
            } else {
        %>

            <h1>Inventory not found!</h1>
            <a href="viewinvinfo.html"><input type="button" value="Try Again"></a>
            
        <%
            }
        %>
    </body>
</html>
