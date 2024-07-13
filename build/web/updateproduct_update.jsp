<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Product</title>
</head>
<body>
    <jsp:useBean id="P" class="suppliermanagement.product" scope="session"/>
    <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
    <jsp:useBean id="C" class="suppliermanagement.category" scope="session"/>
    
    <%
        Integer v_productid = Integer.parseInt(request.getParameter("productid"));

        P.productid = v_productid;

        // Call the method to retrieve product information
        int status = P.productInformation();

        // Check if information retrieval was successful
        if (status == 1) {
    %>

        <h1>Product Information</h1>
        <form action="updateproduct_processing.jsp" method="post">
            <ul>
                <li>Product ID: <%= P.productid %></li>
                
                <input type="hidden" name="old_productname" value="<%= P.productname %>">
                <input type="hidden" name="old_description" value="<%= P.description %>">
                <input type="hidden" name="old_price" value="<%= P.price %>">
                <input type="hidden" name="old_supplierid" value="<%= P.supplierid %>">
                <input type="hidden" name="old_categoryid" value="<%= P.categoryid %>">
                
                <li>Product Name: <%= P.productname %> <input type="text" name="productname" value=""></li>
                <li>Description: <%= P.description %> <input type="text" name="description" value=""></li>
                <li>Price: <%= P.price %> <input type="text" name="price" value=""></li>
                
                <li>Supplier ID: 
                    <select name="supplierid">
                        <%
                            S.getSupplier();
                            for(int i = 0; i < S.supplier_idlist.size(); i++){
                        %>
                            <option value="<%=S.supplier_idlist.get(i)%>" <%= (S.supplier_idlist.get(i) == P.supplierid) ? "selected" : "" %>><%=S.supplier_idlist.get(i)%> : <%=S.completename_List.get(i)%></option>
                        <%
                            }
                        %>
                    </select>
                </li>
                
                <li>Category ID: 
                    <select name="categoryid">
                        <%
                            C.getCategory();
                            for(int i = 0; i < C.category_idlist.size(); i++){
                        %>
                            <option value="<%=C.category_idlist.get(i)%>" <%= (C.category_idlist.get(i) == P.categoryid) ? "selected" : "" %>><%=C.category_idlist.get(i)%> : <%=C.category_namelist.get(i)%></option>
                        <%
                            }
                        %>
                    </select>
                </li>
            </ul>
            
            <input type="submit" value="Update">
        </form>
        
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
    <%
        } else {
    %>

        <h1>Product not found!</h1>
        <a href="updateproduct.html"><input type="button" value="Try Again"></a>
        
    <%
        }
    %>
</body>
</html>
