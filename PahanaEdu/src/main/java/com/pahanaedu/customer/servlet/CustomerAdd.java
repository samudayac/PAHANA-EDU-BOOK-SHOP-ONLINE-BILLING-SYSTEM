package com.pahanaedu.customer.servlet;

import com.pahanaedu.DAO.CustomerDAOImpl;
import com.pahanaedu.DB.DBConnection;
import com.pahanaedu.entity.Customer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/customer/add_customers")
public class CustomerAdd extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    {
  
        try{
            String name=req.getParameter("name");
            String address=req.getParameter("address");
            String contactno=req.getParameter("contactno");


            
            Customer ca=new Customer();
            ca.setName(name);
            ca.setAddress(address);
            ca.setContactno(contactno);

            
            HttpSession session=req.getSession();
                
                CustomerDAOImpl dao=new CustomerDAOImpl(DBConnection.getConn());
            boolean f=dao.customerAdd(ca);
            if(f){

                session.setAttribute("succMsg", "Customer Registration Done!!!");
                resp.sendRedirect("add_customers.jsp");
                
            }else{

                session.setAttribute("failedMsg", "Somthing Wrong!!!");
                resp.sendRedirect("add_customers.jsp");
            }
            
                   
            
        }catch (Exception e){
            e.printStackTrace();
            
        }
    }}

    
    
    
}
