<%-- 
    Document   : regnotfinish
    Created on : Apr 9, 2015, 1:00:05 AM
    Author     : Peter
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Commerce Register Page</title>
</head>
<body>
    <h1>E-Commerce Register Page</h1>
    <hr>
    <fieldset>
        <legend>Register</legend>
    <form action="Register" method="post">
	Username : <input type="text" name="usernamereg"> &nbsp&nbsp
	Password : <input type="password" name="passwordreg"> &nbsp&nbsp
		   <input type="submit" name="register" value="Register"/>
    </fieldset>
    <h1><u>Please Fill In All The Fields!</u></h1>
    <br>
    <a href="login.jsp">[User Login]</a><br>
    <a href="register.jsp">[Not a User? Register Here!]</a><br> 
    <a href="inventory.jsp">[Item Inventory]</a>
    <a href="viewcart.jsp">[View Cart]</a>
    <br><hr><br>
    <h3><a href="menu.jsp">[Back to Main Menu]</a></h3>
    
    </form>
</body>
</html>
