<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>E-Commerce Checkout summary </title>
    </head>

    
        <%--<jsp:include page="/Shoppingcart" />--%> 
        <form action="checkout.jsp" method="post">
        <h1>E-Commerce View Cart Page</h1>
        <hr>
        
        
        
        <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:8888/csc4370projectdb"
        user="root" password=""
    />
     
    <sql:query var="listofItems"   dataSource="${myDS}">
        SELECT * FROM cartdb;
    </sql:query>
    <sql:query var="listofLogins"   dataSource="${myDS}">
        SELECT * FROM logindb;
    </sql:query>
    

    <c:forEach var="logindb" items="${listofLogins.rows}">
        <h2>You are Checking out for user: "<u>${logindb.lgname}</u>"</h2>
        
        
    </c:forEach>
        
        <h2>Item In Cart Ready to Checkout are as follows:</h2>
     
    <div>
        <table border="1" cellpadding="5">
            <!--<caption><u><h2>List of Items</h2></u></caption>-->
            <tr bgcolor="#FFFF00">
                <th>Item Name</th>
                <th>Item Image</th>
                <th>Item Quantity</th>
                <th>Item Price</th>
<!--                <th>Item Action</th>-->
            </tr>
            
            <c:forEach var="cartdb" items="${listofItems.rows}">
                
                <tr>
                    <td><c:out value="${cartdb.cname}" /></td>
                    <td style="width:20px; height:20px; text-align:center; vertical-align:middle">
    <img src="<c:out value="${cartdb.cimage}" />"  style="max-height:100%; max-width:100%"/>   

                    <td><c:out value="${cartdb.cquantity}" /></td>
                    <td>$<c:out value="${cartdb.cprice}" /></td>
                    
                </tr>
            </c:forEach>
        </table>
    </div>
        <br>
        
    </form>
        
        
        
      <form>
            <br>
        <button type="Submit" name="Enter" value="clearcart"onclick="document.getElementById('success.jsp').submit()" />Confirm Checkout</button>
        </form>
        <c:set var="iNAME"><%=request.getParameter("Enter") %></c:set>
        <%
        String buttonClicked=(String)pageContext.getAttribute("iNAME");
        if(buttonClicked.equalsIgnoreCase("clearcart")){
            Connection conn = null;
            
//            writer.println("Clear!");
//            writer.close();
        
            String url = "jdbc:mysql://localhost:8888/csc4370projectdb";
            Class.forName ("com.mysql.jdbc.Driver").newInstance ();
            conn = DriverManager.getConnection (url, "root", "");
            System.out.println ("Database connection established");
            
            //String query = "SELECT * FROM cartdb";
            Statement connstatement = conn.createStatement();
            //ResultSet dbresult = connstatement.executeQuery(query);
            connstatement.executeUpdate("TRUNCATE cartdb");
            connstatement.close();
        
            String site = "CheckoutSuccess.jsp" ;
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site); 
            
            
        }
        %>
        
   
         <sql:update var="copytables"   dataSource="${myDS}">
          INSERT INTO checkoutdbsuccess 
        SELECT logindb.lgname, cname, cquantity, cprice FROM logindb,cartdb
        ;
    </sql:update>
        <br><br>
        <a href="login.jsp">[User Login]</a><br>
        <a href="register.jsp">[Not a User? Register Here!]</a><br>
        <a href="inventory.jsp">[Item Inventory]</a>
         <a href="profile.jsp">[User Profile]</a>
        <a href="viewcart.jsp">[View Cart]</a>
        <br><hr><br>
        <h3><a href="menu.jsp">[Back to Main Menu]</a></h3>
        
    
</html>
