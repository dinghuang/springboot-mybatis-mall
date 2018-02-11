package com.shopping.mall.service.imp;


import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.Evaluation;
import com.shopping.mall.mapper.EvaluationMapper;
import com.shopping.mall.service.EvaluationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
@Transactional
public class EvaluationServiceImpl extends AbstractService<Evaluation> implements EvaluationService {
    @Resource
    private EvaluationMapper evaluationMapper;

    @Override
    public List<Evaluation> getProductEvaluation(int productId) {
        return evaluationMapper.getProductEvaluation(productId);
    }
}
