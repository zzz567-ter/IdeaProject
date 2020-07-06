package com.controller;

import com.entity.LoginUser;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/loginc")
@SessionAttributes("user")
public class loginController {

    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/login")
    public ModelAndView login(String username, String password, String remember,HttpServletResponse response) throws IOException, ServletException {
        System.out.println(username+" "+password+" "+remember);
        ModelAndView modelAndView=new ModelAndView();
        if(!userService.UserTest(username,password)) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'>alert('账号或密码错误!');" +
                    "window.location.href='/bookcity'</script>");
            out.flush();
            out.close();
        }
        modelAndView.addObject("user",userService.findUser(username));
        modelAndView.setViewName("redirect:/homec/home0");
        return modelAndView;
    }

    @RequestMapping("/logon")
    public void logon(LoginUser user,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        System.out.println(user+" ");
        if(userService.save(user)){
            out.print("<script type='text/javascript'>alert('注册成功!');" +
                    "window.location.href='/bookcity'</script>");
        }else {
            out.print("<script type='text/javascript'>alert('账号存在!');" +
                    "window.location.href='/bookcity'</script>");
        }
        out.flush();
        out.close();
    }
}
