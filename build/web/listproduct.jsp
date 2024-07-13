<%-- 
    Document   : listproduct
    Created on : 11 20, 23, 4:50:31 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List for a Product</title>
    </head>
    <body>
        <form action="listproduct_processing.jsp">
            <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
            <jsp:useBean id="C" class="suppliermanagement.category" scope="session"/>
            Product's Supplier      :<select id="supplierid" name="supplierid">
                
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

            Product Category        :<select id="categoryid" name="categoryid">
                
                <option value=""></option>
                
                <%
                    C.getCategory();
                    for(int i = 0; i < C.category_idlist.size(); i++){
                %>
                    <option value="<%=C.category_idlist.get(i)%>"><%=C.category_idlist.get(i)%> : <%=C.category_namelist.get(i)%></option>
                <%
                    }
                %>
            </select><br>
        
            <input type="submit" value="List">
            
            <a href="index.html">
                <input type="button" value="Return to Main Menu">
            </a>
        </form>
    </body>
</html>
