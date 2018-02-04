package com.shopping.mall.service;

import com.shopping.mall.domain.Mc;
import com.shopping.mall.domain.Rolling;
import com.shopping.mall.mapper.McMapper;
import com.shopping.mall.mapper.RollingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/1/16.
 */
@Service
public class McService {

    @Autowired
    private McMapper mcMapper;

    public List<Mc> getMcs() {
        return mcMapper.selectAll();
    }

    public Mc getMc(Long mcId){
        return mcMapper.selectByPrimaryKey(mcId);
    }

    public int addMc(Mc mc){
        return mcMapper.insert(mc);
    }
    public int updateMc(Mc mc){
        return mcMapper.updateByPrimaryKey(mc);
    }

    public int deleteMc(Long mcId) {
        return mcMapper.deleteByPrimaryKey(mcId);
    }
}
