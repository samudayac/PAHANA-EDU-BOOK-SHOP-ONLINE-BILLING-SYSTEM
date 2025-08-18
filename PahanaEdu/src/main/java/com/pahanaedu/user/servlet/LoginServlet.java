package com.pahanaedu.user.servlet;

import com.pahanaedu.DAO.UserDAOImpl;
import com.pahanaedu.DB.DBConnection;
import com.pahanaedu.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            UserDAOImpl dao = new UserDAOImpl(DBConnection.getConn());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

     
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                session.setAttribute("userobj", us);
                session.setAttribute("role", "admin");   
                resp.sendRedirect("admin/admin_home.jsp");

            } else {
                
                User us = dao.login(email, password);

                if (us != null) {
                    session.setAttribute("userobj", us);
                    session.setAttribute("role", "staff");  
                    resp.sendRedirect("user/user_home.jsp");

                } else {
                    session.setAttribute("failedMsg", "Email or Password Incorrect");
                    resp.sendRedirect("login.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
