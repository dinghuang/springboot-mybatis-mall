package com.shopping.mall.controller;

import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.Evaluation;
import com.shopping.mall.service.EvaluationService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@Controller
@RequestMapping(value = "/mall/evaluation")
public class EvaluationController {

    private final EvaluationService evaluationService;

    @Autowired

    public EvaluationController(EvaluationService evaluationService) {
        this.evaluationService = evaluationService;
    }

    @ApiOperation("添加评价信息")
    @PutMapping
    public ResponseEntity<Boolean> addEvaluation(@ApiParam(value = "评价信息", required = true)
                                                 @RequestBody Evaluation evaluation) {

        return Optional.ofNullable(evaluationService.addEvaluation(evaluation))
                .map(result -> new ResponseEntity<>(result, HttpStatus.CREATED))
                .orElseThrow(() -> new CommonException("error.evaluation.create"));
    }

    @ApiOperation("根据产品编号获取评价信息")
    @GetMapping(value = "/query_evaluations/{productId}")
    public ResponseEntity<List<Evaluation>> getShoppingEvaluations(@ApiParam(value = "评价信息", required = true)
                                                                   @PathVariable int productId) {
        return Optional.ofNullable(evaluationService.getProductEvaluation(productId))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.query_evaluations"));
    }
}
