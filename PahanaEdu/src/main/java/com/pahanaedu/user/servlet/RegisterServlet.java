
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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  
        try{
            String name=req.getParameter("name");
            String email=req.getParameter("email");
            String contactno=req.getParameter("contactno");
            String address=req.getParameter("address");
            String password=req.getParameter("password");
            String check=req.getParameter("check");
            
            //System.out.println(name+" "+email+" "+contactno+" "+address+" "+password+" "+check);
            
            User us=new User();
            us.setName(name);
            us.setEmail(email);
            us.setContactno(contactno);
            us.setAddress(address);
            us.setPassword(password);
            
            HttpSession session=req.getSession();
            
            if(check!=null){
                
                UserDAOImpl dao=new UserDAOImpl(DBConnection.getConn());
            boolean f=dao.userRegister(us);
            if(f){
                //System.out.println("User Registration Done!!!");
                session.setAttribute("succMsg", "User Registration Done!!!");
                resp.sendRedirect("register.jsp");
                
            }else{
                //System.out.println("Somthing Wrong!!!");
                session.setAttribute("failedMsg", "Somthing Wrong!!!");
                resp.sendRedirect("register.jsp");
            }
                
        }else{
                //System.out.println("Please Check Agree to the Terms & Conditions!!!");
                session.setAttribute("failedMsg", "Please Check Agree to the Terms & Conditions!!!");
                resp.sendRedirect("register.jsp");
            }
            
            
            
            
        }catch (Exception e){
            e.printStackTrace();
            
        }
    }
    
    
}
