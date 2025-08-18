package com.pahanaedu.user.servlet;

import com.pahanaedu.DAO.UserDAOImpl;
import com.pahanaedu.DB.DBConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/users/delete")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            
            UserDAOImpl dao = new UserDAOImpl(DBConnection.getConn());
            boolean f = dao.deleteUser(id);
            HttpSession session = req.getSession();
            
            if (f) {
                session.setAttribute("succMsg", "Item Deleted Successfully!!!");
                resp.sendRedirect(req.getContextPath() + "/admin/users/view_users.jsp");  
            } else {
                session.setAttribute("failedMsg", "Something went wrong!!!");
                resp.sendRedirect(req.getContextPath() + "/admin/users/view_users.jsp"); 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
