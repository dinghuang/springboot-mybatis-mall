package com.shopping.mall.domain;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "shopping_record")
public class ShoppingRecord implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "product_id")
    private Integer productId;

    private String time;

    @Column(name = "order_status")
    private Integer orderStatus;

    @Column(name = "product_price")
    private Integer productPrice;

    private Integer counts;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getCounts() {
        return counts;
    }

    public void setCounts(Integer counts) {
        this.counts = counts;
    }

    @Override
    public String toString() {
        return "ShoppingRecord{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", time='" + time + '\'' +
                ", orderStatus=" + orderStatus +
                ", productPrice=" + productPrice +
                ", counts=" + counts +
                '}';
    }
}