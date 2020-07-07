package servlet;

import Dao.fu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Map;

@WebServlet("/servlet/mainpage")
public class mainservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        String query=req.getParameter("query");
        if (query==null){
            query="All";
        }
        String msg="";
        switch (query){
                case "All": msg="院系";;break;
                case "English": msg="外国语学院";break;
                case "Computer": msg="信息技术学院";break;
                case "Art": msg="艺术设计学院";break;
                case "Economy": msg="经济管理学院";break;
                case "Accountant": msg="会计学院";break;
                case "Build": msg="建筑工程学院";break;
        }
        req.setAttribute("queryresult",msg);
        Map<String ,Double[]> map= fu.main(msg);
        Double[] sumte=map.get("sum");
        int[] sum=new int[2];
        for (int i=0;i<2;i++){
            double j=sumte[i];
            sum[i]=(int)j;
        }
        req.setAttribute("sum",sum);
        map.remove("sum");
        String[] indexs= map.keySet().toArray(new String[0]);
        req.setAttribute("indexs",indexs);
        for(int i=0;i<6;i++){
            Double[] doubles=map.get(indexs[i]);
        }
        Collection<Double[]> doubles=  map.values();
        Double[] newdoubles=new Double[6];
        int[] newints=new int[6];
        int j=0;int d=0;
        for (Double[] doub:doubles){
            double dou=doub[0];
            newints[j]= (int) dou;
            double doutwe=doub[1];
            newdoubles[d]=doutwe/10;
            j++;
            d++;
        }
        req.setAttribute("doubles",newdoubles);
        req.setAttribute("ints",newints);
        req.getRequestDispatcher("../main.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
