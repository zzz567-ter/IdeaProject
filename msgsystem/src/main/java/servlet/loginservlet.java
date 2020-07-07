package servlet;

import Dao.fu;
import entity.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/servlet/login")//标记-路径前面没加/报错了。
public class loginservlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        out = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Boolean login =false;
        user use = new user(username, password);
        if (req.getParameter("login")!=null){
        login = true;
        }
        HttpSession session=req.getSession();
        System.out.println(username + " " + password + " " + login);
        boolean result=false;
        try {
            result = fu.login(use);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (!result) {
            System.out.println("用户名或密码错误");
            out.print("<script language='javascript'>alert('用户名或密码错误,请重新输入');" +
                    "var url='../index.jsp';window.location.href=url;</script>");
        }else{
            if (login) {
                String json = username+"-"+password;
                Cookie cookie = new Cookie("user", json);//json被判断为空
                cookie.setMaxAge((60 * 60 * 24 * 7));
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
                System.out.println("cookie发送");
            }else{
                Cookie cookie = new Cookie("user", "msg");
                cookie.setMaxAge(0);
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
            }
            session.setAttribute("username", username);
            System.out.println("登录成功");
            req.getRequestDispatcher("mainpage").forward(req, resp);

        }

            }
        }