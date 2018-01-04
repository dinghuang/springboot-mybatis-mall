package com.shopping.mall.domain;

import javax.persistence.*;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "rolling")
public class Rolling {
    /**
     * 编号
     */
    @Id
    @Column(name = "rid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rid;
    /**
     * 商品编号
     */
    @Column(name = "mid")
    private Long mid;
    /**
     * 滚动图片
     */
    @Column(name = "rimg")
    private String rimg;

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getRimg() {
        return rimg;
    }

    public void setRimg(String rimg) {
        this.rimg = rimg;
    }
}
