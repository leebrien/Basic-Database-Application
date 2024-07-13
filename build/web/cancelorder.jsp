<%-- 
    Document   : cancelorder
    Created on : 11 21, 23, 6:30:40 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel an Order</title>
    </head>
    <body>
        <form action="cancelorder_processing.jsp">
            <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
            Order      :<select id="orderid" name="orderid">
                
                <option value=""></option>
                
                <%
                    O.getOrders();
                    for(int i = 0; i < O.order_idlist.size(); i++){
                %>
                    <option value="<%=O.order_idlist.get(i)%>"><%=O.order_idlist.get(i)%></option>
                <%
                    }
                %>
            </select><br>
        
            <input type="submit" value="Cancel">
            
            <a href="index.html">
                <input type="button" value="Return to Main Menu">
            </a>
        </form>
           
            
    </body>
    
</html>
