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

@WebServlet(value="/addItem")
public class AddItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("item_name");
           int price=Integer.parseInt(request.getParameter("item_price"));
           int amount=Integer.parseInt(request.getParameter("item_amount"));
           Long manufacturer_id=Long.parseLong(request.getParameter("manufacturer_id"));
           Countries cnt=DBmanager.getCountry(manufacturer_id);
           if (cnt!=null){
               Items item=new Items(null,name,price,amount,cnt);
               DBmanager.addItem(item);
           }else {
               response.sendRedirect("/addItem?error");
           }


           response.sendRedirect("/addItem?success");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user=(Users) request.getSession().getAttribute("CURRENT_USER");
        if (user!=null){
            ArrayList<Countries>countries=DBmanager.getCountries();
            request.setAttribute("countries",countries);
            request.getRequestDispatcher("/addItem.jsp").forward(request,response);
        }else {
            response.sendRedirect("/login.jsp");
        }

    }
}
