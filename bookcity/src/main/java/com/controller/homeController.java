package com.controller;

import com.dao.LoginDao;
import com.entity.Book;
import com.entity.LoginUser;
import com.entity.UserandBook;
import com.entity.authortable;
import com.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/homec")
@SessionAttributes("user")
public class homeController {

    @Autowired
    private BooksService booksService;

    @Autowired
    private LoginDao loginDao;

    public void setBooksService(BooksService booksService) {
        this.booksService = booksService;
    }

    @RequestMapping("/test")
    public ModelAndView test(String username){
        ModelAndView modelAndView=new ModelAndView("home0");
        LoginUser loginUser=new LoginUser();
        loginUser.setUsername(username);
        loginUser.setEmail("123@qq.com");
        loginUser.setPassword("123123");
        loginUser.setLoginyear(2066);
        loginUser.setAlias("maxuser");
        modelAndView.addObject("user",loginUser);
        Map<String, List<Book>> books=booksService.findBooks();
        modelAndView.addObject("books",books);
        return modelAndView;
    }

    @RequestMapping("/personage")
    public ModelAndView personage(@SessionAttribute LoginUser user){
        ModelAndView modelAndView=new ModelAndView("personage");
        int sumbooks=booksService.findUAB(user.getUsername()).size();
        modelAndView.addObject("sumbooks",sumbooks);
        modelAndView.addObject("mybooks",booksService.findusertobooks(user.getUsername()));
        return modelAndView;
    }

    @RequestMapping("/updateuser")
    public ModelAndView updateuser(String uusername,String ualias,String uemail,String password,String uyear,String upassword){
        ModelAndView modelAndView=new ModelAndView("redirect:/homec/personage");
        LoginUser user=new LoginUser();
        user.setUsername(uusername);
        user.setAlias(ualias);
        user.setEmail(uemail);
        user.setLoginyear(Integer.valueOf(uyear));
        user.setPassword(upassword);
        modelAndView.addObject("user",user);
        loginDao.Updateuse(user);
        return modelAndView;
    }

    @RequestMapping("/home0")
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("home0");
        Map<String, List<Book>> books=booksService.findBooks();
        modelAndView.addObject("books",books);
        return modelAndView;
    }

    @RequestMapping("/home1")
    public ModelAndView LiteratureAndart(@SessionAttribute LoginUser user){
        String findclass="A%";
        String username=user.getUsername();
        ModelAndView modelAndView=new ModelAndView("home1");
        List<UserandBook> reads=booksService.findfinishUAB(username);
        int readbooks=reads.size();
        int sumbooks=booksService.findUAB(username).size();
        modelAndView.addObject("readbooks",readbooks);
        modelAndView.addObject("sumbooks",sumbooks);
        modelAndView.addObject("reads",reads);
        UserandBook reading=booksService.findReading(username);
        modelAndView.addObject("reading",reading);
        modelAndView.addObject("readingbook",booksService.findBook(reading.getBno()));
        List<authortable> authortables=booksService.returntable(username,findclass);
        modelAndView.addObject("authortable",authortables);
        modelAndView.addObject("sumpages",booksService.findsumpages(reading.getBno()));
        modelAndView.addObject("classdb",booksService.findclassdb(username,findclass));
        modelAndView.addObject("sumbookdbnumber",booksService.sumdbnumber(authortables));
        return modelAndView;
    }

    @RequestMapping("/home2")
    public ModelAndView SocialSciences(@SessionAttribute LoginUser user){
        ModelAndView modelAndView=new ModelAndView("home2");
        return modelAndView;
    }

    @RequestMapping("/home3")
    public ModelAndView Management(@SessionAttribute LoginUser user){
        ModelAndView modelAndView=new ModelAndView("home3");
        return modelAndView;
    }

    @RequestMapping("/home4")
    public ModelAndView HealthyLife(@SessionAttribute LoginUser user){
        ModelAndView modelAndView=new ModelAndView("home4");
        return modelAndView;
    }

    @RequestMapping("/home5")
    public ModelAndView ArtDesign(@SessionAttribute LoginUser user){
        String username=user.getUsername();
        ModelAndView modelAndView=new ModelAndView("home5");
        List<UserandBook> reads=booksService.findfinishUAB(username);
        int readbooks=reads.size();
        int sumbooks=booksService.findUAB(username).size();
        modelAndView.addObject("readbooks",readbooks);
        modelAndView.addObject("sumbooks",sumbooks);
        modelAndView.addObject("reads",reads);
        UserandBook reading=booksService.findReading(username);
        modelAndView.addObject("reading",reading);
        modelAndView.addObject("sumpages",booksService.findsumpages(reading.getBno()));
        modelAndView.addObject("readingbook",booksService.findBook(reading.getBno()));
        return modelAndView;
    }

    @RequestMapping("/home6")
    public ModelAndView EducationAndLearning(@SessionAttribute String username){
        ModelAndView modelAndView=new ModelAndView("home6");
        return modelAndView;
    }

    @RequestMapping("/home7")
    public ModelAndView Wishlist(@SessionAttribute String username){
        ModelAndView modelAndView=new ModelAndView("home7");
        return modelAndView;
    }

    @RequestMapping("/search")
    public ModelAndView search(String searchmsg){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("searchmsg",searchmsg);
        if (searchmsg.equals("")){
            modelAndView.setViewName("redirect:/homec/home0");
            return modelAndView;
        }
        Map<String,List<Book>> books=booksService.searchBooks(searchmsg);
        if(books==null){
            modelAndView.setViewName("success");
            modelAndView.addObject("searchmsg","没查到把哈哈哈");
        }else{
            modelAndView.setViewName("search");
            modelAndView.addObject("list",books.get("list"));
            modelAndView.addObject("lista",books.get("lista"));
        }
        return modelAndView;
    }
}
