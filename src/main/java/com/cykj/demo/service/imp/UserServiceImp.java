package com.cykj.demo.service.imp;

import com.cykj.demo.entity.Admin;
import com.cykj.demo.entity.ScoreHistory;
import com.cykj.demo.entity.User;
import com.cykj.demo.mapper.AdminMapper;
import com.cykj.demo.mapper.ScoreHistoryMapper;
import com.cykj.demo.mapper.UserMapper;
import com.cykj.demo.service.AdminService;
import com.cykj.demo.service.UserService;
import com.cykj.demo.utils.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
public class UserServiceImp implements UserService {
    @Autowired
    public UserMapper userMapper;

    @Autowired
    public ScoreHistoryMapper scoreHistoryMapper;

    /**
     * 注册会员，送积分
     *
     * @param user
     * @return
     */
    @Override
    @Transactional//事务注解，需要在spring 配置文件中开启事务注解驱动
    //在实现类里面如果都用try -catch 包裹 ，则 spring 默认不为出错状态，事物不回滚
    public int reg(User user) {
        int n = 0;
        n = userMapper.add(user);
        ScoreHistory scoreHistory = new ScoreHistory();
        scoreHistory.setUserId(user.getId());
        scoreHistory.setScore(100);
        scoreHistory.setType(1);
//        try {
//            int aa = Integer.parseInt("aa");
        n += scoreHistoryMapper.add(scoreHistory);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return n;
    }


}
