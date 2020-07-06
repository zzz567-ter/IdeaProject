package com.dao;

import com.entity.LoginUser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface LoginDao {

    @Select("SELECT * FROM busers WHERE username=#{username}")
    LoginUser queryForusername(String username);

    @Insert("INSERT INTO busers(username,password,email) VALUES (#{username},#{password},#{email})")
    void addusername(LoginUser user);

    @Select("INSERT INTO readingbook VALUES (#{username},'0',0)")
    void addReadingBook(String username);

    @Update("UPDATE busers SET alias=#{alias},password=#{password},loginyear=#{loginyear},email=#{email} WHERE username = #{username}")
    void Updateuse(LoginUser user);

}
