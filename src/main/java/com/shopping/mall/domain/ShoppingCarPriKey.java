package com.shopping.mall.domain;

import java.io.Serializable;


public class ShoppingCarPriKey implements Serializable {

    private int userId;

    private int productId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof ShoppingCarPriKey)) {
            return false;
        }

        ShoppingCarPriKey that = (ShoppingCarPriKey) o;

        if (userId != that.userId) return false;
        return productId == that.productId;

    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + productId;
        return result;
    }
}
