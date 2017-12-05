package com.shopping.mall.conf;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * Created by dinghuang on 2017/12/5.
 */
public interface BaseMapper<T> extends Mapper<T>, MySqlMapper<T> {
}
