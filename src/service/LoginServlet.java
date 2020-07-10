package service;

import dao.UserDao;
import entity.User;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String firstName = request.getParameter("firstName");
        String password = request.getParameter("password");
        try {
            UserDao userDao = new UserDao();
            String username = userDao.login(firstName, password);
            if(username != null){
                request.getRequestDispatcher("Responses/LoginSuccess.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("Responses/LoginFail.jsp").forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
