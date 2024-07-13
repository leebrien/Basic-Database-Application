<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete an Order</title>
    </head>
    <body>
        <form action="completeorder_processing.jsp" method="post">
            <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
            Order:
            <select id="orderid" name="orderid">
                <%
                    O.getUncompleteOrders();
                    for(int i = 0; i < O.order_idlist.size(); i++){
                %>
                    <option value="<%=O.order_idlist.get(i)%>"><%=O.order_idlist.get(i)%></option>
                <%
                    }
                %>
            </select><br>

            <!-- Input field for date from NOW() -->
            Date Shipped :
            <input type="date" id="dateshipped" name="dateshipped" value="<%=java.time.LocalDate.now()%>"><br>

            <input type="submit" value="Complete Order">

            <a href="index.html">
                <input type="button" value="Return to Main Menu">
            </a>
        </form>
    </body>
</html>
