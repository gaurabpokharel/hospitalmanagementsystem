package com.info.dao;

import com.info.config.*;
import com.info.method.*;
import com.info.servlet.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class labDao {

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

    public static int save(labBean l) {
        int status = 0;
        try {
            Connection con = labDao.getConnection();

            PreparedStatement st = con.prepareStatement("insert into lab(id,pname,aptitle,doctor,test) values(?,?,?,?,?)");

            st.setInt(1, l.getId());
            st.setString(2, l.getPname());
            st.setString(3, l.getAptitle());
            st.setString(4, l.getDoctor());
            st.setString(5, l.getTest());

            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<labBean> getAllRecords() {
        List<labBean> list = new ArrayList<labBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lab where report is NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                labBean u = new labBean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setDoctor(rs.getString("doctor"));
                u.setTest(rs.getString("test"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static List<labBean> getAllRamRecords() {
        List<labBean> list = new ArrayList<labBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lab where report IS NOT NULL and doctor='Dr.Ram'and medicine IS NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                labBean u = new labBean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setDoctor(rs.getString("doctor"));
                u.setTest(rs.getString("test"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static List<labBean> getAllShyamRecords() {
        List<labBean> list = new ArrayList<labBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lab where report IS NOT NULL and doctor='Dr.Shyam' and medicine IS NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                labBean u = new labBean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setDoctor(rs.getString("doctor"));
                u.setTest(rs.getString("test"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static labBean getRecordById(int id) {
        labBean u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lab where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                u = new labBean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setDoctor(rs.getString("doctor"));
                u.setTest(rs.getString("test"));
                u.setReport(rs.getString("report"));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }

    public static int update(int id , InputStream file1) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();

            PreparedStatement st = con.prepareStatement("UPDATE appointment set report=? where id=?");
             if (file1 != null) {
                // fetches input stream of the upload file for the blob column
                st.setBlob(1, file1);
            }
            st.setInt(2, id);
            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
