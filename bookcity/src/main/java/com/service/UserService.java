package com.service;


import com.dao.LoginDao;
import com.entity.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService {

    @Autowired
    private LoginDao loginDao;


    public void setLoginDao(LoginDao loginDao) {
        this.loginDao = loginDao;
    }

    public boolean UserTest(String username,String password){
        LoginUser queryuser = loginDao.queryForusername(username);
        System.out.println(queryuser);
        if (queryuser==null){
            return false;
        }
        if (password.equals(queryuser.getPassword())){
            return true;
        }{
            return false;
        }
    }

    public Boolean save(LoginUser loginUser){
        LoginUser queryuser = loginDao.queryForusername(loginUser.getUsername());
        if (queryuser==null) {
            loginDao.addusername(loginUser);
            loginDao.addReadingBook(loginUser.getUsername());
            return true;
        }else {
            return false;
        }
    }

    public LoginUser findUser(String username){
        return loginDao.queryForusername(username);
    }

    public void update(LoginUser user){
        loginDao.Updateuse(user);
    }
}
