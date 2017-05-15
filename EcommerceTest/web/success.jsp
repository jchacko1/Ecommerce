<%-- 
    Document   : success
    Created on : Apr 5, 2015, 5:22:32 PM
    Author     : Peter
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<title>Insert title here</title>
</head>
<body>

    <h1>You Have Logged In Successfully, <b>"<u>${requestScope['user'].username}</u>"</b>&nbsp!</h1>
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