package com.shopping.mall.controller;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.shopping.mall.domain.PayDTO;
import com.shopping.mall.domain.Products;
import com.shopping.mall.domain.ShoppingRecord;
import com.shopping.mall.service.ProductsService;
import com.shopping.mall.service.ShoppingRecordService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.*;


/**
 * @author dinghuang123@gmail.com
 */
@Controller
@RequestMapping("/pay/alipay")
public class AlipayController {

    private static String APP_ID = "2016091400513177";
    private static String APP_PRIVATE_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC6AF0sFpWtP/YpiIVSfckpSCkvaj4aK0HW3kgIJbTWoqeuFIxGxXqem5qZ1xwHnzAEdL8lmYaJmI4faMUXQi4FiCs1yoRs43HxKgVFEV7NSwc2911e148zlSh4OLvmk3BxS4kU2uohvyhbWBFgnNERwgXwbrvEbV6KctDbJR7ZPwG6zBDRcnN54ukliu4a51MZevDP5E6+whaYhVYMuuX2nVZrrJsJzduB8jjkiNn2/FIgudn6pI9AOkmqoXCc2kSc6Hf2OxjcdXwmwdEhkT0BS/Shv2qkPKLRAqZGoCABKPAX8FeI8OziI1LGOa0aMTnvRmjh+v0+lv1yRc4lu6GjAgMBAAECggEBAI0el5JKtFcVDzQl01lp/ASpLi4+Qk3igfp+/VHJIfIyyFvIVUGgtM6/qkWMMkUKHwlSdnAVkkC1ESd9ewORf49M59PRCjX/PsTFp+fmLPI/OYMXnKzHiWuOgHzuNonTVV1v/Npo2XivKvRa1hxh/jGl7pGjwixe+nq6cAHEoSobWUMde9HEDjqrddDSRPslxnLOivHOlsgnhG+N4vMGdX3XwzCIHAcmL/xRCsfLsV5XTZB0saETFPyjukOlsZ0IbWWDlr/KI4BqJ4mQtl2bbSVynzOhceVsPPIpCTJH0jqaxcsQonQlsmp4fEEwHCMiM/fqmn1fpUmTDP0wnvxwDpECgYEA9cJhKQWg1O85RlqHQ7K/51w3NCieJjWf/OLEXz/0JgHvGwk7qDdz5fJgW/0PWstX2RFBhhnlpYGF9/fwSKsTiJusjYOZ+iKihLLLfxcGZG9+BhSH+YPSIjF16AQCTBR2SFpLZ+/JOEznahl266l53LGTRWQ21gLIbfvR1Fp8PTkCgYEAwcCFejFw5jCd1+IVm/kwatsdo56XRTGUvqR9NklrhT7hOlkhkiQyRMC3qbFTPLvYD8Oa74I3GD9x1OQH0Itl0P7i6sZ747nh6w03jCaiP03HNv7E4SDWZz0tUuQsAw/x1KmZUCOrkQQeRoDSRtj6LRNyspg2pysKoreJmpJbMbsCgYBp8mNqiOeeBId/gfWAROYgOov962jKdiHDposbuPlrDThkQmW6jjVjs0rBPWZKMRFtHdhOlImBAUac8QFggogIQ3xvAYX25MmFRYMfBfEWiU4eFunLsn17ijEXVesbm1KmvG53n1Ly94xoHBQ9YjGL5+3iY2KUflyjtYTu9BdNWQKBgBwCOsl5UDrWmFrXAgy0Lz2jQ1ud13xXOIt+t+MbJgHzHxgSPnoj5Whu+536VnAXL5rHyiQJjPFiapA+DqslG6jkz+TkoJBBFNmn5XnLM/U2xy+6ELgCyTvPajfraDlhGrKFefZN0cV69O14Pe2j/DZ78z7CJlRwMm9nXOsNcUV1AoGBAMdgArU/N2MFmyneN/JmWrEXp58c6whCqzVRMGIeTPY26eoOJThy+2GmuLNhNBqEkw001k+ylGvAcVhXSInChcikI3A5lnoGowLHjyWIgcJeQszmjwQKQHcfIHXzmb5KqFL2cZ5+niyEW4zVFx50Q3mGUjhsVx7yAs6toXnAWXfR";
    private static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAugBdLBaVrT/2KYiFUn3JKUgpL2o+GitB1t5ICCW01qKnrhSMRsV6npuamdccB58wBHS/JZmGiZiOH2jFF0IuBYgrNcqEbONx8SoFRRFezUsHNvddXtePM5UoeDi75pNwcUuJFNrqIb8oW1gRYJzREcIF8G67xG1einLQ2yUe2T8BuswQ0XJzeeLpJYruGudTGXrwz+ROvsIWmIVWDLrl9p1Wa6ybCc3bgfI45IjZ9vxSILnZ+qSPQDpJqqFwnNpEnOh39jsY3HV8JsHRIZE9AUv0ob9qpDyi0QKmRqAgASjwF/BXiPDs4iNSxjmtGjE570Zo4fr9Ppb9ckXOJbuhowIDAQAB";

