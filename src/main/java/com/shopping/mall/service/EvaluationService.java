package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.Evaluation;

import java.util.List;


public interface EvaluationService extends Service<Evaluation> {

    /**
     * 根据productId获取评价
     *
     * @param productId productId
     * @return List<Evaluation>
     */
    List<Evaluation> getProductEvaluation(int productId);

    /**
     * 添加评价信息
     *
     * @param evaluation evaluation
     * @return 成功true
     */
    Boolean addEvaluation(Evaluation evaluation);
}
