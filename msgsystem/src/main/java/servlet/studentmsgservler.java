package servlet;

import Dao.fu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/servlet/studentmsg")
public class studentmsgservler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int code=Integer.parseInt(req.getParameter("code"));
        int no= Integer.parseInt(req.getParameter("no"));
        String function= (String) req.getSession().getAttribute("function");
        int codeno=(code-1)*10+(no-1);
        Map<String,String> msg= fu.querymsg(function,codeno);
        req.setAttribute("msg",msg);
        req.getRequestDispatcher("../student-msg.jsp").forward(req,resp);
    }
}
