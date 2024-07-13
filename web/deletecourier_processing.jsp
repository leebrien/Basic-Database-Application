<%-- 
    Document   : deletecourier_processing
    Created on : 11 22, 23, 12:06:02 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Courier</title>
    </head>
    <body>
        <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
        
        
        <% 
            String v_courierid = request.getParameter("courierid");
            
            int status = C.delete_courier(v_courierid);
        
        if (status == 1){ %>
            
            <h1>Courier Deleted Successfully</h1>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            <a href="deletecourier.html"><input type="button" value="Delete Another Courier"></a>
        <% } 
        
        else { %>
            
            <h1>Courier Deletion Unsuccessful</h1>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            <a href="deletecourier.html"><input type="button" value="Delete Another Courier"></a>
        <% } %>
            
    </body>
</html>
