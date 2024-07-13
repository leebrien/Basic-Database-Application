<%-- 
    Document   : create_processing
    Created on : 11 16, 23, 11:21:40 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Inventory</title>
    </head>
    <body>
         <form action="index.html">
            <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
            <%
                String v_streetname = request.getParameter("streetname");
                String v_city = request.getParameter("city");
                Integer v_zipcode = Integer.parseInt(request.getParameter("zipcode"));
                String v_region = request.getParameter("region");
                Integer v_supplierid = Integer.parseInt(request.getParameter("supplierid"));
                Integer v_quantity = Integer.parseInt(request.getParameter("quantityinstock"));
                
                I.streetname = v_streetname;
                I.city = v_city;
                I.zipcode = v_zipcode;
                I.region = v_region;
                I.supplierid = v_supplierid;
                I.quantityinstock = v_quantity;
                
                int status = I.createinventory();
                if (status == 1) {
            %>
            <h1>Creating Inventory Successful</h1>
            <p>Inventory Details:</p>
            <ul>
                <li>Supplier ID: <%= I.supplierid %></li>
                <li>Quantity in Stock: <%= I.quantityinstock %></li>
                <li>Inventory Street Name: <%= I.streetname %></li>
                <li>Inventory City: <%= I.city %></li>
                <li>Inventory Zip Code: <%= I.zipcode %></li>
                <li>Inventory Region <%= I.region %></li>
               
            </ul>
            <%} else {
            %>
            <h1>Creating Inventory Unsuccessful </h1>
            <%
                }
            %>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>
