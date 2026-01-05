package controller;

import dao.DashboardDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

    private final DashboardDAO dashboardDAO = new DashboardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("userLabel", user.getFullRoleLabel());

        int totalDepartemen = dashboardDAO.countDepartemen();
        int totalBidang = dashboardDAO.countBidang();
        int totalAnggota = dashboardDAO.countUser();

        request.setAttribute("totalDepartemen", totalDepartemen);
        request.setAttribute("totalBidang", totalBidang);
        request.setAttribute("totalAnggota", totalAnggota);

        request.setAttribute("activeMenu", "dashboard");
        request.getRequestDispatcher("/views/dashboard.jsp")
               .forward(request, response);
    }
}
