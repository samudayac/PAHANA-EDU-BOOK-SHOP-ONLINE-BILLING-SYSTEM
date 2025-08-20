package com.pahanaedu.customer.servlet;

import com.pahanaedu.DAO.CustomerDAOImpl;
import com.pahanaedu.DB.DBConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/customer/delete")
public class DeleteCustomerServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            int accountno = Integer.parseInt(req.getParameter("accountno"));
            
            CustomerDAOImpl dao=new CustomerDAOImpl(DBConnection.getConn());
            boolean f=dao.deleteCustomer(accountno);
            HttpSession session=req.getSession();
            
            if(f){
                session.setAttribute("succMsg", "Customer Deleted Successfully!!!");
                resp.sendRedirect("view_customers.jsp");
            }else{
                session.setAttribute("failedMsg", "Somthing Wrong!!!");
                resp.sendRedirect("view_customers.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
            
        }
        
    }
    
    
    
}
