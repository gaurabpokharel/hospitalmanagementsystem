/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.appointmentDao;
import com.info.method.cashierBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gaurab Pokharel
 */
public class cashierUpdateAmount extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);

            String oldamount = request.getParameter("amount");
            int oamount = Integer.parseInt(oldamount);

            cashierBean a = new cashierBean();

            a.setId(id);
            a.setOamount(oamount);
            
            int status = appointmentDao.updateamount(a);
            if (status > 0) {

                RequestDispatcher rd = request.getRequestDispatcher("cashierDashboard.jsp");
                rd.forward(request, response);
            } else {
                 RequestDispatcher rd = request.getRequestDispatcher("cashierupdateAmount.jsp");
                rd.forward(request, response);
            }

            out.close();
        }
    }
}
