package com.pahanaedu.admin.servlet;

import com.pahanaedu.DAO.ItemDAOImpl;
import com.pahanaedu.DB.DBConnection;
import com.pahanaedu.entity.Item;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;

@WebServlet("/admin/items/add_items")
@MultipartConfig
public class ItemsAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        try {
            String iname = req.getParameter("iname");
            Double price = Double.parseDouble(req.getParameter("price"));
            String type = req.getParameter("type");
            Part part = req.getPart("photo");
            String fileName = part.getSubmittedFileName();

           
            String uploadPath = getServletContext().getRealPath("") + File.separator + "item_photos";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            part.write(uploadPath + File.separator + fileName);

            
            Item i = new Item(iname, price, type, fileName);

            
            ItemDAOImpl dao = new ItemDAOImpl(DBConnection.getConn());
            boolean f = dao.addItems(i);

            if (f) {
                session.setAttribute("succMsg", "Item Added Successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong - DB insert failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "Error: " + e.getMessage());
        }

        resp.sendRedirect("add_items.jsp");
    }
}


