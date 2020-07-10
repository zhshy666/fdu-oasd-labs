package service;

import dao.UserDao;
import entity.User;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(firstName, lastName, email, password);

        try {
            UserDao userDao = new UserDao();
            if(userDao.register(user)){
                request.getRequestDispatcher("Responses/RegisterSuccess.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("Responses/RegisterFail.jsp").forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
