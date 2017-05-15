<%-- 
    Document   : inventory
    Created on : Apr 18, 2015, 21:36:2 PM
    Author     : Peter
--%>



<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page import="model.Item" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Commerce Inventory Page</title>
</head>
<body>    

<%int timeing = 0;%>



<!--<script language="javascript">         
         function checkBtn(event) {
                //alert(event.target.name);
                set fso = CreateObject("Scripting.FileSystemObject");  
                set s = fso.CreateTextFile("E:\tomcat\testPro\webapps\EcommerceTest\test.txt", true);
                s.writeline(document.passForm.input.value);
                //s.writeline(document.passForm.input2.value);
                //s.writeline(document.passForm.input3.value);
                s.Close();
         }
      </script>-->
    

    <h1>E-Commerce Inventory Page</h1>
    <hr>
    <form>
    <button type="Submit" name="Enter" value="clear" />Clear Cart</button>
    <caption><h2>--- You have <u><%=request.getParameter("Enter") %></u> Cart!! ---</h2></caption>
    
        
    
    <!--<h1>E-Commerce Inventory Page</h1>-->
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:8888/csc4370projectdb"
        user="root" password=""
    />
     
    <sql:query var="listofItems"   dataSource="${myDS}">
        SELECT * FROM inventorydb;
    </sql:query>
     
    <div>
        <table border="1" cellpadding="5">
            <!--<caption><u><h2>List of Items</h2></u></caption>-->
            <tr bgcolor="#9acd32">
                <th>Item Name</th>
                <th>Item Image</th>
                <th>Item Quantity</th>
                <th>Item Price</th>
                <th>Item Action</th>
            </tr>
            
            <c:forEach var="inventorydb" items="${listofItems.rows}">
                
                <tr>
                    <td><c:out value="${inventorydb.iname}" /></td>
                    <td style="width:100px; height:100px; text-align:center; vertical-align:middle">
    <img src="<c:out value="${inventorydb.iimage}" />"  style="max-height:100%; max-width:100%"/>   

                    <td><c:out value="${inventorydb.iquantity}" /></td>
                    <td>$<c:out value="${inventorydb.iprice}" /></td>
                    <td><button type="Submit" name="Enter" value="<c:out value="${inventorydb.iname}" />" />Add to Cart</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
        </form>
    <!--<fieldset>-->
        <!--<legend>Register</legend>-->
    
      
        
    <!--<form action="Addtocart" method="post">-->
<!--	Username : <input type="text" name="usernamereg"> &nbsp&nbsp
	Password : <input type="password" name="passwordreg"> &nbsp&nbsp
		   <input type="submit" name="register" value="Register"/>-->
    <!--</fieldset>-->
    <br>
    <a href="login.jsp">[User Login]</a><br>
    <a href="register.jsp">[Not a User? Register Here!]</a><br> 
    <a href="inventory.jsp">[Item Inventory]</a>
    <a href="viewcart.jsp">[View Cart]</a>
    <br><hr><br>
    <h3><a href="menu.jsp">[Back to Main Menu]</a></h3>
    
    <!--</form>-->
        
        
        <c:set var="iNAME"><%=request.getParameter("Enter") %></c:set>
        
        <%
        String buttonClicked=(String)pageContext.getAttribute("iNAME");
        //System.out.println("hahahahah "+buttonClicked);
        //String rootsO = new File("").getAbsolutePath();
//        PrintWriter writer = new PrintWriter("test.txt", "UTF-8");
//        writer.println(buttonClicked);
//        writer.close();
        
        if((!buttonClicked.equalsIgnoreCase(null))&&(!buttonClicked.equalsIgnoreCase(""))){
            
        if(!buttonClicked.equalsIgnoreCase("clear")){
        Connection conn = null;
        
        
        String url = "jdbc:mysql://localhost:8888/csc4370projectdb";
        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection (url, "root", "");
        System.out.println ("Database connection established");
           
        String query = "SELECT * FROM inventorydb";
        Statement connstatement = conn.createStatement();
        ResultSet dbresult = connstatement.executeQuery(query);
        
        String name = "";
        int quantity = 0;
        double price = 0.00;
        String image = "";
        
        while (dbresult.next())
        {
            //int UserId = dbresult.getInt("id");
            name = dbresult.getString("iname");
            quantity = dbresult.getInt("iquantity");
            price = dbresult.getDouble("iprice");
            image = dbresult.getString("iimage");
            
            if(name.equalsIgnoreCase(buttonClicked)){
//                writer = new PrintWriter("test.txt", "UTF-8");
//                writer.println(name+" "+buttonClicked);
//                writer.close();
                connstatement.executeUpdate("INSERT INTO cartdb (cname, cquantity, cprice, cimage) " + "VALUES ('"+name+"', '"+quantity+"',  '"+price+"', '"+image+"')");
                connstatement.close();
                break;
            }
        }
        }
        else{
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
        }
        }
        
   %>

   
   
</body>
</html>