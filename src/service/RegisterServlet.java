package service;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            if(userDao.register(user)){   // success
                HttpSession session = request.getSession();
                session.setAttribute("firstName", user.getFirstName());
                session.setAttribute("result", 0);
                response.sendRedirect("/");
            }
            else {
                HttpSession session = request.getSession();
                session.setAttribute("result", 0);
                response.sendRedirect("Register.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
