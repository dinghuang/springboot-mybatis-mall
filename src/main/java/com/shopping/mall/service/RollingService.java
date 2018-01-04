package com.shopping.mall.service;

import com.shopping.mall.domain.Rolling;
import com.shopping.mall.mapper.RollingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/1/3.
 */
@Service
public class RollingService {
    @Autowired
    private RollingMapper rollingMapper;

    public List<Rolling> getRollings(){
        return rollingMapper.selectAll();
    }
}
