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

@WebServlet("/admin/users/edit_users")

public class EditUsersServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String contactno = req.getParameter("contactno");
            String address = req.getParameter("address");
            String password = req.getParameter("password");
            
            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setEmail(email);
            u.setContactno(contactno);
            u.setAddress(address);
            u.setPassword(password);
            
            UserDAOImpl dao=new UserDAOImpl(DBConnection.getConn());
            boolean f=dao.updatedEditUsers(u);
            
            HttpSession session=req.getSession();
            
            if(f){
                session.setAttribute("succMsg", "User updated Successfully!!!");
                resp.sendRedirect("view_users.jsp");
            }else{
                session.setAttribute("failedMsg", "Somthing Wrong!!!");
                resp.sendRedirect("view_users.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    
    
}
