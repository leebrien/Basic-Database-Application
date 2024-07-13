<%-- 
    Document   : deletecourier
    Created on : 11 20, 23, 10:05:49 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, couriersmgt.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a Courier</title>
    </head>
    <body>
        <form action="deletecourier_check.jsp">
            <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
            <% C.get_courier(); %>
            Courier: <select id="courier" name="courier">
                <% for(int i = 0; i < C.courier_idlist.size(); i++){ %>
                    <option value="<%=C.courier_idlist.get(i)%>"> <%=C.courier_idlist.get(i)%>: <%=C.courier_companynamelist.get(i)%></option>
                <% } %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick="window.location.href='couriersmenu.html';"> Cancel </button>
    </body>
</html>

