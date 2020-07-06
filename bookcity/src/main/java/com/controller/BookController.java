package com.controller;

import com.entity.LoginUser;
import com.entity.UserandBook;
import com.service.BooksService;
import com.service.ReadBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/Book")
public class BookController {

    @Autowired
    BooksService booksService;

    @Autowired
    ReadBookService readBookService;

    @RequestMapping("/abook")
    public ModelAndView abookpage(@SessionAttribute LoginUser user, String bno) {
        ModelAndView modelAndView = new ModelAndView("abook");
        String username = user.getUsername();
        List<UserandBook> reads = booksService.findfinishUAB(username);
        int readbooks = reads.size();
        int sumbooks = booksService.findUAB(username).size();
        modelAndView.addObject("bookclass",booksService.findclass(bno));
        modelAndView.addObject("readbooks", readbooks);
        modelAndView.addObject("sumbooks", sumbooks);
        modelAndView.addObject("reads", reads);
        UserandBook reading = booksService.findReading(username);
        modelAndView.addObject("reading", booksService.findReading(username));
        modelAndView.addObject("readingbook", booksService.findBook(reading.getBno()));
        modelAndView.addObject("sumpages", booksService.findsumpages(reading.getBno()));
        modelAndView.addObject("book", booksService.findBook(bno));
        modelAndView.addObject("bookmsg", booksService.findBookmsg(bno));
        modelAndView.addObject("stars", booksService.sumstars(bno));
        modelAndView.addObject("evaluates", booksService.findEvaluate(bno));
        modelAndView.addObject("bookstaus",readBookService.bookstaus(username,bno));
        return modelAndView;
    }

    @RequestMapping("/evaluate")
    public void actionevaluate(@SessionAttribute LoginUser user, String bno, String staus, String textmsg, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        String msg = String.valueOf(booksService.addEvaluate(user, bno, staus, textmsg));
        out.write(msg);
    }

    @RequestMapping("/addbook")
    public void addbook(@SessionAttribute LoginUser user, String bno, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        String msg= String.valueOf(booksService.updatabook(user.getUsername(),bno));
        out.write(msg);
    }

    @RequestMapping("/readbook")
    public ModelAndView readbookpage(@SessionAttribute LoginUser user, String bno,HttpServletRequest request) throws IOException {
        Integer pages=readBookService.initpages(user.getUsername(),bno);
        ModelAndView modelAndView = new ModelAndView("readbook");
        String username = user.getUsername();
        List<UserandBook> reads = booksService.findfinishUAB(username);
        int readbooks = reads.size();
        int sumbooks = booksService.findUAB(username).size();
        modelAndView.addObject("readbooks", readbooks);
        modelAndView.addObject("sumbooks", sumbooks);
        modelAndView.addObject("reads", reads);
        UserandBook reading = booksService.findReading(username);
        modelAndView.addObject("reading", reading);
        modelAndView.addObject("readingbook", booksService.findBook(reading.getBno()));
        modelAndView.addObject("sumpages",booksService.findsumpages(reading.getBno()));
        modelAndView.addObject("book", booksService.findBook(bno));
        String file=request.getSession().getServletContext().getRealPath("/")+"/booktext/"+bno+".txt";
        modelAndView.addObject("readbooktext",readBookService.readBook(bno,pages,file));
        modelAndView.addObject("pagestaus",readBookService.pagestaus(bno,pages));
        return modelAndView;
    }

