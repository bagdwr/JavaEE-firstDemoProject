package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/cookies")
public class CookiesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             Cookie[] cookies=request.getCookies();
             String myCookieData="No cookie data";
             if (cookies!=null){
                 for (Cookie c:cookies){
                     if (c.getName().equals("myCookie")){
                         myCookieData=c.getValue();
                         break;
                     }
                 }
             }
             request.setAttribute("myCookieValue",myCookieData);
             request.getRequestDispatcher("/cookies.jsp").forward(request,response);
    }
}
