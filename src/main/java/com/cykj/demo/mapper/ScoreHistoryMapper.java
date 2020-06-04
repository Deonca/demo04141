package com.cykj.demo.mapper;

import com.cykj.demo.entity.Admin;
import com.cykj.demo.entity.ScoreHistory;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ScoreHistoryMapper {

    public int add(ScoreHistory scoreHistory);


}
