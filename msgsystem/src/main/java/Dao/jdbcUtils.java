package Dao;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class jdbcUtils {
    private static DataSource ds = null;

    static {
        Properties pro = new Properties();
        InputStream is = jdbcUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        try {
            pro.load(is);
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Jedis getJe() {
        JedisPool jp = new JedisPool("127.0.0.1", 6379);
        return jp.getResource();
    }

    public static JdbcTemplate getJt() {
        return new JdbcTemplate(ds);
    }

    public static DataSource getDs() {
        return ds;
    }

    public static Connection getConn() throws SQLException {
        return ds.getConnection();
    }

    @Test
    public void test() throws SQLException {
        jdbcUtils.getConn();
    }
}
