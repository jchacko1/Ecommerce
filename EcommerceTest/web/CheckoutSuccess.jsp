
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<title>Checkout Successful</title>
</head>
<body>

         <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:8888/csc4370projectdb"
        user="root" password=""
    />
    
    <h1>You Have Successfully Checked Out, Thank you for choosing us as your E-Commerce Business Solution.</h1>
    <hr>
    <a href="login.jsp">[User Login]</a><br>
    <a href="register.jsp">[Not a User? Register Here!]</a><br> 
    <a href="inventory.jsp">[Item Inventory]</a><br>
    <a href="viewcart.jsp">[View Cart]</a><br>
    <a href="profile.jsp">[User Profile]</a>
    <br><hr><br>
    <h3><a href="menu.jsp">[Back to Main Menu]</a></h3>
    
    



</body>
</html>