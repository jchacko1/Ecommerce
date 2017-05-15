<%-- 
    Document   : regfail
    Created on : Apr 9, 2015, 12:02:37 AM
    Author     : Peter
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>This Username "<u>${requestScope['user3'].username}</u>" Has Already Been Registered, Please Try Again!</h1>
    <hr>
    <a href="login.jsp">[User Login]</a><br>
    <a href="register.jsp">[Not a User? Register Here!]</a><br>
    <a href="inventory.jsp">[Item Inventory]</a>
    <a href="viewcart.jsp">[View Cart]</a>
    <br><hr><br>
    <h3><a href="menu.jsp">[Back to Main Menu]</a></h3>

</body>
</html>
