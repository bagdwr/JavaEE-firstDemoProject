package servlets;

import db.DBmanager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/delete")
public class deleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user=(Users) request.getSession().getAttribute("CURRENT_USER");
        if (user!=null){
            Long id=0L;
            try {
                id=Long.parseLong(request.getParameter("item_id"));
                DBmanager.deleteItem(id);
                response.sendRedirect("/");
            }catch (Exception  ex){
                ex.printStackTrace();
            }
        }else {
            response.sendRedirect("/login");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
