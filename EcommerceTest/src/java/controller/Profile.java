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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import model.User;
//import model.User;
//import controller.Login;

/**
 *
 * @author Toaster
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile"})
public class Profile extends HttpServlet{
    private static final long serialVersionUID = 1L;
    public Profile(){
	super();
    }
    
    protected void doPost(HttpServletRequest request3, HttpServletResponse response3) throws ServletException, IOException {

      //  String username = request.getParameter("username");
        
        //figure out how to get current logged in dude
        String tempusername = "";
            Connection conn = null;
        try{
        String url3 = "jdbc:mysql://localhost:8888/csc4370projectdb";
        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection (url3, "root", "");
        System.out.println ("Database connection established");
           
        String query = "SELECT * FROM logindb";
        Statement connstatement = conn.createStatement();
        ResultSet dbresult = connstatement.executeQuery(query);
        //connstatement.executeUpdate("TRUNCATE logindb");
        //connstatement.executeUpdate("INSERT INTO logindb (lgname, lgpassword) " + "VALUES ('"+username+"', '"+password+"')");
        while (dbresult.next())
        {
            //int UserId = dbresult.getInt("id");
            tempusername = dbresult.getString("lgname");
            //String UserPW = dbresult.getString("upassword");
        }
        
        connstatement.close();
        }
        catch (Exception e)
        {
        System.err.println("Got an exception! ");
        System.err.println(e.getMessage());
        }
        
                
        
        String username = tempusername;
        //String username = "jchacko1";
        
        String fname = request3.getParameter("fname");
        String lname  = request3.getParameter("lname");
        String pnum = request3.getParameter("pnum");
        String street = request3.getParameter("street");
        String zip = request3.getParameter("zip");
        String city = request3.getParameter("city");
        String state = request3.getParameter("state");
        String gender = request3.getParameter("gender");
        String bday = request3.getParameter("bday");
        
        //Connection conn = null;
        
        Connection con= null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Statement statement = null;
        String sql = null;
        
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:8888/csc4370projectdb";
        String user = "root";
        String password = "";
        
        //RequestDispatcher reqDispatcher3 = null;
        
        //response3.sendRedirect("/profilesuccess.jsp");
       // reqDispatcher3 = request3.getRequestDispatcher("/profilesuccess.jsp");
//String sql = "select * from userdb" ;


try {
   // statement = conn.createStatement();
    
   // String sql = "INSERT INTO userdb(fname, lname, pnum, street, zip, city, state, gender) "
   //        + "VALUES ('" + fname + "', ' "+ lname + "',' " + pnum  + "',' " + street + "',' "
   //        + zip + "',' " + city + "',' " + state + "',' " + gender + "') WHERE uname = '" + username
  //          + "';";
       
    //Class.forName(driverName);
    String query = "update userdb set fname = ?, lname = ?, pnum = ?, street = ?, zip = ?, city = ?, "
            + "state = ?, gender = ?, bday = ?  where uname= ?" ;
    con = DriverManager.getConnection(url, user, password);
    ps = con.prepareStatement(query);
    ps.setString(1, fname);
    ps.setString(2, lname);
    ps.setString(3, pnum);
    ps.setString(4, street);
    ps.setString(5, zip);
    ps.setString(6, city);
    ps.setString(7, state);
    ps.setString(8, gender);
    ps.setString(9, bday);
    ps.setString(10, username);
    ps.executeUpdate();
    
    
    //rs = ps.executeQuery();
    
    
    //statement.executeUpdate("UPDATE userdb SET fname='" + fname + "', lname='" + lname + "', pnum='" + pnum + "' " + "WHERE uname='jchacko1'");
    //statement.close();
    
    
    // statement.close();
    response3.sendRedirect("profile.jsp");
    
     ps.close();
     rs.close();
     con.close();
     
     
     
     
    }
        
    catch(Exception e) {
            System.err.println("Something Broke!");
}

    
    }
    
}

