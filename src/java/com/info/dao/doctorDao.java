package com.info.dao;

import com.info.config.*;
import static com.info.dao.userDao.getConnection;
import com.info.method.*;
import com.info.servlet.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class doctorDao {
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


    public static boolean validate(int id,String email, String password) {
        boolean status = false;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

           PreparedStatement ps = con.prepareStatement("select * from doctor where id=? and demail=? and dpassword=?");
           ps.setInt(1, id);
            ps.setString(2, email);
            
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            
            status = rs.next();
           

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    public static int save(doctorBean l) {
        int status = 0;
        try {
            Connection con = doctorDao.getConnection();
            PreparedStatement st = con.prepareStatement("insert into doctor(fullname,dusername,demail,dpassword,dphonenumber,department) values(?,?,?,?,?,?)");
            st.setString(1, l.getFullname());
            st.setString(2, l.getUsername());
            st.setString(3, l.getEmail());
            st.setString(4, l.getPassword());
            st.setString(5, l.getPhonenumber());
            st.setString(6, l.getDepartment());
            status = st.executeUpdate();
            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    public static List<doctorBean> getAllRecords() {
        List<doctorBean> list = new ArrayList<doctorBean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from doctor");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                doctorBean u = new doctorBean();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setUsername(rs.getString("dusername"));
                u.setPassword(rs.getString("dpassword"));
                u.setEmail(rs.getString("demail"));
                u.setPhonenumber(rs.getString("dphonenumber"));
                u.setDepartment(rs.getString("department"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static doctorBean getRecordById(int id) {
       doctorBean u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from doctor where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                u = new doctorBean();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setUsername(rs.getString("dusername"));
                u.setPassword(rs.getString("dpassword"));
                u.setEmail(rs.getString("demail"));
                u.setPhonenumber(rs.getString("dphonenumber"));
                u.setDepartment(rs.getString("department"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }
     public static int savedepartment(doctorBean l) {
        int status = 0;
        try {
            Connection con = doctorDao.getConnection();
            PreparedStatement st = con.prepareStatement("insert into department(department) values(?)");
          
            st.setString(1, l.getDepartment());
            status = st.executeUpdate();
            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
     public static int updatePassword(doctorBean l) {
        int status = 0;
        try {
            Connection con = userDao.getConnection();

            PreparedStatement st = con.prepareStatement("update doctor set dpassword=? where dusername=?");

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
      public static int update(doctorBean e){  
        int status=0;  
        try{  
            Connection con=doctorDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "update doctor set fullname=?,demail=?,dphonenumber=?,department=? where id=?");  
            ps.setString(1,e.getFullname());  
            ps.setString(2,e.getEmail());  
            ps.setString(3,e.getPhonenumber());  
            ps.setString(4,e.getDepartment());  
            ps.setInt(5,e.getId());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
}
