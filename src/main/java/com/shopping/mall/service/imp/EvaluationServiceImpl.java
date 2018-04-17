package com.shopping.mall.service.imp;


import com.shopping.mall.core.AbstractService;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.Evaluation;
import com.shopping.mall.mapper.EvaluationMapper;
import com.shopping.mall.service.EvaluationService;
import com.shopping.mall.service.ShoppingRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service
@Transactional(rollbackFor = CommonException.class)
public class EvaluationServiceImpl extends AbstractService<Evaluation> implements EvaluationService {

    private EvaluationMapper evaluationMapper;

    private ShoppingRecordService shoppingRecordService;

    public EvaluationServiceImpl(EvaluationMapper evaluationMapper,
                                 ShoppingRecordService shoppingRecordService) {
        this.evaluationMapper = evaluationMapper;
        this.shoppingRecordService = shoppingRecordService;
    }

    @Override
    public List<Evaluation> getProductEvaluation(int productId) {
        return evaluationMapper.getProductEvaluation(productId);
    }

    @Override
    public Boolean addEvaluation(Evaluation evaluation) {
        Boolean flag;
        if (shoppingRecordService.getUserProductRecord(evaluation.getUserId(), evaluation.getProductId())) {
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
            evaluation.setTime(sf.format(date));
            try {
                save(evaluation);
            } catch (Exception e) {
                throw new CommonException("error.addEvaluation");
            }
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }
}
