package com.info.dao;

import com.info.config.*;
import static com.info.dao.doctorDao.getConnection;
import com.info.method.*;
import com.info.servlet.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class staffDao {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return con;
    }

    public static boolean validate(String username, String password,String role) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hospital?", "root", "");

            PreparedStatement ps = con.prepareStatement(
                    "select * from stafflogin where username=? and password=? and role=?");
            
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    public static int save(staffBean l) {
        int status = 0;
        try {
            Connection con = adduseraccountDao.getConnection();
            PreparedStatement st = con.prepareStatement("insert into stafflogin(username,password,role) values(?,?,?)");
            st.setString(1, l.getUsername());
            st.setString(2, l.getPassword());
            st.setString(3, l.getRole());

            status = st.executeUpdate();
            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    public static List<staffBean> getAllRecords() {
        List<staffBean> list = new ArrayList<staffBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from stafflogin");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                staffBean u = new staffBean();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static int updatePassword(staffBean l) {
        int status = 0;
        try {
            Connection con = staffDao.getConnection();

            PreparedStatement st = con.prepareStatement("update stafflogin set password=? where username=?");

            st.setString(1, l.getPassword());
            st.setString(2, l.getUsername());
            
            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
    

