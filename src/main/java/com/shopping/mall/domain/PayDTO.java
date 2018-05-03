package com.shopping.mall.domain;

import java.util.List;

/**
 * @author dinghuang123@gmail.com
 */
public class PayDTO {

    private List<Integer> productsIds;

    private List<Integer> productsCounts;

    private Integer userId;

    public List<Integer> getProductsIds() {
        return productsIds;
    }

    public void setProductsIds(List<Integer> productsIds) {
        this.productsIds = productsIds;
    }

    public List<Integer> getProductsCounts() {
        return productsCounts;
    }

    public void setProductsCounts(List<Integer> productsCounts) {
        this.productsCounts = productsCounts;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
