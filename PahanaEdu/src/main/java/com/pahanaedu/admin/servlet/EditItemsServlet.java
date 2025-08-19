package com.pahanaedu.admin.servlet;

import com.pahanaedu.DAO.ItemDAOImpl;
import com.pahanaedu.DB.DBConnection;
import com.pahanaedu.entity.Item;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/admin/items/edit_items")

public class EditItemsServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            int itemid = Integer.parseInt(req.getParameter("itemid"));
            String iname = req.getParameter("iname");
            Double price = Double.parseDouble(req.getParameter("price"));
            String type = req.getParameter("type");
            
            Item i = new Item();
            i.setItemid(itemid);
            i.setIname(iname);
            i.setPrice(price);
            i.setType(type);
            
            ItemDAOImpl dao=new ItemDAOImpl(DBConnection.getConn());
            boolean f=dao.updatedEditItems(i);
            
            HttpSession session=req.getSession();
            
            if(f){
                session.setAttribute("succMsg", "Item updated Successfully!!!");
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
