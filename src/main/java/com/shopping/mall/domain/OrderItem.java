package com.shopping.mall.domain;

import javax.persistence.*;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "order_item")
public class OrderItem {
    /**
     * 编号
     */
    @Id
    @Column(name = "oiid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long oiid;
    /**
     * 所属订单
     */
    @Column(name = "oid")
    private Long oid;
    /**
     * 订购商品ID
     */
    @Column(name = "mid")
    private Long mid;
    /**
     * 商品数
     */
    @Column(name = "oicount")
    private Long oicount;
    /**
     * 小计
     */
    @Column(name = "oitotalprice")
    private Long oitotalprice;

    public Long getOiid() {
        return oiid;
    }

    public void setOiid(Long oiid) {
        this.oiid = oiid;
    }

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Long getOicount() {
        return oicount;
    }

    public void setOicount(Long oicount) {
        this.oicount = oicount;
    }

    public Long getOitotalprice() {
        return oitotalprice;
    }

    public void setOitotalprice(Long oitotalprice) {
        this.oitotalprice = oitotalprice;
    }
}
