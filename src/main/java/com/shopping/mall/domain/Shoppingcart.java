package com.shopping.mall.domain;

import javax.persistence.*;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "shoppingcart")
public class Shoppingcart {

    /**
     * 购物车编号
     */
    @Id
    @Column(name = "scid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scid;
    /**
     * 用户名
     */
    @Column(name = "tuser")
    private String tuser;
    /**
     * 商品ID
     */
    @Column(name = "mid")
    private Long mid;
    /**
     * 商品数
     */
    @Column(name = "sccount")
    private Long sccount;

    /**
     * 商品数
     */
    @Column(name = "timestamp")
    private Long timestamp;

    public Long getScid() {
        return scid;
    }

    public void setScid(Long scid) {
        this.scid = scid;
    }

    public String getTuser() {
        return tuser;
    }

    public void setTuser(String tuser) {
        this.tuser = tuser;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Long getSccount() {
        return sccount;
    }

    public void setSccount(Long sccount) {
        this.sccount = sccount;
    }
}
