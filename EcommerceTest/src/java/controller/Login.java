/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;



public class Login extends HttpServlet{
    private static final long serialVersionUID = 1L;
    //private static boolean isSuccess = false;
    
    public Login(){
	super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
	String password = request.getParameter("password");
	RequestDispatcher reqDispatcher = null;

	//if(checkLogin(username, password).equals("success")){
        if(checkLogin(username, password) == true){
            
            
            Connection conn = null;
        try{
        String url = "jdbc:mysql://localhost:8888/csc4370projectdb";
        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection (url, "root", "");
        System.out.println ("Database connection established");
           
        //String query = "SELECT * FROM userdb";
        Statement connstatement = conn.createStatement();
        //ResultSet dbresult = connstatement.executeQuery(query);
        connstatement.executeUpdate("TRUNCATE logindb");
        connstatement.executeUpdate("INSERT INTO logindb (lgname, lgpassword) " + "VALUES ('"+username+"', '"+password+"')");
        connstatement.close();
        }
        catch (Exception e)
        {
        System.err.println("Got an exception! ");
        System.err.println(e.getMessage());
        }
            
            reqDispatcher = request.getRequestDispatcher("/success.jsp");
            User user = new User(username, password);
            request.setAttribute("user", user);
	} 
        else{
            reqDispatcher = request.getRequestDispatcher("/fail.jsp");
	}
	reqDispatcher.forward(request, response);
    }
    
    public boolean checkLogin(String username, String password) {
        
        boolean isSuccess = false;
        Connection conn = null;
        try
        {
        String url = "jdbc:mysql://localhost:8888/csc4370projectdb";
        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection (url, "root", "");
        System.out.println ("Database connection established");
           
        String query = "SELECT * FROM userdb";
        Statement connstatement = conn.createStatement();
        ResultSet dbresult = connstatement.executeQuery(query);

        // iterate through the java resultset
        while (dbresult.next())
        {
            //int UserId = dbresult.getInt("id");
            String UserName = dbresult.getString("uname");
            String UserPW = dbresult.getString("upassword");
            //Date DateCreated = dbresult.getDate("uregdate");
            //boolean AdminPermit = dbresult.getBoolean("uadmin");

            //System.out.format("%s, %s, %s, %s, %s\n", UserId, UserName, UserPW, DateCreated, AdminPermit);
          
            if((UserName.equals(username.toLowerCase()))&&(UserPW.equals(password))){
                isSuccess = true;
                break;
            }
            else{
                isSuccess = false;
            }
          
        }
        connstatement.close();
        }
        catch (Exception e)
        {
        System.err.println("Got an exception! ");
        System.err.println(e.getMessage());
        }
        
        return isSuccess;
        
//	if(("username".equals(username.toLowerCase()))&&("password".equals(password))){
//            return "success";
//	}
//        else{
//            return "fail";
//	}
    }

}