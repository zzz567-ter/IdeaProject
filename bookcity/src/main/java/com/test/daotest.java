package com.test;

import com.dao.BooksDao;
import com.dao.LoginDao;
import com.entity.*;
import com.service.BooksService;
import com.service.ReadBookService;
import com.service.UserService;
import org.aspectj.apache.bcel.util.ClassPath;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.*;
import java.util.*;

public class daotest {

    private ApplicationContext ac;

    @Before
    public void before(){
        ac=new ClassPathXmlApplicationContext("applicationContext.xml");
    }
    @Test
    public void sumspages() throws IOException {
        BooksDao testdao=ac.getBean(BooksDao.class);
        for(int i=10;i<16;i++) {
            InputStreamReader fileReader = new InputStreamReader(new FileInputStream("C:\\Users\\457884933\\Desktop\\books\\text\\ABOOKS"+i+".txt"), "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            Integer pages = 0;
            char[] chars = new char[2048];
            while (bufferedReader.read(chars) != -1) {
                pages++;
            }
            HashMap<String, String> map = new HashMap<>();
            map.put("bno", "ABOOKS"+i);
            map.put("pages", String.valueOf(pages));
            testdao.addsumpages(map);
            bufferedReader.close();
            fileReader.close();
        }

    }
    @Test
    public void updateuser() throws IOException {
//        LoginDao testdao=ac.getBean(LoginDao.class);
//        LoginUser loginUser=new LoginUser();
//        loginUser.setUsername("test");
//        loginUser.setEmail("123");
//        System.out.println(testdao.findevaluateFormap(map));
    }
    @Test
    public void servicetest() throws IOException {
        BooksDao testdao=ac.getBean(BooksDao.class);
        HashMap<String,String> map=new HashMap<>();
        map.put("user","admin");
        map.put("no","ABOOKS02");
        System.out.println(testdao.findevaluateFormap(map));
    }
    @Test
    public void addBook() throws IOException {
//        ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
        BooksDao testdao=ac.getBean(BooksDao.class);
        FileReader fileReader=new FileReader("C:\\Users\\457884933\\Desktop\\text.txt");
        BufferedReader bufferedReader=new BufferedReader(fileReader);
        System.out.println(bufferedReader.readLine());
        bufferedReader.readLine();
        bufferedReader.readLine();
        bufferedReader.readLine();
        Book book=new Book();
//        for (int i=0;i<=62;i++){
//        String msg=bufferedReader.readLine();
//        String[] msgt=msg.split("\t");
//        book.setBno(msgt[0]);
//        book.setBname(msgt[1]);
//        book.setByear(Integer.valueOf(msgt[2]));
//        book.setBauthor(msgt[3]);
//        book.setBnationality(msgt[4]);
//        book.setBlabel(msgt[5]);
//        System.out.println(book);
//        testdao.addBook(book);
//        }
        fileReader.close();
        bufferedReader.close();}
        //完成
        @Test
        public void addBookmsg() throws IOException {
//        ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
//            FileReader fileReader=new FileReader("C:\\Users\\457884933\\Desktop\\ABOOKS01.txt");
            File file=new File("");
            System.out.println(file.getAbsolutePath());
            System.out.println(file.getCanonicalPath());
//            String filepath=file.getAbsolutePath()+"\\src\\main\\webapp\\booktext\\ABOOKS01.txt";
//            InputStreamReader fileReader = new InputStreamReader(new FileInputStream(filepath), "UTF-8");
//            BufferedReader bufferedReader=new BufferedReader(fileReader);
//            char[] chars=new char[2048];
//            for(int i=0;i<1;i++) {
//                bufferedReader.read(chars);
//            }
//            while (bufferedReader.read(chars)!=-1){
//                System.out.print(chars);
//            }
//            bufferedReader.close();
//            fileReader.close();
    }
    //完成
    @Test
    public void testdaobook(){
//        ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
        BooksService testdao=ac.getBean(BooksService.class);
        HashMap<String,String> map=new HashMap<>();
        map.put("user","admin");
        map.put("no","ABOOKS15");
        System.out.println(testdao.updatabook("admin","ABOOKS15"));

//        System.out.println(bnos);
//        for(String book:bnos){
//            System.out.println(book);
//        }
    }
    @Test
    public void testbookservic(){
        BooksService booksService=ac.getBean(BooksService.class);
//        Map<String,List<Book>> books=booksService.searchBooks("阿伦特");
        Map<String,List<Book>> books=booksService.searchBooks("简史");
        if(books==null){
            System.out.println("查询不到");
        }else{
        List<Book> no=books.get("no");
        List<Book> name=books.get("name");
        List<Book> author=books.get("author");
        List<Book> nationality=books.get("nationality");
        if (name==null){
            System.out.println(author);
            System.out.println(nationality);
        }else{
            System.out.println(name);
            System.out.println(no);
        }
        }
    }

    @Test
    public void testmap(){
        BooksService booksService=ac.getBean(BooksService.class);
        ReadBookService readbooksService=ac.getBean(ReadBookService.class);
//        HashMap<String, String> map=new HashMap<>();
//        map.put("user","admin");
//        map.put("no","ABOOKS01");
        System.out.println(booksService.findusertobooks("test"));
//        map.put("next","0");
//        System.out.println(booksService.judgenext("ABOOKS01",315));
//        LoginUser user=new LoginUser();
//        user.setAlias("maxuser");
//        user.setUsername("admin");
//        System.out.println(booksService.addEvaluate(user,"ABOOKS02","5","超好看超好看超好看"));
    }

    @Test
    public void addevaluate(){
        BooksDao booksService=ac.getBean(BooksDao.class);
        LoginDao userService=ac.getBean(LoginDao.class);
        Evaluate evaluate=new Evaluate();
        evaluate.setBno("ABOOKS02");
        evaluate.setAlias(userService.queryForusername("admin").getAlias());
        evaluate.setUsername("admin");
        evaluate.setStars(5);
        evaluate.setBtext("1111111111111111111111111");
        System.out.println(booksService.addevaluateFormap(evaluate));
//        System.out.println(String.valueOf(average));
    }
}
