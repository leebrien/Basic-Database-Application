<%-- 
    Document   : searchinventory
    Created on : 11 21, 23, 3:35:13 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Inventory</title>
    </head>
    <body>
        <form action="searchinventory_processing.jsp">
            <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
            <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
            Street Name            :<input type="text" id="streetname" name="streetname"/><br>
            City          :<input type="text" id="city" name="city"/><br>
            Zip Code          :<input type="text" id="zipcode" name="zipcode"/><br>
            Region          :<input type="text" id="region" name="region"/><br>
            Quantity in Stock          :<input type="text" id="quantityinstock" name="quantityinstock"/><br>
            Supplier      :<select id="supplierid" name="supplierid">
                
                <option value=""></option>
                
                <%
                    S.getSupplier();
                    for(int i = 0; i < S.supplier_idlist.size(); i++){
                %>
                    <option value="<%=S.supplier_idlist.get(i)%>"><%=S.supplier_idlist.get(i)%> : <%=S.completename_List.get(i)%></option>
                <%
                    }
                %>
            </select><br>
            <input type="submit" value="Search">
            
            <a href="index.html">
                <input type="button" value="Return to Main Menu">
            </a>
        </form>
    </body>
</html>
