package Filter;


import com.fasterxml.jackson.databind.ObjectMapper;
import entity.user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/index.jsp")
public class loginpassword  implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest) servletRequest;
        Cookie[] cookies=req.getCookies();
        String user=null;
        for(int i=0;cookies!=null && i<cookies.length;i++) {
            if(cookies[i].getName().equals("user")) {
                user=cookies[i].getValue();
                break;
            }
        }
        if(user!=null){//json对象要用script提取
            String[] sta=user.split("-");
            entity.user use=new user(sta[0],sta[1]);
            ObjectMapper mapper=new ObjectMapper();
            String json=mapper.writeValueAsString(use);
            req.setAttribute("user",json);
            }
        filterChain.doFilter(req, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
