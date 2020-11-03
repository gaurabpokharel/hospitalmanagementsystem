package com.info.dao;

import com.info.config.*;
import com.info.method.*;
import com.info.servlet.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDao {
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static boolean validate(String email, String password) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

            PreparedStatement ps = con.prepareStatement("select * from userlogin where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
        
    }

    public static boolean validates(int id, String username) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

            PreparedStatement ps = con.prepareStatement("select * from userlogin where id=? and username=?");
            ps.setInt(1, id);
            ps.setString(2, username);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    public static List<userbean> getAllRecords() {
        List<userbean> list = new ArrayList<userbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from userlogin");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                userbean u = new userbean();
                u.setId(rs.getInt("id"));
                u.setfirstname(rs.getString("firstname"));
                u.setlastname(rs.getString("lastname"));
                u.setusername(rs.getString("username"));
                u.setpassword(rs.getString("password"));
                u.setemail(rs.getString("email"));
                u.setphonenumber(rs.getString("phonenumber"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static int delete(userbean u){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("delete from userlogin where id=?");  
        ps.setInt(1,u.getId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}  
    public static int update(userbean l) {
        int status = 0;
        try {
            Connection con = userDao.getConnection();

            PreparedStatement st = con.prepareStatement("update userlogin set password=? where username=? AND password=? ");

            st.setString(1, l.getNewpassword());
            st.setString(2, l.getusername());
            st.setString(3, l.getOldpassword());
            
            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
     public static boolean check( String username,String email) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

            PreparedStatement ps = con.prepareStatement("select * from userlogin where username=? and email=?");
            ps.setString(1, username);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
      public static int updatePassword(userbean l) {
        int status = 0;
        try {
            Connection con = userDao.getConnection();

            PreparedStatement st = con.prepareStatement("update userlogin set password=? where username=?");

            st.setString(1, l.getNewpassword());
            st.setString(2, l.getusername());
            
            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
