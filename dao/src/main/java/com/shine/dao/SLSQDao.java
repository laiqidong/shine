package com.shine.dao;

import com.shine.model.ysl.SLSQ;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SLSQDao {
    List<SLSQ> getSlsqList(SLSQ slsq);
}
