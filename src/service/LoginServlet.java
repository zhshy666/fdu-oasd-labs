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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        boolean flag = userDao.login(username, password);
        HttpSession session = request.getSession();
        if(flag){
            session.setAttribute("username", username);
            session.setAttribute("result", 1);
            response.sendRedirect("/");
        }
        else {
            session.setAttribute("result", 0);
            response.sendRedirect("Login.jsp");
        }
    }
}
