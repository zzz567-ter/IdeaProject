package Dao;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class msgadd {
    int a=2;
    @Test
    public static String getage() {
        String boy = "男";
        String girl = "女";
        if (Math.round(Math.random())==1){
            return boy;
        }
        return girl;
    }
    @Test
    public void add() throws SQLException {//数据库插入工具
        JdbcTemplate jt=jdbcUtils.getJt();
        String sql="INSERT INTO STUDENTS(NAME, GENDER, DEPARTMENT,MAJOR,CLAS) VALUES (?, ?, ?,?,?)";
        String [] major= {"岩石工程","结构工程","市政工程","建筑设计","轨道工程","房屋设计"};
        for (int z=0;z<6;z++) {
            for (int j = 0; j < 66; j++) {
                if (j == 36) {
                    a++;
                }
                if(j==0){
                    a--;
                }
                jt.update(sql, "琳" + j, getage(), "建筑工程学院", major[z], a);
                System.out.println("学号：" +z+""+ j + "插入成功");
            }
        }
    }
}
