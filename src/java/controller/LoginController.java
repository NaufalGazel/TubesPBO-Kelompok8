package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // kalau sudah login, jangan balik ke login
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        // tampilkan halaman login
        request.getRequestDispatcher("/index.jsp")
               .forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.login(username, password);

        if (user != null) {
            // login berhasil
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            // redirect ke CONTROLLER, bukan JSP
            response.sendRedirect(request.getContextPath() + "/dashboard");

        } else {
            // login gagal
            request.setAttribute("error", "Username atau password salah");
            request.getRequestDispatcher("/index.jsp")
                   .forward(request, response);
        }
    }
}
