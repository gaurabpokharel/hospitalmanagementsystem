package com.info.dao;

//import com.info.method.labBean;
import com.info.method.appointmentbean;
import com.info.method.pharmacyBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class pharmacyDao {

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

    public static int save(appointmentbean l) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();

            PreparedStatement st = con.prepareStatement("update appointment medicine=? where id=?");

            st.setInt(2, l.getId());
            
            st.setString(1, l.getMedicine());

            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<pharmacyBean> getAllRecords() {
        List<pharmacyBean> list = new ArrayList<pharmacyBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from pharmacy where amount IS NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pharmacyBean u = new pharmacyBean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setMedicine(rs.getString("medicine"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static pharmacyBean getRecordById(int id) {
        pharmacyBean u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from pharmacy where id=? and amount IS NULL");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                u = new pharmacyBean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setMedicine(rs.getString("medicine"));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }
}
