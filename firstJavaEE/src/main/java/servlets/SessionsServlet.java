package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/sessions")
public class SessionsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String sess_value=(String) session.getAttribute("my_session");
        ArrayList<String>basket=(ArrayList<String>)session.getAttribute("basket");
        request.setAttribute("basket",basket);
        request.setAttribute("session","Your session value is "+sess_value);
        request.getRequestDispatcher("/sessions.jsp").forward(request,response);
    }
}
