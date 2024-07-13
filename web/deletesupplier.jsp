<%-- 
    Document   : deletesupplier
    Created on : 11 18, 23, 5:58:55 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a Supplier</title>
    </head>
    <body>
        <form action="deletesupplier_processing.jsp">
            <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
            <h1>Input supplier ID to be deleted</h1>
            <%
                A.getSupplier();
            %>
            Supplier ID: <select id="suppliers" name="suppliers">
                <%for (int i = 0; i < A.supplier_idlist.size(); i++) {%>
                    <option value="<%=A.supplier_idlist.get(i)%>"> <%=A.supplier_idlist.get(i)%>: <%=A.completename_list.get(i)%></option>
                <%}%>
            </select><br>
            <input type="submit" value="Submit">
        </form>
        <button onclick ="window.location.href = 'suppliermenu.html';"> Cancel </button>
    </body>
</html>
