package com.shopping.mall.domain;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "shopping_car")
public class ShoppingCar {
    @Id
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "product_price")
    private Integer productPrice;

    private Integer counts;

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * @return product_id
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * @param productId
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    /**
     * @return product_price
     */
    public Integer getProductPrice() {
        return productPrice;
    }

    /**
     * @param productPrice
     */
    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    /**
     * @return counts
     */
    public Integer getCounts() {
        return counts;
    }

    /**
     * @param counts
     */
    public void setCounts(Integer counts) {
        this.counts = counts;
    }
}