    private static Logger logger = LoggerFactory.getLogger(AlipayController.class);

    @Autowired
    private ProductsService productsService;
    @Autowired
    private ShoppingRecordService shoppingRecordService;

    /**
     * 支付请求
     */
    @ApiOperation("支付宝支付")
    @GetMapping
    public void app(@RequestParam String jsonData, HttpServletResponse httpResponse) throws AlipayApiException, IOException {
        PayDTO payDTO = JSON.parseObject(jsonData, PayDTO.class);
        List<Integer> productsIds = payDTO.getProductsIds();
        List<Integer> productsCounts = payDTO.getProductsCounts();
        Integer totalPrice = 0;
        StringBuilder name = new StringBuilder();
        for (int i = 0; i < productsIds.size(); i++) {
            Products product = productsService.findById(productsIds.get(i));
            totalPrice += product.getPrice() * productsCounts.get(i);
            name.append(product.getName()).append("*").append(productsCounts.get(i)).append(";");
        }
        BigDecimal price = new BigDecimal(totalPrice);
        Double result = price.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        //初始化客户端 只需要实例化一次（线程安全）
        AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do"
                , APP_ID, APP_PRIVATE_KEY, "json", "UTF-8", ALIPAY_PUBLIC_KEY, "RSA2");
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        AlipayTradePagePayModel model = new AlipayTradePagePayModel();
        model.setBody("校园购物平台价格清单");
        model.setSubject(name.toString());
        model.setOutTradeNo(UUID.randomUUID().toString());
        model.setPassbackParams(JSON.toJSONString(payDTO));
        model.setTimeoutExpress("30m");
        model.setTotalAmount(result.toString());
        model.setProductCode("FAST_INSTANT_TRADE_PAY");
        alipayRequest.setBizModel(model);
        alipayRequest.setReturnUrl("http://39.104.86.85:8086/shopping_record");
        alipayRequest.setNotifyUrl("http://39.104.86.85:8086/pay/alipay/notify");
        String form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        httpResponse.setContentType("text/html;charset=utf-8");
        httpResponse.getWriter().write(form);//直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
    }

    @ApiOperation("通知")
    @PostMapping("/notify")
    public void notify(HttpServletRequest request) throws UnsupportedEncodingException {
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        String jsonData = params.get("passback_params");
        PayDTO payDTO = JSON.parseObject(jsonData, PayDTO.class);
        List<Integer> productsIds = payDTO.getProductsIds();
        List<Integer> productsCounts = payDTO.getProductsCounts();
        for (int i = 0; i < productsIds.size(); i++) {
            ShoppingRecord shoppingRecord = new ShoppingRecord();
            shoppingRecord.setUserId(payDTO.getUserId());
            shoppingRecord.setProductId(productsIds.get(i));
            shoppingRecord.setCounts(productsCounts.get(i));
            shoppingRecordService.addShoppingRecord(shoppingRecord);
        }
//        try {
//            boolean flag = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, "UTF-8", "RSA2");
//            if (flag) {
//
//                logger.info("付款成功");
//            }
//        } catch (AlipayApiException e) {
//            logger.info("错误日志", e);
//        }
    }
}
