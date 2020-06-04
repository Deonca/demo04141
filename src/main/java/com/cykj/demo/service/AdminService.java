package com.cykj.demo.service;

import com.cykj.demo.entity.Admin;
import com.cykj.demo.utils.LayuiData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {
    public Admin login(Admin admin);
    public LayuiData selectList(Admin admin,int page,int pageSize);
}
