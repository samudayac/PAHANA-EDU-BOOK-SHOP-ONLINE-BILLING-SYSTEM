package com.pahanaedu.bill.servlet;

import com.pahanaedu.DAO.BillDAOImpl;
import com.pahanaedu.DB.DBConnection;
import com.pahanaedu.entity.Bill;
import com.pahanaedu.entity.BillItem;
import com.pahanaedu.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/bill/generateBill")
public class GenerateBillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            User staff = (User) session.getAttribute("userobj");
            if (staff == null || staff.getId() == 0) {
                session.setAttribute("failedMsg", "Please login as staff to create bills.");
                resp.sendRedirect(req.getContextPath() + "/login.jsp");
                return;
            }
            int staffId = staff.getId();

            String accountNoStr = req.getParameter("accountno");
            if (accountNoStr == null || accountNoStr.isEmpty()) {
                session.setAttribute("failedMsg", "Account number is required.");
                resp.sendRedirect(req.getContextPath() + "/bill/generate_bill.jsp");
                return;
            }
            int accountno = Integer.parseInt(accountNoStr);

            String[] itemIds = req.getParameterValues("itemid");
            String[] qtys = req.getParameterValues("qty");

            if (itemIds == null || qtys == null || itemIds.length == 0 || itemIds.length != qtys.length) {
                session.setAttribute("failedMsg", "Please add at least one item with quantity.");
                resp.sendRedirect(req.getContextPath() + "/bill/generate_bill.jsp");
                return;
            }

            Connection conn = DBConnection.getConn();
            BillDAOImpl billDao = new BillDAOImpl(conn);

            List<BillItem> items = new ArrayList<>();
            double total = 0.0;

            String sqlGetPrice = "SELECT price, iname FROM item WHERE itemid = ?";
            PreparedStatement psPrice = conn.prepareStatement(sqlGetPrice);

            for (int i = 0; i < itemIds.length; i++) {
                int itemid = Integer.parseInt(itemIds[i]);
                int qty = Integer.parseInt(qtys[i]);

                if (qty <= 0) continue;

                psPrice.setInt(1, itemid);
                try (ResultSet rs = psPrice.executeQuery()) {
                    if (rs.next()) {
                        double unitPrice = rs.getDouble("price");
                        String iname = rs.getString("iname");
                        double amount = unitPrice * qty;

                        BillItem bi = new BillItem();
                        bi.setItemid(itemid);
                        bi.setIname(iname);
                        bi.setQuantity(qty);
                        bi.setUnit_price(unitPrice);
                        bi.setAmount(amount);

                        items.add(bi);
                        total += amount;
                    } else {
                        throw new Exception("Item id " + itemid + " not found.");
                    }
                }
            }
            psPrice.close();

            if (items.isEmpty()) {
                session.setAttribute("failedMsg", "No valid items selected.");
                resp.sendRedirect(req.getContextPath() + "/bill/generate_bill.jsp");
                return;
            }

            Bill bill = new Bill();
            bill.setAccountno(accountno);
            bill.setUser_id(staffId);
            bill.setTotal_amount(total);
            bill.setItems(items);

            int billId = billDao.createBillWithItems(bill);
            bill.setBill_id(billId);  

            
            req.setAttribute("bill", bill);
            req.setAttribute("items", items);

           
            req.getRequestDispatcher("/bill/print_bill.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "Error generating bill: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/bill/generate_bill.jsp");
        }
    }
}
