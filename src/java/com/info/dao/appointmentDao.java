package com.info.dao;

import com.info.config.*;
import com.info.method.*;
import com.info.servlet.*;
import java.io.InputStream;
import static java.lang.System.out;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class appointmentDao {

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

    public static int save(appointmentbean l,InputStream file1)
    {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();

            PreparedStatement st = con.prepareStatement("insert into appointment(pname,aptitle,apdate,atime,symptoms,disease,document,email,pnumber,department,doctor) values(?,?,?,?,?,?,?,?,?,?,?) ");

            // st.setInt(1, 8);
            st.setString(1, l.getPname());
            st.setString(2, l.getAptitle());
            st.setString(3, l.getApdate());
            st.setString(4, l.getAtime());
            st.setString(5, l.getSymptoms());
            st.setString(6, l.getDisease());
            st.setString(8, l.getEmail());
            st.setString(9, l.getPnumber());
            st.setString(10, l.getDepartment());
            st.setString(11, l.getDoctor());
             
            if (file1 != null) {
                // fetches input stream of the upload file for the blob column
                st.setBlob(7, file1);
            }
            

            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<appointmentbean> getAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setMedicine(rs.getString("medicine"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<appointmentbean> getAllLabRecords() 
    {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where report IS  NULL and test IS NOT NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setTest(rs.getString("test"));
                u.setDoctor("doctor");
                u.setReport("report");

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static appointmentbean getRecordById(int id) {
        appointmentbean u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setAtime(rs.getString("atime"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setDepartment(rs.getString("department"));
                u.setDoctor(rs.getString("doctor"));
                u.setFdate(rs.getString("fdate"));
                u.setEmail(rs.getString("email"));
                u.setTest(rs.getString("test"));
                u.setMedicine(rs.getString("medicine"));
                u.setAmount(rs.getString("amount"));
                u.setReports(rs.getBlob("report"));
                u.setPnumber(rs.getString("pnumber"));
                
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }

    public static int update(appointmentbean l) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();

            PreparedStatement st = con.prepareStatement("update appointment set department=?,doctor=?,doctorid=?,fdate=?,time=? where id=?");

            st.setString(1, l.getDepartment());
            st.setString(2, l.getDoctor());
            st.setInt(3, l.getDoctorid());
            st.setString(4, l.getFdate());
            st.setString(5, l.getTime());
            st.setInt(6, l.getId());
            status = st.executeUpdate();

            st.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<appointmentbean> getReceptionistAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where doctor is NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setEmail(rs.getString("email"));
                u.setPnumber(rs.getString("pnumber"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public static List<appointmentbean> getAppointmentAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where doctor is not NULL and doctorid IS NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setEmail(rs.getString("email"));
                u.setPnumber(rs.getString("pnumber"));
                u.setDoctor(rs.getString("doctor"));
                u.setDepartment(rs.getString("department"));
                u.setAtime(rs.getString("atime"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<appointmentbean> getAssignedBookingAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where doctor IS NOT NULL and doctorid IS NOT NULL and aptitle IS NOT NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setDoctor(rs.getString("doctor"));
                u.setFdate(rs.getString("fdate"));
                u.setTime(rs.getString("time"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    //
    public static List<appointmentbean> getAssignedAppointmentAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where doctor IS NOT NULL and doctorid IS NOT NULL and aptitle IS NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setDepartment(rs.getString("department"));
                u.setDoctorid(rs.getInt("doctorid"));
                u.setDoctor(rs.getString("doctor"));
                u.setFdate(rs.getString("fdate"));
                u.setTime(rs.getString("time"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }



   public static List<appointmentbean> getRecordByDoctorID(int id) {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            
            Connection con = getConnection();
              PreparedStatement ps = con.prepareStatement("select * from appointment where doctorid=? AND test IS NULL AND medicine IS NULL");
            ps.setInt(1, id);
             ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setEmail(rs.getString("email"));
                u.setPnumber(rs.getString("pnumber"));
                u.setDoctor(rs.getString("doctor"));
                u.setDepartment(rs.getString("department"));
                u.setAtime(rs.getString("atime"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
 public static List<appointmentbean> getLabRecordByDoctorUserName(int id) {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
              PreparedStatement ps = con.prepareStatement("select * from appointment where doctorid=? AND report IS NOT NULL AND medicine IS NULL ");
            ps.setInt(1, id);
             ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setApdate(rs.getString("apdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setEmail(rs.getString("email"));
                u.setPnumber(rs.getString("pnumber"));
                u.setDoctor(rs.getString("doctor"));
                u.setDepartment(rs.getString("department"));
                u.setAtime(rs.getString("atime"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static int updateReport(int id, InputStream file1) {
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

    public static List<appointmentbean> getLabAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where report is NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                //u.setApdate(rs.getString("apdate"));
                //u.setSymptoms(rs.getString("symptoms"));
                //u.setDisease(rs.getString("disease"));
                u.setDoctor(rs.getString("doctor"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean validate(int id, String dn) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

            PreparedStatement ps = con.prepareStatement("select * from appointment where id=? and doctor=?");
            ps.setInt(1, id);
            ps.setString(2, dn);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<appointmentbean> getAllAdminRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where medicine IS NOT NULL and amount IS NOT NULL and fdate=CURDATE() ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setFdate(rs.getString("fdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setEmail(rs.getString("email"));
                u.setPnumber(rs.getString("pnumber"));
                u.setDoctor(rs.getString("doctor"));
                u.setAmount(rs.getString("amount"));
                u.setDepartment(rs.getString("department"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
public static List<appointmentbean> getAdminAllTodayRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where fdate=CURDATE() ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAptitle(rs.getString("aptitle"));
                u.setFdate(rs.getString("fdate"));
                u.setSymptoms(rs.getString("symptoms"));
                u.setDisease(rs.getString("disease"));
                u.setEmail(rs.getString("email"));
                u.setPnumber(rs.getString("pnumber"));
                u.setDoctor(rs.getString("doctor"));
                
                u.setDepartment(rs.getString("department"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public static int amount(cashierBean l) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update appointment set amount=?,depositamount=? where id=? ");
            ps.setInt(3, l.getId());
            ps.setString(1, l.getAmount());
            ps.setString(2, l.getDepositamount());

            status = ps.executeUpdate();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updateamount(cashierBean l) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update appointment set amount=amount+? where id=?");
            ps.setInt(1, l.getOamount());
            ps.setInt(2, l.getId());

            status = ps.executeUpdate();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int delete(appointmentbean u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from appointment where id=?");
            ps.setInt(1, u.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public static boolean validatesforperviousrecord(int id, String email) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

            PreparedStatement ps = con.prepareStatement("select * from appointment where id=? and email=?");
            ps.setInt(1, id);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updatetest(appointmentbean l) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update appointment set test=? where id=?");
            ps.setString(1, l.getTest());
            ps.setInt(2, l.getId());

            status = ps.executeUpdate();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updateMedicine(appointmentbean l) {
        int status = 0;
        try {
            Connection con = appointmentDao.getConnection();

            PreparedStatement st = con.prepareStatement("update appointment set medicine=? where id=?");

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
     public static List<appointmentbean> getShowAmountAllRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from appointment where depositamount IS NOT NULL and amount IS NOT NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
                u.setId(rs.getInt("id"));
                u.setPname(rs.getString("pname"));
                u.setAmount(rs.getString("amount"));
                u.setDepositamount(rs.getString("depositamount"));

                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
     public static List<appointmentbean> getAllPharmacyRecords() {
        List<appointmentbean> list = new ArrayList<appointmentbean>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE medicine IS NOT NULL");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                appointmentbean u = new appointmentbean();
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

}
