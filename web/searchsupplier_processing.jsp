<%-- 
    Document   : searchsupplier_processing
    Created on : 11 21, 23, 6:18:58 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search by Filter</title>
    </head>
    <body>
        <form>
        <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
        <%
            boolean lFlag = false, fFlag = false, cFlag = false;
            
            String lastname = request.getParameter("lastname");
            String firstname = request.getParameter("firstname");
            String city = request.getParameter("city");
            
            if (lastname != null && lastname.isEmpty() == false) {
                lFlag = true;
            }
            if (firstname != null && firstname.isEmpty() == false) {
                fFlag = true;
            }
            if (city != null && city.isEmpty() == false) {
                cFlag = true;
            }
            
            ArrayList<supplier> supplierList= A.checkSuppliers(lFlag, fFlag, cFlag, lastname, firstname, city);
            
            //List<supplier> = supplier.getList(criteria);
        %>
        
        <h2>Search Results:</h2>
        
        <%
            if (supplierList.isEmpty()) {
        %>
            <p>No matching supplier found.</p>
        <%
            } else {
        %>
            <table border="1">
                <tr>
                    <th>Supplier ID</th>
                    <th>Supplier Last Name</th>
                    <th>Supplier First Name</th>
                    <th>Supplier Contact</th>
                    <th>Supplier Street Name</th>
                    <th>Supplier City</th>
                    <th>Supplier Zip Code</th>
                    <th>Supplier Region</th>
                    
                    
                </tr>

                <% for (supplier thisSupplier : supplierList) { %>
                    <tr>
                        <td><%= thisSupplier.supplierid %></td>
                        <td><%= thisSupplier.lastname %></td>
                        <td><%= thisSupplier.firstname %></td>
                        <td><%= thisSupplier.middlename %></td>
                        <td><%= thisSupplier.contact %></td>
                        <td><%= thisSupplier.streetname %></td>
                        <td><%= thisSupplier.city %></td>
                        <td><%= thisSupplier.zipcode %></td>
                        <td><%= thisSupplier.region %></td>
                        
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="searchsupplier.html"><input type="button" value="Search for Another Supplier"></a>
        </form>
    </body>
</html>
