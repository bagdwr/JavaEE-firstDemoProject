package servlets;

import db.DBmanager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/auth")
public class AuthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String email=request.getParameter("email");
          String password=request.getParameter("password");
          Users users= DBmanager.getUser(email);
          String redirect="/login?emailerror";
          if (users!=null){
              redirect="/login?passworderror";
              if (users.getPassword().equals(password)){
                  request.getSession().setAttribute("CURRENT_USER",users);
                  redirect="/";
              }
          }
          response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
