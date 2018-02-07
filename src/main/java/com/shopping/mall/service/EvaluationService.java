package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.Evaluation;

import java.util.List;

/**
 * Created by CodeGenerator on 2018/02/02.
 */
public interface EvaluationService extends Service<Evaluation> {

    List<Evaluation> getProductEvaluation(int productId);
}
