package com.shopping.mall.service;


import com.shopping.mall.domain.Bigmc;
import com.shopping.mall.mapper.BigmcMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/2/2.
 */
@Service
public class BigmcService  {
    @Autowired
    private BigmcMapper bigmcMapper;

    public List<Bigmc> getAll(){
        return bigmcMapper.selectAll();
    }
}
