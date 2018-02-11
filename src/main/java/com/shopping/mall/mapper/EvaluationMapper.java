package com.shopping.mall.mapper;

import com.shopping.mall.core.Mapper;
import com.shopping.mall.domain.Evaluation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EvaluationMapper extends Mapper<Evaluation> {

    List<Evaluation> getProductEvaluation(@Param("productId") int productId);

}