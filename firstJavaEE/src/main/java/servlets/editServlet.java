package servlets;

import db.Countries;
import db.DBmanager;
import db.Items;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value ="/edit")
public class editServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user=(Users) request.getSession().getAttribute("CURRENT_USER");
        if (user!=null){
        Long id=Long.parseLong(request.getParameter("item_id"));
        String name=request.getParameter("item_name");
        int price=Integer.parseInt(request.getParameter("item_price"));
        int amount=Integer.parseInt(request.getParameter("item_amount"));
        Long manufacturer_id=Long.parseLong(request.getParameter("manufacturer_id"));
        Countries cnt= DBmanager.getCountry(manufacturer_id);
        if (cnt!=null){
            Items item=new Items(id,name,price,amount,cnt);
            if (DBmanager.saveItem(item)){
                response.sendRedirect("/edit?id="+id+"&success");
            }else {
                response.sendRedirect("/edit?id="+id+"&error");
            }
        }else {
            response.sendRedirect("/edit?id="+id+"&error");
        }}
        else {
            response.sendRedirect("/login");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user=(Users) request.getSession().getAttribute("CURRENT_USER");
        if (user!=null){
            Long id=0L;
            Items item=null;
            ArrayList<Countries>countries=DBmanager.getCountries();
            try {
                id=Long.parseLong(request.getParameter("id"));
            }catch (Exception ex){
                ex.printStackTrace();
            }
            item= DBmanager.getItem(id);
            if (item!=null){
                request.setAttribute("item",item);
                request.setAttribute("countries",countries);
                request.getRequestDispatcher("/edit.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher("/404.jsp").forward(request,response);
            }
        }else {
            response.sendRedirect("/login");
        }


    }
}
