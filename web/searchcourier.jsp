<%-- 
    Document   : searchcourier
    Created on : 11 22, 23, 4:16:02 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search for a Courier</title>
    </head>
    <body>
        <form action="searchcourier_processing.jsp">
            <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
            Company Name            :<input type="text" id="companyname" name="companyname"/><br>
            City                    :<input type="text" id="city" name="city"/><br>
            Region                  :<input type="text" id="region" name="region"/><br>
        
            <input type="submit" value="Search">
            
            <a href="couriersmenu.html">
                <input type="button" value="Return to Couriers Menu">
            </a>
        </form>
    </body>
</html>
