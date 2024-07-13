<%-- 
    Document   : viewcourier_processing
    Created on : 11 21, 23, 1:45:08 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courier Details</title>
    </head>
    <body>
        <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
        <%
            Integer v_courierid = Integer.parseInt(request.getParameter("courierid"));

            C.courier_id = v_courierid;

            // Call the method to retrieve product information
            int status = C.view_courier();

            // Check if information retrieval was successful
            if (status == 1) {
        %>

            <h1>Courier Information</h1>
            <ul>
                <li>Courier ID: <%= C.courier_id %></li>
                <li>Courier Name: <%= C.courier_companyname %></li>
                <li>Courier Contact: <%= C.courier_contact %></li>
                <li>Location:</li>
                <li>Street: <%= C.courier_streetname %></li>
                <li>City: <%= C.courier_city %></li>
                <li>Zip Code: <%= C.courier_zipcode %></li>
                <li>Region: <%= C.courier_region %></li>
            </ul>
            
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            
            <a href="viewcourier.html"><input type="button" value="View Another Courier"></a>
        <%
            } else {
        %>

            <h1>Courier not found!</h1>
            <a href="viewcourier.html"><input type="button" value="Try Again"></a>
            
        <%
            }
        %>
    </body>
</html>
