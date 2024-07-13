<%-- 
    Document   : updatesupplier_processing
    Created on : 11 19, 23, 11:10:26 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Product</title>
    
</head>
<body>
    <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
    <%
        // Retrieve parameters from the form submission
        String supplierid = request.getParameter("supplierid");
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String middlename = request.getParameter("middlename");
        String contact = request.getParameter("contact");
        String streetname = request.getParameter("streetname");
        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");
        String region = request.getParameter("region");

        // Validate that all fields are provided
        if (lastname.isEmpty() || firstname.isEmpty() || middlename.isEmpty() || contact.isEmpty() || streetname.isEmpty() || city.isEmpty() || zipcode.isEmpty() || region.isEmpty()) {

    %>
        <h1>All fields are required. Please provide values for all fields.</h1>
        <a href="updatesupplier_inputprocessing.jsp?supplierid=<%= A.supplierid %>"><input type="button" value="Back to Update"></a>
    <%
        } else {
            // Proceed with data type validation
            try {
                // Parse values to check data type
                int zip = Integer.parseInt(zipcode);
                
                // Retrieve old values from hidden fields
                String old_lastname = request.getParameter("old_lastname");
                String old_firstname = request.getParameter("old_firstname");
                String old_middlename = request.getParameter("old_middlename");
                String old_contact = request.getParameter("old_contact");
                String old_streetname = request.getParameter("old_streetname");
                String old_city = request.getParameter("old_city");
                String old_zipcode = request.getParameter("old_zipcode");
                String old_region = request.getParameter("old_region");

                // Retrieve new values from the submitted form
                String new_lastname = request.getParameter("lastname");
                String new_firstname = request.getParameter("firstname");
                String new_middlename = request.getParameter("middlename");
                String new_contact = request.getParameter("contact");
                String new_streetname = request.getParameter("streetname");
                String new_city = request.getParameter("city");
                String new_zipcode = request.getParameter("zipcode");
                String new_region = request.getParameter("region");

         
                int updateStatus = A.updateSupplier(new_lastname, new_firstname, new_middlename, new_contact, new_streetname, new_city, Integer.parseInt(new_zipcode), new_region, Integer.parseInt(supplierid));


                // Check if the update was successful
                if (updateStatus == 1) {
    %>
                <h1>Supplier Updated Successfully!</h1>

                <table border="1">
                    <caption>Old Values</caption>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Supplier ID</td>
                        <td><%= supplierid %></td>
                    </tr>
                    <tr>
                        <td>Supplier Last Name</td>
                        <td><%= old_lastname %></td>
                    </tr>
                    <tr>
                        <td>Supplier First Name</td>
                        <td><%= old_firstname %></td>
                    </tr>
                    <tr>
                        <td>Supplier Middle Name</td>
                        <td><%= old_middlename %></td>
                    </tr>
                    <tr>
                        <td>Supplier Street Name</td>
                        <td><%= old_streetname %></td>
                    </tr>
                    <tr>
                        <td>Supplier City</td>
                        <td><%= old_city %></td>
                    </tr>
                    <tr>
                        <td>Supplier Zip Code</td>
                        <td><%= old_zipcode %></td>
                    </tr>
                    <tr>
                        <td>Supplier Region</td>
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
                        <td>Supplier ID</td>
                        <td><%= supplierid %></td>
                    </tr>
                    <tr>
                        <td>Supplier Last Name</td>
                        <td><%= new_lastname %></td>
                    </tr>
                    <tr>
                        <td>Supplier First Name</td>
                        <td><%= new_firstname %></td>
                    </tr>
                    <tr>
                        <td>Supplier Middle Name</td>
                        <td><%= new_middlename %></td>
                    </tr>
                    <tr>
                        <td>Supplier Street Name</td>
                        <td><%= new_streetname %></td>
                    </tr>
                    <tr>
                        <td>Supplier City</td>
                        <td><%= new_city %></td>
                    </tr>
                    <tr>
                        <td>Supplier Zip Code</td>
                        <td><%= new_zipcode %></td>
                    </tr>
                    <tr>
                        <td>Supplier Region</td>
                        <td><%= new_region %></td>
                    </tr>
                </table>
                    <br>
                <a href="index.html"><input type="button" value="Back to Main Menu"></a>
                <a href="updatesupplier.jsp"><input type="button" value="Update Another Supplier"></a>
    <%
                } else {
    %>
                    <h1>Error Updating Supplier!</h1>
                    <a href="updatesupplier_inputprocessing.jsp?supplierid=<%= A.supplierid %>"><input type="button" value="Try Again"></a>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h1>Invalid data type. Please provide valid values for Supplier fields.</h1>
                <a href="updatesupplier_inputprocessing.jsp?supplierid=<%= A.supplierid %>"><input type="button" value="Back to Update"></a>
    <%
            }
        }
    %>
 
</body>
</html>
