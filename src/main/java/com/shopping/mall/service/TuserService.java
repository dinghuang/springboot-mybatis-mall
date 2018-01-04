package com.shopping.mall.service;

import com.shopping.mall.domain.Tuser;
import com.shopping.mall.mapper.TuserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by dinghuang on 2018/1/3.
 */
@Service
public class TuserService {
    @Autowired
    private TuserMapper tuserMapper;

    public Tuser getTuser(String name){
        Tuser tuser = new Tuser();
        tuser.setTuser(name);
        return tuserMapper.selectOne(tuser);
    }


}
