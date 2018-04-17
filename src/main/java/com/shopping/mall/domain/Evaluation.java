package com.shopping.mall.domain;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class Evaluation implements Serializable {

    @Id
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "product_id")
    private Integer productId;

    private String time;

    private String content;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Evaluation{" +
                "userId=" + userId +
                ", productId=" + productId +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}