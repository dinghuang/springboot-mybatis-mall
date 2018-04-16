package com.shopping.mall.mapper;

import com.shopping.mall.core.Mapper;
import com.shopping.mall.domain.Evaluation;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface EvaluationMapper extends Mapper<Evaluation> {

    @Select("SELECT * from evaluation where product_id = #{productId}")
    List<Evaluation> getProductEvaluation(@Param("productId") int productId);

}