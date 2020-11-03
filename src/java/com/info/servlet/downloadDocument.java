package com.info.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class downloadDocument extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            final String host = "jdbc:mysql://localhost:3306/hospital?";
            final String user = "root";
            final String pass = "";
            String SQL = "SELECT document FROM appointment WHERE `ID`=?";
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);
            Connection conn = null;
            java.sql.PreparedStatement smt = null;
            InputStream input = null;
            FileOutputStream output = null;
            ResultSet rs = null;

            try {

                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Connecting...");

                conn = DriverManager.getConnection(host, user, pass);
                System.out.println("Connection successful..\nNow creating query...");

                smt = conn.prepareStatement(SQL);
                smt.setInt(1, id);  //in this row we have a png picture
                rs = smt.executeQuery();

                output = new FileOutputStream(new File("D://Previous report of "+id+".pdf"));
                System.out.println("Getting file please be patient..");

                while (rs.next()) {

                    input = rs.getBinaryStream("document"); //get it from col name
                    int r = 0;

                    while ((r = input.read()) != -1) {
                        output.write(r);

                    }
                }
                System.out.println("File writing complete !");

            } catch (ClassNotFoundException e) {
                System.err.println("Class not found!");
                e.printStackTrace();
            } catch (SQLException e) {
                System.err.println("Connection failed!");
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                System.err.println("File not found!");
                e.printStackTrace();
            } catch (IOException e) {
                System.err.println("File writing error..!");
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    try {
                        input.close();
                        output.flush();
                        output.close();
                        smt.close();
                        conn.close();
                    } catch (SQLException e) {
                        System.err.println("Connot close connecton!");
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    RequestDispatcher rd = request.getRequestDispatcher("doctorAppointmentDetailView.jsp");
                    rd.forward(request, response);

                }

            }
        }
    }

}
