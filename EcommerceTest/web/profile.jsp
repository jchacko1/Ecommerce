<%-- 
    Document   : profile
    Created on : Apr 7, 2015, 9:26:11 PM
    Author     : Toaster
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.User" %>
<%@ page import="controller.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>

    
<%  


Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:8888/csc4370projectdb";
String user = "root";
String password = "";

//String sql = "select * from userdb" ;


try {

    
//String username = new model.User(user, password).getUsername();
    String username = "";

    
        Connection conn = null;
       
        String url2 = "jdbc:mysql://localhost:8888/csc4370projectdb";
        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection (url2, "root", "");
        System.out.println ("Database connection established");
           
        String query = "SELECT * FROM logindb";
        Statement connstatement = conn.createStatement();
        ResultSet dbresult = connstatement.executeQuery(query);
        //connstatement.executeUpdate("TRUNCATE logindb");
        //connstatement.executeUpdate("INSERT INTO logindb (lgname, lgpassword) " + "VALUES ('"+username+"', '"+password+"')");
        while (dbresult.next())
        {
            //int UserId = dbresult.getInt("id");
            username = dbresult.getString("lgname");
            //String UserPW = dbresult.getString("upassword");
        }
        
        connstatement.close();
        
        

String sql = "select * from userdb where uname = '" + username + "'";

Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.prepareStatement(sql);
rs = ps.executeQuery();


%>



<h1> <%= username %>'s Profile</h1>


<form action="Profile" method="post">
<table border="1">
    
<%
while( rs.next() ){
%>
<tr>
    <td>First Name  </td>
    <td> <%= rs.getString("fname") %></td>
    <td><input type="text" name="fname"></td>
</tr>
<tr>
    <td> Last Name </td>
    <td> <%= rs.getString("lname") %></td>
    <td><input type="text" name="lname"></td>
</tr>
<tr>
    <td> Phone Number </td>
    <td> <%= rs.getString("pnum") %></td>
    <td><input type="text" name="pnum"></td>
</tr>
<tr>
    <td> Street Address</td>
    <td> <%= rs.getString("street") %></td>
    <td><input type="text" name="street"></td>
</tr>
<tr>
    <td> Zip Code</td>
    <td> <%= rs.getString("zip") %></td>
    <td><input type="text" name="zip"></td>
</tr>
<tr>
    <td> City </td>
    <td> <%= rs.getString("city") %></td>
    <td><input type="text" name="city"></td>
</tr>
<tr>
    <td> State</td>
    <td> <%= rs.getString("state") %></td>
    <td><input type="text" name="state"></td>
</tr>
<tr>
    <td> Gender </td>
    <td> <%= rs.getString("gender") %></td>
    <td><input type="text" name="gender"></td>
</tr>
<tr>
    <td> Birth Date </td>
    <td> <%= rs.getString("bday") %></td>
    <td><input type="text" name="bday"></td>
</tr>
<tr>
    <td><input type="submit" name="Profile" value="Update Profile"></td>
</tr>

<%
}
%>







</table>
</form>

<br/>

<h2> Order History </h2>

<%
String order = "select * from checkoutdbsuccess where uname='" + username + "'";
ps = con.prepareStatement(order);
rs = ps.executeQuery();
%>

<table border="1">
    <%
    while( rs.next() ){
    %>
    
<tr>
    <td> Item Ordered </td>
    <td> <%= rs.getString("cname") %></td>
</tr>
<tr>
    <td> Item Quantity </td>
    <td> <%= rs.getString("cquantity") %></td>
</tr>
<tr>
    <td> Item Price </td>
    <td> <%= rs.getString("cprice") %></td>
</tr>

    <% } %>
</table>

<br/>

<% 
}
catch(Exception e){e.printStackTrace();}
%>


    <a href="inventory.jsp">[Item Inventory]</a><br>
    <a href="viewcart.jsp">[View Cart]</a><br>
    <br><hr><br>
    <h3><a href="menu.jsp">[Back to Main Menu]</a></h3>


<%
rs.close();
ps.close();
con.close();
%>
</body>
</html>