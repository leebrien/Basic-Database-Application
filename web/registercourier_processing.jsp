<%-- 
    Document   : registercourier_processing
    Created on : 11 17, 23, 6:02:42 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Courier Processing</title>
    </head>
    <body>
        <form action="couriersmenu.html">
            <jsp:useBean id="A" class="couriersmgt.couriers" scope="session"/>
            <%
                String v_courier_companyname    = request.getParameter("companyname");
                String v_courier_contact        = request.getParameter("contact");
                String v_courier_streetname     = request.getParameter("streetname");
                String v_courier_city           = request.getParameter("city");
                String v_courier_zipcode        = request.getParameter("zipcode");
                String v_courier_region         = request.getParameter("region");
                
                A.courier_companyname   = v_courier_companyname;
                A.courier_contact       = v_courier_contact;
                A.courier_streetname    = v_courier_streetname;
                A.courier_city          = v_courier_city;
                A.courier_zipcode       = Integer.valueOf(v_courier_zipcode);
                A.courier_region        = v_courier_region;
                
                int status = A.register_courier();
                if (status == 1) {
            %>
            <h1>Registering Courier Successful</h1>
            <p>Courier Details:</p>
            <ul>
                <li>Courier Name: <%= A.courier_companyname %></li>
                <li>Courier Contact: <%= A.courier_contact %></li>
                <li>Street Name: <%= A.courier_streetname %></li>
                <li>City: <%= A.courier_city %></li>
                <li>Zip code: <%= A.courier_zipcode %></li>
                <li>Region: <%= A.courier_region %></li>
            </ul>
            <%} else {
            %>
            <h1>Registering Supplier Failed</h1>
            <%
                }
            %>
            <input type="submit" value="Return to Courier menu">
        </form>
            <br><br><button onclick="window.location.href = 'registercourier.html';">Register another Courier</button>
    </body>
</html>