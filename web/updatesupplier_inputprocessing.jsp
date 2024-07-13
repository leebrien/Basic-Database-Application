<%-- 
    Document   : updatesupplier_inputprocessing
    Created on : 11 20, 23, 5:17:07 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Updated Supplier Information</title>
    </head>
    <body>
        <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>

        <%
            String temp = request.getParameter("supplieridU");
         

            A.supplierid = Integer.valueOf(temp);

            // Call the method to retrieve product information
            int status = A.getSupplierInformation();

            // Check if information retrieval was successful
            if (status == 1) {
        %>
        
            <h1>Supplier Information</h1>
            <form action="updatesupplier_processing.jsp" method="post">
                <ul>
                    <li>Supplier ID: <%= A.supplierid %></li>

                    <input type="hidden" name="old_lastname" value="<%= A.lastname %>">
                    <input type="hidden" name="old_firstname" value="<%= A.firstname %>">
                    <input type="hidden" name="old_middlename" value="<%= A.middlename %>">
                    <input type="hidden" name="old_contact" value="<%= A.contact %>">
                    <input type="hidden" name="old_streetname" value="<%= A.streetname %>">
                    <input type="hidden" name="old_city" value="<%= A.city %>">
                    <input type="hidden" name="old_zipcode" value="<%= A.zipcode %>">
                    <input type="hidden" name="old_region" value="<%= A.region %>">
                    <input type="hidden" name="supplierid" value="<%=A.supplierid%>">

                    <li>Supplier Last Name:  <input type="text" name="lastname" value="<%= A.lastname %>" required ></li>
                    <li>Supplier First Name: <input type="text" name="firstname" value="<%= A.firstname %>" required></li>
                    <li>Supplier Middle Name: <input type="text" name="middlename" value="<%= A.middlename %>" required></li>
                    <li>Supplier Contact Number: <input type="text" name="contact" value="<%= A.contact %>" required></li>
                    <li>Supplier Street Name: <input type="text" name="streetname" value="<%= A.streetname %>" required></li>
                    <li>Supplier City: <input type="text" name="city" value="<%= A.city %>" required></li>
                    <li>Supplier Zip Code:  <input type="text" name="zipcode" value="<%= A.zipcode %>" required></li>
                    <li>Supplier Region:  <input type="text" name="region" value="<%= A.region%>" required></li>

                </ul>

                <input type="submit" value="Update">
            </form>

            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <%
            } else {
        %>

            <h1>Supplier not found!</h1>
            <a href="updatesupplier.jsp"><input type="button" value="Try Again"></a>

        <%
            }
        %>
    </body>
</html>
