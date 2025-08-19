package com.pahanaedu.admin.servlet;

import com.pahanaedu.DAO.ItemDAOImpl;
import com.pahanaedu.DB.DBConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/delete")
public class DeleteItemsServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            int itemid = Integer.parseInt(req.getParameter("itemid"));
            
            ItemDAOImpl dao=new ItemDAOImpl(DBConnection.getConn());
            boolean f=dao.deleteItems(itemid);
            HttpSession session=req.getSession();
            
            if(f){
                session.setAttribute("succMsg", "Item Deleted Successfully!!!");
                resp.sendRedirect("all_items.jsp");
            }else{
                session.setAttribute("failedMsg", "Somthing Wrong!!!");
                resp.sendRedirect("all_items.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
            
        }
        
    }
    
    
    
}
