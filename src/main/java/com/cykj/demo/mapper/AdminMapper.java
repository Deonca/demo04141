package com.cykj.demo.mapper;

import com.cykj.demo.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


public interface AdminMapper {
    public Admin login(Admin admin);
    public int add(Admin admin);
    public List<Admin> selectList(@Param("e")Admin admin, @Param("start") int start,@Param("pageSize") int pageSize);
    public int selectListCount(@Param("e")Admin admin);
    public int delete(String[] ids);

}
