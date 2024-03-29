package servlets;

import db.DBmanager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String email=request.getParameter("email");
          String password =request.getParameter("password");
          String repassword=request.getParameter("re-password");
          String fullname=request.getParameter("fullname");
          Users user= DBmanager.getUser(email);
          String redirect="/register?emailexisterror";
          if (user==null){
              redirect="/register?passworderror";
              if (password.equals(repassword)){
                  redirect="/register?success";
                  user=new Users(null,email,password,fullname);
                  DBmanager.registerUser(user);
              }
          }
          response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             request.getRequestDispatcher("/register.jsp").forward(request,response);
    }
}
