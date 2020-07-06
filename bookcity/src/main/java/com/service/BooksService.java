package com.service;

import com.dao.BooksDao;
import com.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("booksService")
public class BooksService {

    @Autowired
    private BooksDao booksDao;

    public void setBooksDao(BooksDao booksDao) {
        this.booksDao = booksDao;
    }

    public Map<String,List<Book>> findBooks(){
        Map<String,List<Book>> books=new HashMap<>();
        books.put("A",booksDao.findBooks("A%"));
        books.put("B",booksDao.findBooks("B%"));
        books.put("C",booksDao.findBooks("C%"));
        books.put("D",booksDao.findBooks("D%"));
        books.put("E",booksDao.findBooks("E%"));
        books.put("F",booksDao.findBooks("F%"));
        return books;
    }

    public String findclass(String bno) {
        String[] msg=bno.split("");
        String returnmsg="";
        switch (msg[0]) {
            case "A":
                returnmsg = "文学艺术";
                break;
            case "B":
                returnmsg = "人文社科";
                break;
            case "C":
                returnmsg = "经管励志";
                break;
            case "D":
                returnmsg = "健康生活";
                break;
            case "E":
                returnmsg = "艺术设计";
                break;
            case "F":
                returnmsg = "教育学习";
                break;
        }
        return returnmsg;

    }
    public Integer findsumpages(String bno){
        return booksDao.findsumpages(bno);
    }

    public Book findBook(String bno){
        return booksDao.findBook(bno);
    }

    public Map<String,List<Book>> searchBooks(String search){
        Map<String,List<Book>> books=new HashMap<>();
        String searchcode ="%"+search+"%";
        List<Book> list=new ArrayList<>();
        List<Book> lista=new ArrayList<>();
        list = booksDao.findBooksForname(searchcode);//10
        if (list.isEmpty()){
            list =booksDao.findBooksForauthor(searchcode);//1
            if (list.isEmpty()){
                return null;
            }
            String nationality=list.get(0).getBnationality();
            System.out.println(nationality);
            lista=booksDao.findBooksFornationality(nationality);
            books.put("list",list);
            books.put("lista",lista);
            return books;
        }
        String Bno= (String) list.get(0).getBno().subSequence(0,1);;
        lista=booksDao.findBooks(Bno+"%");
        books.put("list",list);
        books.put("lista",lista);
        return books;
    }

    public List<UserandBook> findUAB(String username){
        return booksDao.findReadingBooksForuser(username);
    }

    public List<UserandBook> findfinishUAB(String username){
        List<UserandBook> finish=new ArrayList<>();
        List<UserandBook> bookList=booksDao.finishBooksForuser(username);
        for (UserandBook li:bookList){
            if (li.getPages().equals(booksDao.findsumpages(li.getBno()))){
                finish.add(li);
             }
    }
         return finish;
    }

    public Integer updatabook(String username,String bno){
        Integer re=0;
        HashMap<String,String> map=new HashMap<>();
        map.put("user",username);
        map.put("no",bno);
        if (booksDao.findUsertoBookpages(map)==null) {
            booksDao.addUsertoBook(map);
            re=1;
        }else{
            booksDao.DeleteusertobookFormap(map);
        }
        return re;
    }

    public UserandBook findReading(String username){
        UserandBook userandBook =new UserandBook();
        UserandBook test= booksDao.findReading(username);
        if(test==null){
            userandBook.setBno("0");
        }else{
            userandBook = test;
        }
        return userandBook;
    }

