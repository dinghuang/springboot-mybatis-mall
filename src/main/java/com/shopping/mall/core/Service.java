package com.shopping.mall.core;

import org.apache.ibatis.exceptions.TooManyResultsException;
import tk.mybatis.mapper.entity.Condition;

import java.util.List;

public interface Service<T> {

    /**
     * 保存持久化
     *
     * @param model model
     */
    void save(T model);

    /**
     * 批量持久化
     *
     * @param models models
     */
    void save(List<T> models);

    /**
     * 通过主鍵刪除
     *
     * @param id id
     * @return int
     */
    int deleteById(Integer id);

    /**
     * 通过条件删除
     *
     * @param condition condition
     * @return int
     */
    int deleteByCondition(Condition condition);

    /**
     * 批量删除
     *
     * @param ids eg：ids -> "1,2,3,4"
     */
    void deleteByIds(String ids);

    /**
     * 更新
     *
     * @param model model
     */
    void update(T model);

    /**
     * 通过ID查找
     *
     * @param id id
     * @return T
     */
    T findById(Integer id);

    /**
     * 通过Model中某个成员变量名称（非数据表中column的名称）查找,value需符合unique约束
     *
     * @param fieldName fieldName
     * @param value     value
     * @return T
     * @throws TooManyResultsException TooManyResultsException
     */
    T findBy(String fieldName, Object value) throws TooManyResultsException;

    /**
     * 通过多个ID查找
     *
     * @param ids eg：ids -> "1,2,3,4"
     * @return List<T>
     */
    List<T> findByIds(String ids);

    /**
     * 根据条件查找
     *
     * @param condition condition
     * @return List<T>
     */
    List<T> findByCondition(Condition condition);

    /**
     * /获取所有
     *
     * @return List<T>
     */
    List<T> findAll();
}
