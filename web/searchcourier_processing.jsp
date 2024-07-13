<%-- 
    Document   : searchcourier_processing
    Created on : 11 22, 23, 4:17:22 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search by Filter</title>
    </head>
    <body>
        <form>
        <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
        <%
            boolean cFlag = false, ciFlag = false, rFlag = false;
            
            String companyname = request.getParameter("companyname");
            String city = request.getParameter("city");
            String region = request.getParameter("region");
            
            if (companyname != null && companyname.isEmpty() == false) {
                cFlag = true;
            }
            if (city != null && city.isEmpty() == false) {
                ciFlag = true;
            }
            if (region != null && region.isEmpty() == false) {
                rFlag = true;
            }
            
            ArrayList<couriers> couriersList= C.checkCouriers(cFlag, ciFlag, rFlag, companyname, city, region);
            
            //List<supplier> = supplier.getList(criteria);
        %>
        
        <h2>Search Results:</h2>
        
        <%
            if (couriersList.isEmpty()) {
        %>
            <p>No matching courier found.</p>
        <%
            } else {
        %>
            <table border="1">
                <tr>
                    <th>Courier ID</th>
                    <th>Company Name</th>
                    <th>Contact</th>
                    <th>Street Name</th>
                    <th>City</th>
                    <th>Zip Code</th>
                    <th>Region</th>
                    
                    
                </tr>

                <% for (couriers thisCourier : couriersList) { %>
                    <tr>
                        <td><%= thisCourier.courier_id %></td>
                        <td><%= thisCourier.courier_companyname %></td>
                        <td><%= thisCourier.courier_contact %></td>
                        <td><%= thisCourier.courier_streetname %></td>
                        <td><%= thisCourier.courier_city %></td>
                        <td><%= thisCourier.courier_zipcode %></td>
                        <td><%= thisCourier.courier_region %></td>
                        
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="searchcourier.jsp"><input type="button" value="Search for Another Courier"></a>
        </form>
    </body>
</html>
