package com.dao;

import com.entity.Book;
import com.entity.Bookmsg;
import com.entity.Evaluate;
import com.entity.UserandBook;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BooksDao {

    @Select("SELECT * FROM bbooks WHERE bno LIKE #{nos} LIMIT 10")
    List<Book> findBooks(String nos);

    @Select("SELECT * FROM bbooks WHERE bno=#{no}")
    Book findBook(String no);

    @Select("SELECT * FROM bbookmsg WHERE bno=#{no}")
    Bookmsg findBookmsg(String no);

    @Insert("INSERT INTO bbooks VALUES (#{bno},#{bname},#{byear},#{bauthor},#{bnationality},#{blabel})")
    void addBook(Book book);

    @Insert("INSERT INTO bbookmsg VALUES (#{bno},#{wordnumber},#{publish},#{introduce})")
    void addBookmsg(Bookmsg bookmsg);

    @Insert("INSERT INTO bbookspages VALUES (#{bno},#{pages})")
    void addsumpages(Map<String,String> map);

    @Select("SELECT sumpages FROM bbookspages WHERE bno = #{bno}")
    Integer findsumpages(String bno);

    @Select("SELECT pages FROM usertobooks WHERE username = #{user} And bno = #{no}")
    Integer findUsertoBookpages(Map<String,String> map);

    @Update("UPDATE usertobooks SET pages=#{pages} WHERE username = #{user} And bno = #{no}")
    Integer setUsertoBookpages(Map<String,String> map);

    @Delete("DELETE FROM usertobooks WHERE username = #{user} And bno = #{no}")
    Integer DeleteusertobookFormap(Map<String,String> map);

    @Select("INSERT INTO usertobooks(username,bno) VALUES (#{user},#{no})")
    void addUsertoBook(Map<String,String> map);

    @Select("SELECT * FROM bbooks WHERE bname LIKE #{search} LIMIT 10")
    List<Book> findBooksForname(String search);

    @Select("SELECT * FROM bbooks WHERE bauthor LIKE #{search} LIMIT 10")
    List<Book> findBooksForauthor(String search);

    @Select("SELECT * FROM bbooks WHERE bnationality LIKE #{na" + "tionality} LIMIT 10")
    List<Book> findBooksFornationality(String nationality);

    @Select("SELECT * FROM usertobooks WHERE username = #{username} ")
    List<UserandBook> findReadingBooksForuser(String username);

    @Select("SELECT * FROM usertobooks WHERE username = #{username} AND pages>10")
    List<UserandBook> finishBooksForuser(String username);

    @Select("SELECT * FROM readingbook WHERE username = #{username}")
    UserandBook findReading(String username);

    @Update("UPDATE readingbook SET pages=#{pages},bno=#{no} WHERE username = #{user}")
    Integer setReading(Map<String,String> map);

    @Select("SELECT bno FROM usertobooks WHERE username = #{user} And bno LIKE #{no}")
    List<String> findauthor(Map<String,String> map);

    @Select("SELECT weight FROM usertobooks WHERE username = #{user} And bno = #{no}")
    Integer findweight(Map<String,String> map);

    @Update("UPDATE usertobooks SET weight=#{weight} WHERE username = #{user} And bno = #{no}")
    Integer setweight(Map<String,String> map);

    @Select("SELECT * FROM bevaluate WHERE username = #{user} And bno = #{no}")
    Evaluate findevaluateFormap(Map<String,String> map);

    @Delete("DELETE FROM bevaluate WHERE username = #{user} And bno = #{no}")
    Integer DeleteevaluateFormap(Map<String,String> map);

    @Insert("INSERT INTO bevaluate(username,alias,stars,btext,bno) VALUES (#{username},#{alias},#{stars},#{btext},#{bno})")
    Integer addevaluateFormap(Evaluate evaluate);

    @Select("SELECT * FROM bevaluate WHERE bno = #{bno} ORDER BY bdate DESC LIMIT 10")
    List<Evaluate> findevaluateForbno(String bno);

    @Select("SELECT stars FROM bevaluate WHERE bno = #{bno}")
    List<Integer> findstarsForbno(String bno);
}
