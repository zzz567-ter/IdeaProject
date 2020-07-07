package servlet;

import Dao.fu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/servlet/query")
public class studentquery extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String sname=new String(req.getParameter("sname").getBytes("ISO-8859-1"),"utf-8");
        String sdepartment=new String(req.getParameter("sdepartment").getBytes("ISO-8859-1"),"utf-8");
        String sclass=new String(req.getParameter("sclass").getBytes("ISO-8859-1"),"utf-8");
        System.out.println(sclass);
        System.out.println(sname);
        PrintWriter out=resp.getWriter();
        int length;String function;
        if (!sname.equals("")){
            length=fu.namequery(sname);
            function="sname";
        }else if(!sclass.equals("")){
            String[] sta=sclass.split("");
            String smajor="";
            for (int i=0;i<sclass.length()-2;i++){
                smajor=smajor+sta[i];
            }
            String scls=sta[sclass.length()-2];
            length=fu.majorclassquery(smajor,scls);
            function="smajor";
        }else{
            length=fu.departmentquery(sdepartment);
            function="sdepartment";
        }
        if (length!=0){
            req.getSession().setAttribute("function",function);
            req.getSession().setAttribute("length",length);
            req.getSession().setAttribute("code",1);
            req.getRequestDispatcher("pagecode").forward(req,resp);
        }else{
            out.print("<script language='javascript'>alert('查询为空,请重新输入');" +
                    "var url='../students.jsp';window.location.href=url;</script>");
        }
    }

}
