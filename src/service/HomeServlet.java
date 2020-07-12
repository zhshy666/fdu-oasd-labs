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
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Set;

public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html,charser=utf-8");
        String str="Hello World";
        //1.创建ServletOutputStream对象
        PrintWriter out = resp.getWriter();
        //2.将字符数组转换为字节数组输出去
        out.write(str);


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
        out.print(set);
        session.setAttribute("favors", set);
//        resp.sendRedirect("/Home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