    @RequestMapping("/nextpage")
    public ModelAndView nextpage(@SessionAttribute LoginUser user, String bno,String buttom,HttpServletRequest request) throws IOException {
        ModelAndView modelAndView = new ModelAndView("readbook");
        HashMap<String, String> map=new HashMap<>();
        map.put("user",user.getUsername());
        map.put("no",bno);
        map.put("next",buttom);
        Integer pages=readBookService.updatenextpages(map);
        String file=request.getSession().getServletContext().getRealPath("/")+"/booktext/"+bno+".txt";
        modelAndView.addObject("readbooktext",readBookService.readBook(bno,pages,file));
        modelAndView.addObject("pagestaus",readBookService.pagestaus(bno,pages));
        String username = user.getUsername();
        List<UserandBook> reads = booksService.findfinishUAB(username);
        int readbooks = reads.size();
        int sumbooks = booksService.findUAB(username).size();
        modelAndView.addObject("readbooks", readbooks);
        modelAndView.addObject("sumbooks", sumbooks);
        modelAndView.addObject("reads", reads);
        UserandBook reading = booksService.findReading(username);
        modelAndView.addObject("reading", reading);
        modelAndView.addObject("readingbook", booksService.findBook(reading.getBno()));
        modelAndView.addObject("sumpages",booksService.findsumpages(reading.getBno()));
        modelAndView.addObject("book", booksService.findBook(bno));
        return modelAndView;
    }

    @RequestMapping("/filedownload")
    public ResponseEntity<byte[]> download(HttpServletRequest request,String bno) throws IOException {
        String file=request.getSession().getServletContext().getRealPath("/")+"/booktext/"+bno+".txt";
        byte[] body=readBookService.filebyte(bno,file);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" +bno+".txt");
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<>(body, headers, statusCode);
        return entity;
    }

    @RequestMapping("/skippage")
    public ModelAndView skippage(@SessionAttribute LoginUser user,Integer pagesnumber,String bno,HttpServletRequest request) throws IOException {
        ModelAndView modelAndView = new ModelAndView("readbook");
        HashMap<String, String> map=new HashMap<>();
        map.put("user",user.getUsername());
        map.put("no",bno);
        readBookService.updateskippage(map,pagesnumber);
        String file=request.getSession().getServletContext().getRealPath("/")+"/booktext/"+bno+".txt";
        modelAndView.addObject("readbooktext",readBookService.readBook(bno,pagesnumber,file));
        modelAndView.addObject("pagestaus",readBookService.pagestaus(bno,pagesnumber));
        String username = user.getUsername();
        List<UserandBook> reads = booksService.findfinishUAB(username);
        int readbooks = reads.size();
        int sumbooks = booksService.findUAB(username).size();
        modelAndView.addObject("readbooks", readbooks);
        modelAndView.addObject("sumbooks", sumbooks);
        modelAndView.addObject("reads", reads);
        UserandBook reading = booksService.findReading(username);
        modelAndView.addObject("reading", reading);
        modelAndView.addObject("readingbook", booksService.findBook(reading.getBno()));
        modelAndView.addObject("sumpages",booksService.findsumpages(reading.getBno()));
        modelAndView.addObject("book", booksService.findBook(bno));
        return modelAndView;
    }

    @RequestMapping("/home0")
    public ModelAndView redirect0() {
        return new ModelAndView("redirect:/homec/home0");
    }

    @RequestMapping("/home1")
    public ModelAndView redirect1() {
        return new ModelAndView("redirect:/homec/home1");
    }

    @RequestMapping("/home2")
    public ModelAndView redirect2() {
        return new ModelAndView("redirect:/homec/home2");
    }

    @RequestMapping("/home3")
    public ModelAndView redirect3() {
        return new ModelAndView("redirect:/homec/home3");
    }

    @RequestMapping("/home4")
    public ModelAndView redirect4() {
        return new ModelAndView("redirect:/homec/home4");
    }

    @RequestMapping("/home5")
    public ModelAndView redirect5() {
        return new ModelAndView("redirect:/homec/home5");
    }

    @RequestMapping("/home6")
    public ModelAndView redirect6() {
        return new ModelAndView("redirect:/homec/home6");
    }

    @RequestMapping("/home7")
    public ModelAndView redirect7() {
        return new ModelAndView("redirect:/homec/home7");
    }

    @RequestMapping("/search")
    public ModelAndView search(String searchmsg){
        return new ModelAndView("redirect:/homec/search","searchmsg",searchmsg);
    }

}

