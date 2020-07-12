package service;

import com.sun.deploy.net.HttpRequest;
import dao.UserDao;
import entity.User;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String firstName = request.getParameter("firstName");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        String username = userDao.login(firstName, password);
        if(username != null){
            HttpSession session = request.getSession();
            session.setAttribute("firstName", firstName);
            session.setAttribute("result", 1);
            response.sendRedirect("/");
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("result", 0);
            response.sendRedirect("Login.jsp");
        }
    }
}
