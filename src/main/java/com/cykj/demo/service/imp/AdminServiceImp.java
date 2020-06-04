package com.cykj.demo.service.imp;

import com.alibaba.fastjson.JSON;
import com.cykj.demo.entity.Admin;
import com.cykj.demo.mapper.AdminMapper;
import com.cykj.demo.service.AdminService;
import com.cykj.demo.utils.LayuiData;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;

@Service("adminService")
public class AdminServiceImp implements AdminService {
    @Autowired
    public AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {
        Admin adminLogin = null;
        adminLogin = adminMapper.login(admin);
        return adminLogin;
    }

    @Override
    public LayuiData selectList(Admin admin, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        List<Admin> list = adminMapper.selectList(admin, start, pageSize);
        int count = adminMapper.selectListCount(admin);

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            System.out.println(admin);
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }
}
