package com.shopping.mall.controller;

import com.shopping.mall.domain.Evaluation;
import com.shopping.mall.service.EvaluationService;
import com.shopping.mall.service.ShoppingRecordService;
import net.minidev.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by CodeGenerator on 2018/02/02.
*/
@Controller
public class EvaluationController {
    @Resource
    private EvaluationService evaluationService;

    @Resource
    private ShoppingRecordService shoppingRecordService;

    @RequestMapping(value = "/addShoppingEvaluation",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShoppingEvaluation(int userId, int productId, String content){
        System.out.println("我添加了"+userId+" "+productId);
        String result;
        if(shoppingRecordService.getUserProductRecord(userId,productId)){
            Evaluation evaluation = new Evaluation();
            evaluation.setUserId(userId);
            evaluation.setProductId(productId);
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
            evaluation.setTime(sf.format(date));
            evaluation.setContent(content);
            evaluationService.save(evaluation);
            result = "success";
        }
        else{
            result="noneRecord";
        }

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingEvaluations",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingEvaluations(int productId){
        List<Evaluation> evaluationList = evaluationService.getProductEvaluation(productId);
        String evaluations = JSONArray.toJSONString(evaluationList);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",evaluations);
        return resultMap;
    }
}
