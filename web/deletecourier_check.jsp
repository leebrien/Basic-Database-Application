<%-- 
    Document   : deletecourier_check
    Created on : 11 21, 23, 10:59:57 PM
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
            String v_courierid = request.getParameter("courier");

            C.courier_id = Integer.valueOf(v_courierid);

            // Call the method to retrieve product information
            int status = C.view_courier();

            // Check if information retrieval was successful
            if (status == 1) {
                
            boolean isUsed = C.check_courier(Integer.valueOf(v_courierid));
        %>

            <h1>Courier Information</h1>
            <ul>
                <li>Company ID: <%= C.courier_id %></li>
                <li>Company Name: <%= C.courier_companyname %></li>
                <li>Contact: <%= C.courier_contact %></li>
                <li>Location:</li>
                <li>Street Name: <%= C.courier_streetname %></li>
                <li>City: <%= C.courier_city %></li>
                <li>Zip Code: <%= C.courier_zipcode %></li>
                <li>Region: <%= C.courier_region %></li>
            </ul>
            
            <% if(!isUsed) { %>

            <a href="couriersmenu.html"><input type="button" value="Back to Couriers Menu"></a>
            
            <a href="deletecourier_processing.jsp?courierid=<%= v_courierid %>"><input type="button" value="Delete"></a>

            <% } else { %>
            
            <h2>Courier is being used, it cannot be deleted!</h2>
            <a href="deletecourier.html"><input type="button" value="Return"></a>
            
            <% } %>
        <%
            } else {
        %>

            <h1>Courier not found!</h1>
            <a href="deletecourier.html"><input type="button" value="Try Again"></a>
            
        <%
            }
        %>
    </body>
</html>
