package service;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String state = "1";
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        String dateJoined = formatter.format(date);

        User user = new User(username, email, password, state, dateJoined, dateJoined);

        try {
            UserDao userDao = new UserDao();
            if(userDao.register(user)){   // success
                HttpSession session = request.getSession();
                session.setAttribute("userName", user.getUserName());
                session.setAttribute("result", 1);
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
