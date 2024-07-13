<%-- 
    Document   : updatecourier_processing
    Created on : 11 22, 23, 3:18:59 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Courier</title>
    
</head>
<body>
    <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
    <%
        // Retrieve parameters from the form submission
        String courierid    = request.getParameter("courierid");
        String companyname  = request.getParameter("companyname");
        String contact      = request.getParameter("contact");
        String streetname   = request.getParameter("streetname");
        String city         = request.getParameter("city");
        String zipcode      = request.getParameter("zipcode");
        String region       = request.getParameter("region");

        // Validate that all fields are provided
        if (companyname.isEmpty() || contact.isEmpty() || streetname.isEmpty() || city.isEmpty() || zipcode.isEmpty() || region.isEmpty()) {

    %>
        <h1>All fields are required. Please provide values for all fields.</h1>
        <a href="updatecourier_inputprocessing.jsp?courierid=<%= C.courier_id %>"><input type="button" value="Back to Update"></a>
    <%
        } else {
            // Proceed with data type validation
            try {
                // Parse values to check data type
                int zip = Integer.parseInt(zipcode);
                
                // Retrieve old values from hidden fields
                String old_companyname  = request.getParameter("old_companyname");
                String old_contact      = request.getParameter("old_contact");
                String old_streetname   = request.getParameter("old_streetname");
                String old_city         = request.getParameter("old_city");
                String old_zipcode      = request.getParameter("old_zipcode");
                String old_region       = request.getParameter("old_region");

                // Retrieve new values from the submitted form
                String new_companyname  = request.getParameter("companyname");
                String new_contact      = request.getParameter("contact");
                String new_streetname   = request.getParameter("streetname");
                String new_city         = request.getParameter("city");
                String new_zipcode      = request.getParameter("zipcode");
                String new_region       = request.getParameter("region");

         
                int Status = C.update_courier(new_companyname, new_contact, new_streetname, new_city, new_zipcode, new_region, courierid);


                // Check if the update was successful
                if (Status == 1) {
    %>
                <h1>Supplier Updated Successfully!</h1>

                <table border="1">
                    <caption>Old Values</caption>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Courier ID</td>
                        <td><%= courierid %></td>
                    </tr>
                    <tr>
                        <td>Courier Company Name</td>
                        <td><%= old_companyname %></td>
                    </tr>
                    <tr>
                        <td>Courier Street Name</td>
                        <td><%= old_streetname %></td>
                    </tr>
                    <tr>
                        <td>Courier City</td>
                        <td><%= old_city %></td>
                    </tr>
                    <tr>
                        <td>Courier Zip Code</td>
                        <td><%= old_zipcode %></td>
                    </tr>
                    <tr>
                        <td>Courier Region</td>
                        <td><%= old_region %></td>
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
                        <td>Courier ID</td>
                        <td><%= courierid %></td>
                    </tr>
                    <tr>
                        <td>Courier Company Name</td>
                        <td><%= new_companyname %></td>
                    </tr>
                    <tr>
                        <td>Courier Street Name</td>
                        <td><%= new_streetname %></td>
                    </tr>
                    <tr>
                        <td>Courier City</td>
                        <td><%= new_city %></td>
                    </tr>
                    <tr>
                        <td>Courier Zip Code</td>
                        <td><%= new_zipcode %></td>
                    </tr>
                    <tr>
                        <td>Courier Region</td>
                        <td><%= new_region %></td>
                    </tr>
                </table>
                    <br>
                <a href="index.html"><input type="button" value="Back to Main Menu"></a>
                <a href="updatecourier.jsp"><input type="button" value="Update Another Courier"></a>
    <%
                } else {
    %>
                    <h1>Error Updating Courier!</h1>
                    <a href="updatecourier_inputprocessing.jsp?courierid=<%= C.courier_id %>"><input type="button" value="Try Again"></a>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h1>Invalid data type. Please provide valid values for Courier fields.</h1>
                <a href="updatecourier_inputprocessing.jsp?courierid=<%= C.courier_id %>"><input type="button" value="Back to Update"></a>
    <%
            }
        }
    %>
 
</body>
</html>
