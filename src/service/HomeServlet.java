package service;

import dao.FavorDao;
import dao.UserDao;
import entity.Image;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Set;

public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("firstName");
        assert username != null && !username.equals("");

        // Get user id
        UserDao userDao = new UserDao();
        int userId = userDao.findUserIdByName(username);
        if (userId == -1){
            resp.sendRedirect("/Login.jsp");
        }

        FavorDao favorDao = new FavorDao();
        Set<Image> set = favorDao.findFavorImagesByUserId(userId);
        req.setAttribute("favors", set);
        req.getRequestDispatcher("Response/HomeController.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
