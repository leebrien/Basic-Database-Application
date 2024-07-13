<%-- 
    Document   : updatecourier_inputprocessing
    Created on : 11 20, 23, 2:25:30 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Updated Courier Information</title>
    </head>
    <body>
        <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>

        <%
            String temp = request.getParameter("courier");
         

            C.courier_id = Integer.valueOf(temp);

            // Call the method to retrieve product information
            int status = C.view_courier();

            // Check if information retrieval was successful
            if (status == 1) {
        %>
        
            <h1>Courier Information</h1>
            <form action="updatecourier_processing.jsp" method="post">
                <ul>
                    <li>Courier ID: <%= C.courier_id %></li>

                    <input type="hidden"    name="old_companyname"  value="<%= C.courier_companyname %>">
                    <input type="hidden"    name="old_contact"      value="<%= C.courier_contact %>">
                    <input type="hidden"    name="old_streetname"   value="<%= C.courier_streetname %>">
                    <input type="hidden"    name="old_city"         value="<%= C.courier_city %>">
                    <input type="hidden"    name="old_zipcode"      value="<%= C.courier_zipcode %>">
                    <input type="hidden"    name="old_region"       value="<%= C.courier_region %>">
                    <input type="hidden"    name="courierid"        value="<%= C.courier_id %>">

                    <li>Courier Company Name:   <input type="text"  name="companyname"  value="<%= C.courier_companyname %>" required ></li>
                    <li>Courier Contact Number: <input type="text"  name="contact"      value="<%= C.courier_contact %>" required></li>
                    <li>Courier Street Name:    <input type="text"  name="streetname"   value="<%= C.courier_streetname %>" required></li>
                    <li>Courier City:           <input type="text"  name="city"         value="<%= C.courier_city %>" required></li>
                    <li>Courier Zip Code:       <input type="text"  name="zipcode"      value="<%= C.courier_zipcode %>" required></li>
                    <li>Courier Region:         <input type="text"  name="region"       value="<%= C.courier_region %>" required></li>

                </ul>

                <input type="submit" value="Update">
            </form>

            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <%
            } else {
        %>

            <h1>Courier not found!</h1>
            <a href="updatecourier.jsp"><input type="button" value="Try Again"></a>

        <%
            }
        %>
    </body>
</html>