package Dao;

import entity.user;
import org.springframework.jdbc.core.JdbcTemplate;
import redis.clients.jedis.Jedis;
import java.sql.*;
import java.util.*;

public class fu {

    public static boolean login(user use) throws SQLException {//最大的问题，没有导包到tomcat，耗时七小时，第一次用maven做项目。。
        Map<String, Object> map = null;
        Map<String, Object> set=null;
        JdbcTemplate jt=jdbcUtils.getJt();
        String sql = "SELECT password FROM loginuser WHERE username=?";
        try {
            set = jt.queryForMap(sql, use.getUsername());
        }catch (Exception e){
            System.out.println("账号错误");
            return false;
        }
        if(set.get("password").equals(use.getPassword())){
                return true;
        }else {
                System.out.println("密码错误");
                return false;
            }
    }
    public static Map<String,Double[]> main(String depart){
        String sql="SELECT major,COUNT(major) FROM students WHERE department=? GROUP BY major";
        JdbcTemplate jt=jdbcUtils.getJt();
        Map<String,Double[]> map=new HashMap<>();
        List<Map<String,Object>> li=new ArrayList<>();
        if (!"院系".equals(depart)) {
            li = jt.queryForList(sql, depart);
//        {MAJOR=会计学, COUNT(MAJOR)=78}
//        {MAJOR=财务管理, COUNT(MAJOR)=78}
//        {MAJOR=审计学, COUNT(MAJOR)=78}
//        {MAJOR=市场管理, COUNT(MAJOR)=78}
//        {MAJOR=国际商务, COUNT(MAJOR)=78}
//        {MAJOR=鉴证, COUNT(MAJOR)=78}
            Double sum = 0.0;
            for (Map<String, Object> l : li) {
                sum = sum + Integer.parseInt(String.valueOf(l.get("COUNT(major)")));
            }
            System.out.println(sum);
            for (Map<String, Object> l : li) {
                Double[] Doubles = new Double[2];
                Doubles[0] = Double.parseDouble(String.valueOf(l.get("COUNT(major)")));
                Doubles[1] = Double.valueOf(Math.round(Doubles[0] / sum * 1000));
                map.put(String.valueOf(l.get("major")), Doubles);
            }
            Double[] Doubles = new Double[2];
            Map<String,Object> girl=jt.queryForMap("SELECT COUNT(gender) FROM students WHERE gender='女' AND department=? GROUP BY gender",depart);
            Doubles[0] = sum;
            Doubles[1] = Double.parseDouble(String.valueOf(girl.get("COUNT(gender)")));
            map.put("sum", Doubles);
            return map;
        }
            sql="SELECT department,COUNT(department) FROM students GROUP BY department";
            li=jt.queryForList(sql);
        Double sum = 0.0;
        for (Map<String, Object> l : li) {
            sum = sum + Integer.parseInt(String.valueOf(l.get("COUNT(department)")));
        }
        for (Map<String, Object> l : li) {
            Double[] Doubles = new Double[2];
            Doubles[0] = Double.parseDouble(String.valueOf(l.get("COUNT(department)")));
            Doubles[1] = Double.valueOf(Math.round(Doubles[0] / sum * 1000));
            map.put(String.valueOf(l.get("department")), Doubles);
        }
        Double[] Doubles = new Double[2];
        Map<String,Object> girl=jt.queryForMap("SELECT COUNT(gender) FROM students WHERE gender='女' GROUP BY gender");
        Doubles[0] = sum;
        Doubles[1] = Double.parseDouble(String.valueOf(girl.get("COUNT(gender)")));
        map.put("sum", Doubles);
        return map;
        }
        public static int namequery(String name){//姓名查询的键值为 name0-10
            String sql="SELECT * FROM STUDENTS WHERE NAME=? ORDER BY no LIMIT 10 OFFSET 0";
            JdbcTemplate jt = jdbcUtils.getJt();
            Jedis je=jdbcUtils.getJe();
            List<Map<String,Object>> list=jt.queryForList(sql,name);//查询空不返回值
            if(list.isEmpty()){
                System.out.println("查询为空");
                return 0;
            }
            int index=0;
            for (Map<String,Object> map:list) {
                for (String set : map.keySet()) {
                    je.hset("sname" + String.valueOf(index), set, String.valueOf(map.get(set)));
                }
                je.expire("sname" + String.valueOf(index), 3000);
                index++;
            }
            System.out.println("遍历成功");
                return list.size();
        }
    public static int majorclassquery(String majorquery,String classquery){
        String sql = "SELECT * FROM students WHERE major=? AND clas=? ORDER BY no LIMIT 50 OFFSET 0";
        JdbcTemplate jt = jdbcUtils.getJt();
        Jedis je=jdbcUtils.getJe();
        List<Map<String,Object>> list=jt.queryForList(sql,majorquery,classquery);//查询空不返回值
        if(list.isEmpty()){
            System.out.println("查询为空");
            return 0;
        }
        int index=0;
        for (Map<String,Object> map:list){
            for (String set:map.keySet()){
                je.hset("smajor"+String.valueOf(index),set, String.valueOf(map.get(set)));
            }
            je.expire("smajor"+String.valueOf(index),3000);
            index++;
        }
        System.out.println("遍历成功");
        return list.size();
    }
    public static int departmentquery(String departmentquery){
//
        String sql = "SELECT * FROM students WHERE department=? ORDER BY no LIMIT 50 OFFSET 0";
        JdbcTemplate jt = jdbcUtils.getJt();
        Jedis je=jdbcUtils.getJe();
        List<Map<String,Object>> list=jt.queryForList(sql,departmentquery);//查询空不返回值
        if(list.isEmpty()){
            System.out.println("查询为空");
            return 0;
        }
        int index=0;
        for (Map<String,Object> map:list){
            for (String set:map.keySet()){
                je.hset("sdepartment"+String.valueOf(index),set, String.valueOf(map.get(set)));
            }
            je.expire("sdepartment"+String.valueOf(index),3000);
            index++;
        }
        System.out.println("遍历成功");
        return list.size();
    }
    public static List<Map<String,String>> queryjedis(String funciton,int length,int code){
        Jedis je=jdbcUtils.getJe();
        List<Map<String,String>> list=new ArrayList<>();
        int count = 10*code;
        if (funciton.equals("sname")){
            for (int i=(code-1)*10;i<length;i++) {
                list.add(je.hgetAll(funciton + i));
            }return list;
        }
        if ((length-count)<10 && (length-count)!=0){
            for (int i=code*10;i<length;i++) {
                list.add(je.hgetAll(funciton + i));
            }
        }else{
        for (int i=(code-1)*10;i<count;i++) {
            list.add(je.hgetAll(funciton + i));
        }}
        return list;
    }
    public static Map<String,String> querymsg(String function,int codeno){
        Jedis je=jdbcUtils.getJe();
        Map<String,String> map=je.hgetAll(function+codeno);
        return map;
    }
    }