    public List<authortable> returntable(String username,String bbno){
        HashMap<String,String> map=new HashMap<>();
        map.put("user",username);
        map.put("no",bbno);
        List<String> bnos=booksDao.findauthor(map);//(username, bbno);
        List<authortable> list=new ArrayList<>();
        Map<String,List<Book>> authors=new HashMap();
        for (String bno:bnos){
            Book book=booksDao.findBook(bno);
            String author=book.getBauthor();
            if (authors.get(author)==null){
                List<Book> listbook=new ArrayList<>();
                authors.put(author,listbook);
            }
            authors.get(author).add(book);
        }
        for (String author:authors.keySet()){
            authortable authortable=new authortable();
            if (authors.get(author).size()==1){
                authortable.setBauthor(author);
                authortable.setSums(1);
                authortable.setBnationality(authors.get(author).get(0).getBnationality());
                authortable.setBname(authors.get(author).get(0).getBname());
                list.add(authortable);
            }else {
                authortable.setBauthor(author);
                authortable.setSums(authors.get(author).size());
                authortable.setBnationality(authors.get(author).get(0).getBnationality());
                Book maxbook=new Book();
                int weight=0;
                for (Book book:authors.get(author)){//权重相同时选择前一个
                    if (maxbook.getBno()==null){
                        maxbook=book;
                        map.put("no",maxbook.getBno());
                        weight=booksDao.findweight(map);
                    }else {
                        map.put("no",book.getBno());
                        if (weight<booksDao.findweight(map)){
                            maxbook=book;
                        }
                    }
                }
                authortable.setBname(maxbook.getBname());
                list.add(authortable);
            }
        }
        return list;
    }

    public List<Book> findusertobooks(String username){
        List<Book> books=new ArrayList<>();
        List<UserandBook> bnos=findUAB(username);
        for (UserandBook li:bnos){
            books.add(booksDao.findBook(li.getBno()));
        }
        return books;
    }

    public List<Book> findclassdb(String username,String bbno){
        HashMap<String,String> map=new HashMap<>();
        map.put("user",username);
        map.put("no",bbno);
        List<String> list=booksDao.findauthor(map);
        List<Book> books=new ArrayList<>();
        for (String bno:list){
            books.add(booksDao.findBook(bno));
        }
        return books;
    }
    public Integer sumdbnumber(List<authortable> authortables){
        Integer sumbooks=0;
        for (authortable authortable:authortables){
            sumbooks+=authortable.getSums();
        }
        return sumbooks;
    }

    public Bookmsg findBookmsg(String bno){
        return booksDao.findBookmsg(bno);
    }

    public Map<String,String> sumstars(String bno){
        Map<String,String> map=new HashMap<>();
        int averagestars=0,sumsstars=0,goodstars=0,stars=0,badstars=0;
        List<Integer> list=booksDao.findstarsForbno(bno);
        for (int starss:list){
            averagestars+=starss;
            sumsstars++;
            if (starss>3){
                goodstars++;
            }else if(starss<3){
                badstars++;
            }else{
                stars++;
            }
        }
        double a=averagestars;
        double b=sumsstars;
        double average=a*2/b;
        map.put("averagestars", String.valueOf(average));
        map.put("goodstars", String.valueOf(goodstars));
        map.put("stars", String.valueOf(stars));
        map.put("badstars", String.valueOf(badstars));
        map.put("sumsstars", String.valueOf(sumsstars));
        return map;
    }

    public List<Evaluate> findEvaluate(String bno){
        return booksDao.findevaluateForbno(bno);
    }

    public Integer addEvaluate(LoginUser user,String bno,String stars,String textmsg){
        Evaluate evaluate=new Evaluate();
        Map<String,String> map=new HashMap<>();
        map.put("user",user.getUsername());
        map.put("no",bno);
        evaluate.setUsername(user.getUsername());
        evaluate.setAlias(user.getAlias());
        evaluate.setBno(bno);
        evaluate.setStars(Integer.valueOf(stars));
        evaluate.setBtext(textmsg);
        if (booksDao.findevaluateFormap(map)==null){
            booksDao.addevaluateFormap(evaluate);
            return 0;
        }else {
            booksDao.DeleteevaluateFormap(map);
            booksDao.addevaluateFormap(evaluate);
            return 1;
        }
    }


}
