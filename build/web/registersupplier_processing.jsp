<%-- 
    Document   : registersupplier_processing
    Created on : 11 15, 23, 9:50:35 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Supplier Processing</title>
    </head>
    <body>
        <form action="suppliermenu.html">
            <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
            <%
                String v_supplier_lastname = request.getParameter("lastname");
                String v_supplier_firstname = request.getParameter("firstname");
                String v_supplier_middlename = request.getParameter("middlename");
                String v_supplier_contact = request.getParameter("contact");
                String v_supplier_streetname = request.getParameter("streetname");
                String v_supplier_city = request.getParameter("city");
                String v_supplier_zipcode = request.getParameter("zipcode");
                String v_supplier_region = request.getParameter("region");
                
                A.lastname = v_supplier_lastname;
                A.firstname = v_supplier_firstname;
                A.middlename = v_supplier_middlename;
                A.contact = v_supplier_contact;
                A.streetname = v_supplier_streetname;
                A.city = v_supplier_city;
                A.zipcode = Integer.parseInt(v_supplier_zipcode);
                A.region = v_supplier_region;
                
                int status = A.register_supplier();
                if (status == 1) {
            %>
            <h1>Registering Supplier Successful</h1>
            <p>Supplier Details:</p>
            <ul>S
                <li>Last Name: <%= A.lastname %></li>
                <li>First Name: <%= A.firstname %></li>
                <li>Middle Name: <%= A.middlename %></li>
                <li>Contact: <%= A.contact %></li>
                <li>Street Name: <%= A.streetname %></li>
                <li>City: <%= A.city %></li>
                <li>Zip Code: <%= A.zipcode %></li>
                <li>Region: <%= A.region %></li>
            </ul>
            <%} else {
            %>
            <h1>Registering Supplier Failed </h1>
            <%
                }
            %>
            <input type="submit" value="Return to supplier menu">
        </form>
    </body>
</html>