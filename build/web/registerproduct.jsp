<%-- 
    Document   : registerproduct
    Created on : 11 18, 23, 2:42:02 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register a Product</title>
    </head>
    <body>
        <form action="registerproduct_processing.jsp">
            <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
            <jsp:useBean id="C" class="suppliermanagement.category" scope="session"/>
            Product Name            :<input type="text" id="productname" name="productname" required/><br>
            Product Description     :<input type="text" id="description" name="description"/><br>
            Product Price           :<input type="text" id="price" name="price" required/><br>
            Product's Supplier      :<select id="supplierid" name="supplierid">
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
                <%
                    C.getCategory();
                    for(int i = 0; i < C.category_idlist.size(); i++){
                %>
                    <option value="<%=C.category_idlist.get(i)%>"><%=C.category_idlist.get(i)%> : <%=C.category_namelist.get(i)%></option>
                <%
                    }
                %>
            </select><br>
        
            <input type="submit" value="Submit">
        </form>
    </body>
</html>