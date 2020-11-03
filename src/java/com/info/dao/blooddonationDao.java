package com.info.dao;

import com.info.config.*;
import com.info.method.*;
import com.info.servlet.*;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class blooddonationDao {

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

    public static int save(blooddonationBean l) {
        int status = 0;
        try {
            Connection con = blooddonationDao.getConnection();

            PreparedStatement st = con.prepareStatement("insert into blooddonation(fname,lname,address,pnumber,email,dob,bgroup) values(?,?,?,?,?,?,?) ");

           
            st.setString(1, l.getFname());
            st.setString(2, l.getLname());
            st.setString(3, l.getAddress());
            st.setString(4, l.getPnumber());
            st.setString(5, l.getEmail());
            st.setString(6, l.getDob());
            st.setString(7, l.getBgroup());
            
            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<blooddonationBean> getAllRecords() {
        List<blooddonationBean> list = new ArrayList<blooddonationBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from blooddonation");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    
                blooddonationBean u = new blooddonationBean();
                
                u.setId(rs.getInt("id"));
                u.setFname(rs.getString("fname"));
                u.setLname(rs.getString("lname"));
                u.setAddress(rs.getString("address"));
                u.setPnumber(rs.getString("pnumber"));
                u.setEmail(rs.getString("email"));
                u.setDob(rs.getString("dob"));
                u.setBgroup(rs.getString("bgroup"));
                
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}

