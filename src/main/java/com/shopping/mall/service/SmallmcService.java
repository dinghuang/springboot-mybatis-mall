package com.shopping.mall.service;

import com.shopping.mall.domain.Smallmc;
import com.shopping.mall.mapper.SmallmcMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/2/2.
 */
@Service
public class SmallmcService {
    @Autowired
    private SmallmcMapper smallmcMapper;

    public List<Smallmc> getAll(){
        return smallmcMapper.selectAll();
    }
}
