<%-- 
    Document   : completedelivery_processing
    Created on : 11 21, 23, 11:18:34 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*, java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@page import="java.time.DateTimeException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Delivery</title>
    </head>
    <body>
        <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
        <%
            try {
                int orderId = Integer.parseInt(request.getParameter("orderid"));
                String dateShippedStr = request.getParameter("dateshipped");
                
                // Validate date format
                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate currentDate = LocalDate.now();
                LocalDate dateShipped = LocalDate.parse(dateShippedStr, dateFormatter);

                if (dateShipped.isBefore(currentDate)) {
        %>
                    <h1>Error: Date Shipped cannot be before the current date</h1>
                    <a href="completeorder.jsp">
                        <input type="button" value="Try Again">
                    </a>
        <%
                } else {
                    int completeStatus = O.completeOrder(orderId, dateShippedStr);
        %>
                    <h1>Order Completed Successfully!</h1>
                    <a href="index.html">
                        <input type="button" value="Return to Main Menu">
                    </a>
        <%
                }
            } catch (NumberFormatException | DateTimeException e) {
        %>
                <h1>Error: Invalid Order ID or Date Format</h1>
                <a href="completeorder.jsp">
                    <input type="button" value="Try Again">
                </a>
        <%
            }
        %>
    </body>
</html>
