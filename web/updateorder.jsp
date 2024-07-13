<%-- 
    Document   : updateorder
    Created on : 11 21, 23, 6:59:15 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update an Order</title>
    </head>
    <body>
        <form action="updateorder_processing.jsp">
            <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
            Order      :<select id="orderid" name="orderid">
                
                <%
                    O.getPOrders();
                    for(int i = 0; i < O.order_idlist.size(); i++){
                %>
                    <option value="<%=O.order_idlist.get(i)%>"><%=O.order_idlist.get(i)%></option>
                <%
                    }
                %>
            </select><br>
        
            <input type="submit" value="Update">
            
            <a href="index.html">
                <input type="button" value="Return to Main Menu">
            </a>
        </form>
    </body>
</html>
