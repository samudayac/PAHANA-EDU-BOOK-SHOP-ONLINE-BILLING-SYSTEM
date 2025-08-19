package com.pahanaedu.bill.servlet;

import com.pahanaedu.DAO.BillDAOImpl;
import com.pahanaedu.DB.DBConnection;
import com.pahanaedu.entity.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/bill/printBill")
public class PrintBillServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String billIdStr = req.getParameter("billId");
        if (billIdStr == null || billIdStr.isEmpty()) {
            resp.sendRedirect("/bill/generate_bill.jsp");
            return;
        }
        try {
            int billId = Integer.parseInt(billIdStr);
            Connection conn = DBConnection.getConn();
            BillDAOImpl billDao = new BillDAOImpl(conn);
            Bill bill = billDao.getBillById(billId);
            if (bill == null) {
                req.getSession().setAttribute("failedMsg", "Bill not found.");
                resp.sendRedirect("/bill/generate_bill.jsp");
                return;
            }
            req.setAttribute("bill", bill);
            req.getRequestDispatcher("/bill/print_bill.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("failedMsg", "Error loading bill: " + e.getMessage());
            resp.sendRedirect("/bill/generate_bill.jsp");
        }
    }
}
