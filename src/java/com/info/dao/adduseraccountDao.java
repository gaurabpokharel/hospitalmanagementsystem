package com.info.dao;

import com.info.method.*;
import com.info.config.*;
import com.info.servlet.*;
import java.sql.*;

public class adduseraccountDao {

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

    public static int save(userbean l) {
        int status = 0;
        try {
            Connection con = adduseraccountDao.getConnection();
            PreparedStatement st = con.prepareStatement("insert into userlogin(firstname,lastname,username,password,email,phonenumber) values(?,?,?,?,?,?) ");
            st.setString(1, l.getfirstname());
            st.setString(2, l.getlastname());
            st.setString(3, l.getusername());
            st.setString(4, l.getpassword());
            st.setString(5, l.getemail());
            st.setString(6, l.getphonenumber());

            status = st.executeUpdate();
            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
