package com.service;

import com.dao.BooksDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("readBookService")
public class ReadBookService {

    @Autowired
    BooksDao booksDao;

    public String readBook(String bno, Integer page,String filepath) throws IOException {
        InputStreamReader fileReader = new InputStreamReader(new FileInputStream(filepath), "UTF-8");
        BufferedReader bufferedReader=new BufferedReader(fileReader);
        char[] chars=new char[2048];
        for(int i=0;i<page;i++) {
            bufferedReader.read(chars);
        }
        String booktext= String.valueOf(chars);
        bufferedReader.close();
        fileReader.close();
        return booktext;
    }

    public Integer initpages(String username,String bno){
        HashMap<String,String> map=new HashMap<>();
        map.put("user",username);
        map.put("no",bno);
        Integer pages=booksDao.findUsertoBookpages(map);
        if(pages==null){
            pages=1;
            booksDao.addUsertoBook(map);
        }else{
            addweight(map);
        }
        updatereading(map,pages);
        return pages;
    }

    public void updatereading(HashMap<String,String> map,Integer pages){
        map.put("pages", String.valueOf(pages));
        booksDao.setReading(map);
    }

    public void addweight(HashMap<String,String> map){
        map.put("weight", String.valueOf(booksDao.findweight(map)+1));
        booksDao.setweight(map);
    }

    public Integer updatenextpages(HashMap<String,String> map){
        String next=map.get("next");
        map.remove("next");
        Integer pages=0;
        if (next.equals("1")){
            pages=booksDao.findUsertoBookpages(map)+1;
            map.put("pages", String.valueOf(pages));
        }else{
            pages=booksDao.findUsertoBookpages(map)-1;
            map.put("pages", String.valueOf(pages));
        }
        booksDao.setReading(map);
        booksDao.setUsertoBookpages(map);
        return pages;
    }

    public void updateskippage(HashMap<String,String> map,Integer pages){
        Integer sumpages=booksDao.findsumpages(map.get("no"));
        if (pages<=sumpages){
            map.put("pages", String.valueOf(pages));
        }else {
            map.put("pages", String.valueOf(sumpages));
        }
        booksDao.setReading(map);
        booksDao.setUsertoBookpages(map);
    }

    public Integer pagestaus(String bno,Integer pages){
        if (pages==1){
            return -1;
        }else if (pages>=booksDao.findsumpages(bno)){
            return 1;
        }
        return 0;
    }

    public Integer bookstaus(String username,String bno) {
        HashMap<String, String> map = new HashMap<>();
        map.put("user", username);
        map.put("no", bno);
        Integer pages = booksDao.findUsertoBookpages(map);
        if (pages == null) {
            return 0;
        }
        return 1;
    }

    public byte[] filebyte(String bno,String filepath) throws IOException {
        InputStream inputStream=new FileInputStream(filepath);
        byte[] bytes=new byte[inputStream.available()];
        inputStream.read(bytes);
        return bytes;
    }
}

