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



public class Register extends HttpServlet{
    private static final long serialVersionUID = 1L;
    //private static boolean isSuccess = false;
    
    public Register(){
	super();
    }

    protected void doPost(HttpServletRequest request2, HttpServletResponse response2) throws ServletException, IOException {
        
        String usernamereg = request2.getParameter("usernamereg");
	String passwordreg = request2.getParameter("passwordreg");
	RequestDispatcher reqDispatcher2 = null;
        
        
        int isDuplicate = 0;
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
            //String UserPW = dbresult.getString("upassword");
            //Date DateCreated = dbresult.getDate("uregdate");
            //boolean AdminPermit = dbresult.getBoolean("uadmin");

            //System.out.format("%s, %s, %s, %s, %s\n", UserId, UserName, UserPW, DateCreated, AdminPermit);
          
            
            
            if(UserName.equals(usernamereg.toLowerCase())){
                isDuplicate = 1;
                break;
            }
            else{
                isDuplicate = 0;
            }
            
        }
        if((!usernamereg.equals(""))&&(!usernamereg.contains("\\s"))&&(!passwordreg.equals(""))){
            //do nothing
        }
        else{
            isDuplicate = -1;
        }
        
        if(isDuplicate == 0){
            //String x = "haha1"; String y = "hehe2";
            connstatement.executeUpdate("INSERT INTO userdb (uname, upassword, uadmin) " + "VALUES ('"+usernamereg+"', '"+passwordreg+"', FALSE)");
            connstatement.close();
            reqDispatcher2 = request2.getRequestDispatcher("/regsuccess.jsp");
            User user = new User(usernamereg, passwordreg);
            request2.setAttribute("user2", user);
                
                
//                response2.setContentType("text/html");
//                String site = new String("/EcommerceTest/regsuccess.jsp");
//                response2.setStatus(response2.SC_MOVED_TEMPORARILY);
//                response2.setHeader("Location", site);    
                
        } 
        else if(isDuplicate == 1){
            connstatement.close();
            reqDispatcher2 = request2.getRequestDispatcher("/regfail.jsp");
            User user = new User(usernamereg, passwordreg);
            request2.setAttribute("user3", user);
//                response2.setContentType("text/html");
//                String site = new String("/EcommerceTest/regfail.jsp");
//                response2.setStatus(response2.SC_MOVED_TEMPORARILY);
//                response2.setHeader("Location", site);    
        }
        else{
            connstatement.close();
            reqDispatcher2 = request2.getRequestDispatcher("/regnotfinish.jsp");
        }
        
        reqDispatcher2.forward(request2, response2);
        }
        catch (Exception e)
        {
        System.err.println("Got an exception! ");
        System.err.println(e.getMessage());
        }
        //reqDispatcher2.forward(request, response);
        

	//if(checkLogin(username, password).equals("success")){
        
    }
    
    //public boolean checkDuplicate(String username, String password) {
        
        
        
        //return isDuplicate;
        
//	if(("username".equals(username.toLowerCase()))&&("password".equals(password))){
//            return "success";
//	}
//        else{
//            return "fail";
//	}
    //}

}