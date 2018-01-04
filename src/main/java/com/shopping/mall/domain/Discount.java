package com.shopping.mall.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "discount")
public class Discount {
    /**
     * 打折编号
     */
    @Id
    @Column(name = "did")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long did;

    /**
     * 商品编号
     */
    @Column(name = "did")
    private Long mid;

    /**
     * 小类编号
     */
    @Column(name = "sid")
    private Long sid;

    /**
     * 大类编号
     */
    @Column(name = "bid")
    private Long bid;

    /**
     * 开始时间
     */
    @Column(name = "dstartdate")
    private Date dstartdate;

    /**
     * 结束时间
     */
    @Column(name = "denddate")
    private Date denddate;

    /**
     * 折扣度
     */
    @Column(name = "ddiscount")
    private Long ddiscount;

    public Long getDid() {
        return did;
    }

    public void setDid(Long did) {
        this.did = did;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public Date getDstartdate() {
        return dstartdate;
    }

    public void setDstartdate(Date dstartdate) {
        this.dstartdate = dstartdate;
    }

    public Date getDenddate() {
        return denddate;
    }

    public void setDenddate(Date denddate) {
        this.denddate = denddate;
    }

    public Long getDdiscount() {
        return ddiscount;
    }

    public void setDdiscount(Long ddiscount) {
        this.ddiscount = ddiscount;
    }
}
