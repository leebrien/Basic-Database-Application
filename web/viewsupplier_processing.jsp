<%-- 
    Document   : viewsupplier_processing
    Created on : 11 21, 23, 3:22:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier Details</title>
    </head>
    <body>
        
        <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
        <%
            Integer v_supplierid = Integer.parseInt(request.getParameter("supplieridU"));

            S.supplierid = v_supplierid;

            // Call the method to retrieve product information
            int status = S.getSupplierInformation();

            // Check if information retrieval was successful
            if (status == 1) {
        %>

            <h1>Product Information</h1>
            <ul>
                <li>Supplier ID: <%= S.supplierid %></li>
                <li>Supplier Last Name: <%= S.lastname %></li>
                <li>Supplier First Name <%= S.firstname %></li>
                <li>Supplier Middle Name <%= S.middlename %></li>
                <li>Supplier Contact <%= S.contact %></li>
                <li>Supplier Street Name <%= S.streetname %></li>
                <li>Supplier City <%= S.city %></li>
                <li>Supplier Zip Code <%= S.zipcode %></li>
                <li>Supplier Region <%= S.region %></li>
                
            </ul>
            
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            
            <a href="viewsupplier.jsp"><input type="button" value="View Another Supplier"></a>
        <%
            } else {
        %>

            <h1>Product not found!</h1>
            <a href="viewproduct.html"><input type="button" value="Try Again"></a>
            
        <%
            }
        %>
    </body>
</html>
