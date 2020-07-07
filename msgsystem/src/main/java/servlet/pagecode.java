package servlet;

import Dao.fu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/servlet/pagecode")
public class pagecode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int code= (int)req.getSession().getAttribute("code");//初始化为1;
        System.out.print(code+"-");
        int length=(int) req.getSession().getAttribute("length");
        System.out.print(length+"-");
        String function= (String) req.getSession().getAttribute("function");
        System.out.print(function+"-");
        List<Map<String,String>> list= fu.queryjedis(function,length,code);
        req.setAttribute("list",list);
        req.getRequestDispatcher("../students.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
