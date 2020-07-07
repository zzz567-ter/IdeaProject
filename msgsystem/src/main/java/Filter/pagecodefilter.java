package Filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/servlet/pagecode")
public class pagecodefilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override//转发不会过滤
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("开始过滤");
        HttpServletRequest req=(HttpServletRequest) servletRequest;
        int code= (int) req.getSession().getAttribute("code");
        String next=req.getParameter("next");
        if(next!=null) {
            if (next.equals("a")) {
                code++;
            } else if (next.equals("s")) {
                code--;
            }
        }
        req.getSession().setAttribute("code",code);
        filterChain.doFilter(req, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
