package com.cykj.demo.mapper;

import com.cykj.demo.entity.Admin;
import com.cykj.demo.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {

    public int add(User user);


}
